package com.ruoyi.system.service;


import com.ruoyi.common.config.StreamConfig;
import com.ruoyi.common.core.domain.StreamChannel;
import com.ruoyi.common.core.domain.StreamInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PreDestroy;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 流媒体服务
 */
@Service
public class StreamService {

    private static final Logger log = LoggerFactory.getLogger(StreamService.class);

    private final ConcurrentHashMap<String, StreamChannel> channels = new ConcurrentHashMap<>();

    @Autowired
    private StreamConfig config;

    /**
     * 获取或创建流通道
     */
    public StreamChannel getOrCreateChannel(String streamId, String rtspUrl) {
        return channels.computeIfAbsent(streamId, id -> {
            StreamChannel channel = new StreamChannel(
                id,
                rtspUrl,
                config.getFfmpegPath(),
                config.getPreset(),
                config.getRtspTimeout()
            );
            channel.start();
            return channel;
        });
    }

    /**
     * 获取已存在的通道
     */
    public StreamChannel getChannel(String streamId) {
        return channels.get(streamId);
    }

    /**
     * 添加订阅者到指定通道
     */
    public boolean subscribe(String streamId, OutputStream output) {
        StreamChannel channel = channels.get(streamId);
        if (channel != null && channel.isRunning()) {
            channel.addSubscriber(output);
            return true;
        }
        return false;
    }

    /**
     * 移除订阅者
     */
    public void unsubscribe(String streamId, OutputStream output) {
        StreamChannel channel = channels.get(streamId);
        if (channel != null) {
            channel.removeSubscriber(output);
        }
    }

    /**
     * 停止指定通道
     */
    public void stopChannel(String streamId) {
        StreamChannel channel = channels.remove(streamId);
        if (channel != null) {
            channel.stop();
            log.info("Channel stopped: {}", streamId);
        }
    }

    /**
     * 获取所有通道信息
     */
    public List<StreamInfo> listChannels() {
        List<StreamInfo> list = new ArrayList<>();
        for (StreamChannel channel : channels.values()) {
            String flvUrl = "/stream/live/" + channel.getStreamId() + ".flv";
            list.add(new StreamInfo(channel, flvUrl));
        }
        return list;
    }

    /**
     * 获取活跃通道数量
     */
    public int getActiveCount() {
        return (int) channels.values().stream()
            .filter(StreamChannel::isRunning)
            .count();
    }

    /**
     * 检查通道是否存在且运行中
     */
    public boolean isChannelActive(String streamId) {
        StreamChannel channel = channels.get(streamId);
        return channel != null && channel.isRunning();
    }

    /**
     * 停止所有通道
     */
    @PreDestroy
    public void stopAll() {
        log.info("Stopping all stream channels...");
        for (StreamChannel channel : channels.values()) {
            try {
                channel.stop();
            } catch (Exception e) {
                log.error("Error stopping channel {}: {}", channel.getStreamId(), e.getMessage());
            }
        }
        channels.clear();
        log.info("All stream channels stopped");
    }
}
