package com.ruoyi.common.core.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * 流媒体广播通道
 * 一个RTSP源对应一个通道，支持多客户端订阅
 */
public class StreamChannel {

    private static final Logger log = LoggerFactory.getLogger(StreamChannel.class);

    private final String streamId;
    private final String rtspUrl;
    private final String ffmpegPath;
    private final String preset;
    private final long rtspTimeout;

    private Process process;
    private volatile boolean running = false;
    private final List<OutputStream> subscribers = new CopyOnWriteArrayList<>();
    private byte[] flvHeader;
    private long startTime;

    public StreamChannel(String streamId, String rtspUrl, String ffmpegPath, String preset, long rtspTimeout) {
        this.streamId = streamId;
        this.rtspUrl = rtspUrl;
        this.ffmpegPath = ffmpegPath;
        this.preset = preset;
        this.rtspTimeout = rtspTimeout;
    }

    /**
     * 启动FFmpeg转流
     */
    public synchronized void start() {
        if (running) {
            return;
        }
        running = true;
        startTime = System.currentTimeMillis();

        try {
            List<String> cmd = Arrays.asList(
                ffmpegPath,
                "-rtsp_transport", "tcp",
                "-stimeout", String.valueOf(rtspTimeout),
                "-i", rtspUrl,
                "-c:v", "libx264",
                "-preset", preset,
                "-tune", "zerolatency",
                "-profile:v", "baseline",
                "-level", "3.1",
                "-g", "30",
                "-c:a", "aac",
                "-ar", "44100",
                "-ac", "2",
                "-f", "flv",
                "-flvflags", "no_duration_filesize",
                "pipe:1"
            );
            System.out.println(cmd);
            ProcessBuilder pb = new ProcessBuilder(cmd);
            pb.redirectErrorStream(false);
            process = pb.start();

            // 广播线程
            Thread broadcaster = new Thread(this::broadcast, "stream-" + streamId);
            broadcaster.setDaemon(true);
            broadcaster.start();

            // 错误日志线程
            Thread logger = new Thread(this::logErrors, "stream-log-" + streamId);
            logger.setDaemon(true);
            logger.start();

            log.info("Stream channel started: {}", streamId);

        } catch (IOException e) {
            running = false;
            log.error("Failed to start stream {}: {}", streamId, e.getMessage());
            throw new RuntimeException("启动流失败: " + e.getMessage(), e);
        }
    }

    /**
     * 广播FLV数据给所有订阅者
     */
    private void broadcast() {
        byte[] buffer = new byte[4096];
        ByteArrayOutputStream headerBuffer = new ByteArrayOutputStream();
        boolean headerCaptured = false;

        try (InputStream input = process.getInputStream()) {
            int bytesRead;
            while (running && (bytesRead = input.read(buffer)) != -1) {
                byte[] data = Arrays.copyOf(buffer, bytesRead);

                // 捕获FLV头部（用于新客户端加入时发送）
                if (!headerCaptured) {
                    headerBuffer.write(data);
                    if (headerBuffer.size() >= 13) {
                        flvHeader = headerBuffer.toByteArray();
                        headerCaptured = true;
                    }
                }

                // 广播给所有订阅者
                for (OutputStream subscriber : subscribers) {
                    try {
                        subscriber.write(data);
                        subscriber.flush();
                    } catch (IOException e) {
                        subscribers.remove(subscriber);
                        log.debug("Subscriber disconnected from channel {}", streamId);
                    }
                }
            }
        } catch (IOException e) {
            if (running) {
                log.error("Broadcast error for {}: {}", streamId, e.getMessage());
            }
        } finally {
            running = false;
            log.info("Stream channel stopped: {}", streamId);
        }
    }

    /**
     * 记录FFmpeg错误输出
     */
    private void logErrors() {
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(process.getErrorStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("error") || line.contains("Error")) {
                    log.warn("[FFmpeg {}] {}", streamId, line);
                } else {
                    log.debug("[FFmpeg {}] {}", streamId, line);
                }
            }
        } catch (IOException e) {
            // ignore
        }
    }

    /**
     * 添加订阅者
     */
    public void addSubscriber(OutputStream output) {
        // 先发送FLV头
        if (flvHeader != null) {
            try {
                output.write(flvHeader);
                output.flush();
            } catch (IOException e) {
                log.warn("Failed to send FLV header to subscriber");
                return;
            }
        }
        subscribers.add(output);
        log.info("Subscriber added to channel {}, total: {}", streamId, subscribers.size());
    }

    /**
     * 移除订阅者
     */
    public void removeSubscriber(OutputStream output) {
        subscribers.remove(output);
        log.debug("Subscriber removed from channel {}, remaining: {}", streamId, subscribers.size());
    }

    /**
     * 停止通道
     */
    public synchronized void stop() {
        running = false;
        if (process != null && process.isAlive()) {
            process.destroyForcibly();
        }
        // 关闭所有订阅者连接
        for (OutputStream subscriber : subscribers) {
            try {
                subscriber.close();
            } catch (IOException e) {
                // ignore
            }
        }
        subscribers.clear();
        log.info("Stream channel destroyed: {}", streamId);
    }

    // Getters

    public String getStreamId() {
        return streamId;
    }

    public String getRtspUrl() {
        return rtspUrl;
    }

    public boolean isRunning() {
        return running;
    }

    public int getSubscriberCount() {
        return subscribers.size();
    }

    public long getUptime() {
        return running ? System.currentTimeMillis() - startTime : 0;
    }
}
