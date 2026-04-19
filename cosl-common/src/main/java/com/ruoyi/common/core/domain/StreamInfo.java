package com.ruoyi.common.core.domain;

/**
 * 流信息VO
 */
public class StreamInfo {

    private String streamId;
    private String rtspUrl;
    private String flvUrl;
    private boolean running;
    private int subscriberCount;
    private long uptime;

    public StreamInfo() {
    }

    public StreamInfo(StreamChannel channel, String flvUrl) {
        this.streamId = channel.getStreamId();
        this.rtspUrl = channel.getRtspUrl();
        this.flvUrl = flvUrl;
        this.running = channel.isRunning();
        this.subscriberCount = channel.getSubscriberCount();
        this.uptime = channel.getUptime();
    }

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

    public String getFlvUrl() {
        return flvUrl;
    }

    public void setFlvUrl(String flvUrl) {
        this.flvUrl = flvUrl;
    }

    public boolean isRunning() {
        return running;
    }

    public void setRunning(boolean running) {
        this.running = running;
    }

    public int getSubscriberCount() {
        return subscriberCount;
    }

    public void setSubscriberCount(int subscriberCount) {
        this.subscriberCount = subscriberCount;
    }

    public long getUptime() {
        return uptime;
    }

    public void setUptime(long uptime) {
        this.uptime = uptime;
    }
}
