package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;

/**
 * 创建底库人员响应数据对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class MonitorCreateData implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 底库人员id */
    private String monitorId;
}
