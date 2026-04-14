package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 图片分析响应数据对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ImageAnalysisData implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 年龄 (0: 未知, 1: 儿童, 2: 青年, 3: 成年, 4: 老年) */
    private Integer age;

    /** 拍摄角度 */
    private Integer angle;

    /** angle的原始数组数据 */
    private List<Integer> anglesArr;

    /** 绑定时间 */
    private String createTime;

    /** 模糊程度-1，0，1 */
    private Integer dayNight;

    /** deviceId */
    private String deviceId;

    /** 特征相关信息压缩包下载地址 */
    private String downloadPath;

    /** 结束时间 */
    private String endTime;

    /** 人脸图绝对地址 */
    private String facePath;

    /** 人脸坐标 */
    private List<Integer> faceRect;

    /** 人脸数量 */
    private Integer faceSize;

    /** 特征ID */
    private String featureId;

    /** 特征行为类型 (0: 其他, 1: 半身, 2: 全身, 3: 骑车) */
    private Integer gaitType;

    /** 性别 (0: 未知, 1: 男, 2: 女) */
    private Integer gender;

    /** 【过期字段】是否有车 */
    private Boolean hasBike;

    /** 【过期字段】是否国标特征 */
    private Integer isGBHistory;

    /** 是否是关键帧步态 */
    private Boolean keyframes;

    /** 经度 */
    private Double latitude;

    /** 纬度 */
    private Double longitude;

    /** mainImage */
    private String mainImage;

    /** 特征主视频id */
    private String mainVideoSourceId;

    /** 节点地址 */
    private String nodeId;

    /** 特征性别 (0: 未知, 1: 男, 2: 女) */
    private Integer originalGender;

    /** 特征预览图 */
    private String originalImage;

    /** 特征预览图 */
    private String previewImage;

    /** 内部字段，无需使用 */
    private String privateOriginalFacePath;

    /** 内部字段，无需使用 */
    private String privateOriginalImagesPath;

    /** 内部字段，无需使用 */
    private String privateOriginalOriginalImage;

    /** 内部字段，无需使用 */
    private String privateOriginalPreviewImage;

    /** 内部字段，无需使用 */
    private String privateOriginalVideoSourceName;

    /** realTargetType */
    private Integer realTargetType;

    /** 所属文件服务ID，级联环境下表示最下级原始的文件服务id */
    private String regionId;

    /** 人体坐标 */
    private List<Integer> reidRect;

    /** 序列数量(帧数) */
    private Integer sequenceCount;

    /** 序列图url, 序列图，只有小于45帧的步态序列才会返回序列图，否则返回视频 */
    private String sequenceImgUrl;

    /** 序列视频url, 序列视频，大于45帧的步态序列不会直接返回步态序列图，而是视频 */
    private String sequenceVideoUrl;

    /** 检索源ID，可能是摄像头id或视频id */
    private String sourceIdentify;

    /** 视频源类型 (0: 摄像头, 1: 离线视频, 2: 国标历史, 3: 图片) */
    private Integer sourceType;

    /** 开始时间 */
    private String startTime;

    /** 特征类型 */
    private Integer targetType;

    /** 特征帧率 */
    private Integer totalFrame;

    /** 算法版本 */
    private Integer version;

    /** 视频源名称 */
    private String videoSourceName;

    /** 视频地址 */
    private String videoUrl;

    /** 特征压缩包 */
    private String zipUrl;
}
