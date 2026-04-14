package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 摄像机启停请求对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class CameraSetupRequest implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 摄像机ID列表 */
    private List<String> cameraIds;

    /** 设备ID列表 */
    private List<String> deviceIds;

    /** 是否启用 */
    private Boolean isEnable;
}
