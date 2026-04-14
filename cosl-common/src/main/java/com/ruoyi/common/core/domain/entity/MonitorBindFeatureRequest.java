package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 绑定底库人员特征请求对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class MonitorBindFeatureRequest implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 特征id列表 */
    private List<String> featureIds;

    /** 特征id列表（过期字段） */
    private List<String> gaitIDs;

    /** 底库人员id */
    private String monitorId;
}
