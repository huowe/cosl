package com.ruoyi.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "stream")
public class StreamConfig {

    /**
     * FFmpeg可执行文件路径
     */
    private String ffmpegPath = "ffmpeg";

    /**
     * RTSP连接超时时间（微秒）
     */
    private long rtspTimeout = 5000000;

    /**
     * 视频编码预设
     */
    private String preset = "ultrafast";

    public String getFfmpegPath() {
        return ffmpegPath;
    }

    public void setFfmpegPath(String ffmpegPath) {
        this.ffmpegPath = ffmpegPath;
    }

    public long getRtspTimeout() {
        return rtspTimeout;
    }

    public void setRtspTimeout(long rtspTimeout) {
        this.rtspTimeout = rtspTimeout;
    }

    public String getPreset() {
        return preset;
    }

    public void setPreset(String preset) {
        this.preset = preset;
    }
}
