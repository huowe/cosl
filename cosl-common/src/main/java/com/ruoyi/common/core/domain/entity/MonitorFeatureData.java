package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;

/**
 * 底库人员特征数据对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class MonitorFeatureData implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 拍摄角度 */
    private Integer angle;

    /** 创建时间 */
    private String createTime;

    /** 设备id(sourceType为0, 且为国标摄像头时有值) */
    private String deviceId;

    /** 人脸图片 无人脸为空 */
    private String facePath;

    /** 特征id(过期字段) */
    private String featureId;

    /** 特征id */
    private String gaitID;

    /** 主控服务器特征预览图 */
    private String masterOriginalImage;

    /** 特征预览图 */
    private String originalImage;

    /** 预览图 */
    private String previewImage;

    /** 序列数量(帧数) */
    private Integer sequenceCount;

    /** 步态序列图 可能为空 为空时sequenceVideoUrl必不为空 */
    private String sequenceImgUrl;

    /** 步态序列视频 序列图视频文件 需前端处理为序列图 */
    private String sequenceVideoUrl;

    /** 视频源ID,可能是摄像头id或视频id */
    private String sourceIdentify;

    /** 视频源类型(0:摄像头,1:离线视频) */
    private Integer sourceType;

    /** targetType枚举类 */
    private Integer targetType;

    /** 来源名称(摄像头名称或视频名称) */
    private String videoSourceName;

    /** 视频片段 */
    private String videoUrl;

    /** zip压缩 */
    private String zipUrl;
}
