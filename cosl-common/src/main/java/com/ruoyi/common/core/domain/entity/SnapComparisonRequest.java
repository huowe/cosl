package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 和抓拍比对请求对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class SnapComparisonRequest implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 特征Id列表 */
    private List<String> featureIds;

    /** 返回特征必须包含什么，1 人脸 2 人体 3 人脸&人体 4 步态&人体 5 人脸&步态&人体 */
    private Integer dataType;

    /** 比对模式(使用比对目标的那部分信息进行比对,1:人体,2:人脸,7:步态,100:人体+人脸,101:人体+步态,102:人脸+步态,103:人体+人脸+步态)，默认103 */
    private Integer targetType;

    /** 步态比对阈值，不能小于0.01，默认0.5 */
    private Double gaitThd;

    /** 取前N条记录 */
    private Integer topN;

    /** 人脸比对阈值，不能小于0.01，默认0.5 */
    private Double faceThd;

    /** 忽略路人库检索结果 */
    private List<String> ignoreFeatureIds;

    /** 检索目标是否是底库人员 */
    private Boolean isMonitor;

    /** 人体比对阈值，不能小于0.01，默认0.5 */
    private Double reidThd;

    /** 每页数量 */
    private Integer size;

    /** 检索源类型[0: 摄像机 1：视频 2：国标历史 10：所有摄像机 11：所有视频] */
    private Integer sourceType;

    /** 特征Id列表(过期字段) */
    private List<String> gaitIDs;

    /** 抓拍记录开始时间 */
    private String startTime;

    /** 抓拍记录结束时间 */
    private String endTime;

    /** 分页page */
    private Integer page;

    /** 摄像机ID列表 */
    private List<String> sourceIds;
}
