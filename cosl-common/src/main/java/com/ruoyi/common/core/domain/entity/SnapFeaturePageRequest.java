package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 抓拍特征分页查询请求对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class SnapFeaturePageRequest implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 摄像机id列表 */
    private List<String> cameraIds;

    /** 设备ID列表 */
    private List<String> deviceIds;

    /** 结束时间 */
    private String endTime;

    /** 当前页码 */
    private Integer pageNo;

    /** 每页数量 */
    private Integer pageSize;

    /** 开始时间 */
    private String startTime;

    /** 返回特征必须包含哪些信息(1:人体,2:人脸,7:步态) */
    private List<Integer> targetType;
}
