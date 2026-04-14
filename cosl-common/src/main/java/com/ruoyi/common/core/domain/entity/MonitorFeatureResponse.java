package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 获取底库人员特征响应对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class MonitorFeatureResponse implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 返回码 SUCCESS为成功 */
    private String code;

    /** 返回消息 */
    private String msg;

    /** 请求是否成功 */
    private Boolean success;

    /** 返回数据 */
    private List<MonitorFeatureData> data;
}
