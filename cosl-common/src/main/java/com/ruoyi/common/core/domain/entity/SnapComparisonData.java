package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 和抓拍比对响应数据对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class SnapComparisonData implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 总数 */
    private Integer allCount;

    /** 人脸数量 */
    private Integer faceCount;

    /** 步态数量 */
    private Integer gaitCount;

    /** 消息 */
    private String message;

    /** 分页对象 */
    private ComparisonPage page;

    /** 人体数量 */
    private Integer reidCount;

    /**
     * 分页对象内部类
     */
    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ComparisonPage implements Serializable
    {
        private static final long serialVersionUID = 1L;

        /** 记录列表 */
        private List<SnapComparisonRecord> records;
    }

    /**
     * 比对记录对象
     */
    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SnapComparisonRecord extends ImageAnalysisData implements Serializable
    {
        private static final long serialVersionUID = 1L;

        /** 综合相似度 */
        private Double comprehensiveSim;

        /** 人脸相似度 */
        private Double faceSim;

        /** 步态相似度 */
        private Double gaitSim;

        /** 底库人员id, 底库比对时有值 */
        private String monitorId;

        /** 底库人员名称, 底库比对时有值 */
        private String monitorName;

        /** 人体相似度 */
        private Double reidSim;

        /** 相似度 */
        private Double sim;
    }
}
