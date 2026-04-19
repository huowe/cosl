package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.domain.AjaxResult;

import com.ruoyi.common.core.domain.StreamChannel;
import com.ruoyi.common.core.domain.StreamDTO;
import com.ruoyi.common.core.domain.StreamInfo;
import com.ruoyi.system.service.StreamService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 流媒体控制器
 */
@RestController
@RequestMapping("/stream")
public class StreamController {

    private static final Logger log = LoggerFactory.getLogger(StreamController.class);

    @Autowired
    private StreamService streamService;

    /**
     * HTTP-FLV播放接口
     * 访问地址: /stream/live/{streamId}.flv
     */
    @GetMapping(value = "/live/{streamId}.flv", produces = "video/x-flv")
    public void playFlv(
            @PathVariable String streamId,
            HttpServletRequest request,
            HttpServletResponse response) {

        StreamChannel channel = streamService.getChannel(streamId);
        if (channel == null || !channel.isRunning()) {
            try {
                response.sendError(404, "Stream not found or not running");
            } catch (IOException e) {
                // ignore
            }
            return;
        }

        // 设置响应头
        response.setContentType("video/x-flv");
        response.setHeader("Connection", "keep-alive");
        response.setHeader("Cache-Control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "*");

        OutputStream output = null;
        try {
            response.flushBuffer();
            output = response.getOutputStream();
            channel.addSubscriber(output);

            // 保持连接直到客户端断开
            while (channel.isRunning()) {
                Thread.sleep(1000);
                // 检查客户端是否断开（通过尝试获取远程地址）
                if (request.getRemoteAddr() == null) {
                    break;
                }
            }
        } catch (Exception e) {
            log.debug("Client disconnected from stream {}: {}", streamId, e.getMessage());
        } finally {
            if (output != null) {
                channel.removeSubscriber(output);
            }
        }
    }

    /**
     * 启动转流
     */
    @PostMapping("/start")
    public AjaxResult startStream(@RequestBody StreamDTO dto) {
        if (dto.getStreamId() == null || dto.getStreamId().isEmpty()) {
            return AjaxResult.error("streamId不能为空");
        }
        if (dto.getRtspUrl() == null || dto.getRtspUrl().isEmpty()) {
            return AjaxResult.error("rtspUrl不能为空");
        }

        try {
            streamService.getOrCreateChannel(dto.getStreamId(), dto.getRtspUrl());

            Map<String, Object> result = new HashMap<>();
            result.put("streamId", dto.getStreamId());
            result.put("flvUrl", "/stream/live/" + dto.getStreamId() + ".flv");
            result.put("message", "流已启动");

            return AjaxResult.success(result);
        } catch (Exception e) {
            log.error("Failed to start stream: {}", e.getMessage());
            return AjaxResult.error("启动失败: " + e.getMessage());
        }
    }

    /**
     * 停止转流
     */
    @PostMapping("/stop/{streamId}")
    public AjaxResult stopStream(@PathVariable String streamId) {
        streamService.stopChannel(streamId);
        return AjaxResult.success("流已停止");
    }

    /**
     * 获取所有流列表
     */
    @GetMapping("/list")
    public AjaxResult listStreams() {
        List<StreamInfo> list = streamService.listChannels();
        return AjaxResult.success(list);
    }

    /**
     * 获取指定流状态
     */
    @GetMapping("/status/{streamId}")
    public AjaxResult getStreamStatus(@PathVariable String streamId) {
        StreamChannel channel = streamService.getChannel(streamId);
        if (channel == null) {
            return AjaxResult.error("流不存在");
        }

        String flvUrl = "/stream/live/" + streamId + ".flv";
        StreamInfo info = new StreamInfo(channel, flvUrl);
        return AjaxResult.success(info);
    }

    /**
     * 停止所有流
     */
    @PostMapping("/stopAll")
    public AjaxResult stopAllStreams() {
        streamService.stopAll();
        return AjaxResult.success("所有流已停止");
    }

    /**
     * CORS预检请求
     */
    @RequestMapping(value = "/live/{streamId}.flv", method = RequestMethod.OPTIONS)
    public void handleOptions(HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "*");
        response.setHeader("Access-Control-Max-Age", "3600");
    }
}
