package com.ruoyi.common.core.domain;

/**
 * 流媒体请求参数
 */
public class StreamDTO {

    /**
     * 流ID（唯一标识）
     */
    private String streamId;

    /**
     * RTSP地址
     */
    private String rtspUrl;

    public String getStreamId() {
        return streamId;
    }

    public void setStreamId(String streamId) {
        this.streamId = streamId;
    }

    public String getRtspUrl() {
        return rtspUrl;
    }

    public void setRtspUrl(String rtspUrl) {
        this.rtspUrl = rtspUrl;
    }
}
