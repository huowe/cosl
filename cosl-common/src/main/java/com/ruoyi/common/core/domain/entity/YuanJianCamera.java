package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 摄像头对象 camera
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class YuanJianCamera extends BaseEntity
{

    private static final long serialVersionUID = 1L;

    private String cameraGroupId;
    /** 摄像头名称 */
    @Excel(name = "摄像头名称")
    private String cameraName;

    /** IP 地址 */
    @Excel(name = "IP 地址")
    private String ip;

    @Excel(name = "纬度", cellType = ColumnType.NUMERIC)
    private BigDecimal latitude;

    @Excel(name = "经度", cellType = ColumnType.NUMERIC)
    private BigDecimal longitude;

    @Excel(name = "流地址")
    private String streamURL;

    @Excel(name = "用户名")
    private String userName;

    @Excel(name = "密码")
    private String userPwd;

    @Excel(name = "摄像头ID")
    private String cameraId;

    private String cameraType;

}
