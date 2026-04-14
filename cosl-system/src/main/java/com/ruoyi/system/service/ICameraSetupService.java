package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.CameraSetupRequest;

/**
 * 摄像机启停 Service 接口
 * 
 * @author ruoyi
 */
public interface ICameraSetupService
{
    /**
     * 启用摄像机抓拍
     * 
     * @param cameraIds 摄像机ID列表
     * @param deviceIds 设备ID列表
     * @return 响应结果
     */
    public String enableCamera(java.util.List<String> cameraIds, java.util.List<String> deviceIds);
    
    /**
     * 停用摄像机抓拍
     * 
     * @param cameraIds 摄像机ID列表
     * @param deviceIds 设备ID列表
     * @return 响应结果
     */
    public String disableCamera(java.util.List<String> cameraIds, java.util.List<String> deviceIds);
    
    /**
     * 摄像机启停操作
     * 
     * @param request 启停请求对象
     * @return 响应结果
     */
    public String setupCamera(CameraSetupRequest request);
}
