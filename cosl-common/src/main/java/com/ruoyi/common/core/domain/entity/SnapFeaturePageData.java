package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;

/**
 * 抓拍特征分页查询响应数据对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class SnapFeaturePageData implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 特征列表 */
    private java.util.List<ImageAnalysisData> features;

    /** 总数 */
    private Integer total;
}
