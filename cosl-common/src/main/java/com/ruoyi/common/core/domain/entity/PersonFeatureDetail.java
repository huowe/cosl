package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 人员特征详情对象 person_feature_detail
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
public class PersonFeatureDetail implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 底库人员id */
    private String monitorId;

    /** 特征id */
    private String featureId;

    /** 拍摄角度 */
    private Integer angle;

    /** 创建时间 */
    private String createTime;

    /** 设备id */
    private String deviceId;

    /** 人脸图片base64 */
    private String facePath;

    /** 主控服务器特征预览图base64 */
    private String masterOriginalImage;

    /** 特征预览图base64 */
    private String originalImage;

    /** 预览图base64 */
    private String previewImage;

    /** 序列数量(帧数) */
    private Integer sequenceCount;

    /** 步态序列图base64 */
    private String sequenceImgUrl;

    /** 步态序列视频 */
    private String sequenceVideoUrl;

    /** 视频源ID */
    private String sourceIdentify;

    /** 视频源类型(0:摄像头,1:离线视频) */
    private Integer sourceType;

    /** 特征类型(1:人体,2:人脸,7:步态等) */
    private Integer targetType;

    /** 来源名称 */
    private String videoSourceName;

    /** 视频片段 */
    private String videoUrl;

    /** zip压缩 */
    private String zipUrl;

    /** 记录创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date recordCreateTime;

    /** 删除标志 0-未删除 1-已删除 */
    private Integer deleted;
}
