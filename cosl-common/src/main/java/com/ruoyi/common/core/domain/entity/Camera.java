package com.ruoyi.common.core.domain.entity;

import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.math.BigDecimal;

/**
 * 摄像头对象 camera
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Camera extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 摄像头名称 */
    @Excel(name = "摄像头名称")
    private String name;

    /** IP 地址 */
    @Excel(name = "IP 地址")
    private String ip;

    /** 楼层 */
    @Excel(name = "楼层")
    private String floor;

    /** 状态 ONLINE/OFFLINE/MAINTENANCE */
    @Excel(name = "状态", readConverterExp = "ONLINE=在线，OFFLINE=离线，MAINTENANCE=维护中")
    private String status;

    /** X 轴坐标 */
    @Excel(name = "X 轴坐标", cellType = ColumnType.NUMERIC)
    private double xAxis;

    /** Y 轴坐标 */
    @Excel(name = "Y 轴坐标", cellType = ColumnType.NUMERIC)
    private double yAxis;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    @NotBlank(message = "摄像头名称不能为空")
    @Size(min = 0, max = 100, message = "摄像头名称长度不能超过100个字符")
    public String getName()
    {
        return name;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    @NotBlank(message = "IP 地址不能为空")
    @Size(min = 0, max = 50, message = "IP 地址长度不能超过50个字符")
    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip) 
    {
        this.ip = ip;
    }

    @Size(min = 0, max = 10, message = "楼层长度不能超过10个字符")
    public String getFloor()
    {
        return floor;
    }

    public void setFloor(String floor) 
    {
        this.floor = floor;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public void setxAxis(double xAxis)
    {
        this.xAxis = xAxis;

    }
    public Double getxAxis()
    {
        return xAxis;
    }
    public void setyAxis(double yAxis)
    {
        this.yAxis = yAxis;

    }
    public Double getyAxis()
    {
        return yAxis;
    }
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("ip", getIp())
            .append("floor", getFloor())
            .append("status", getStatus())
            .append("xAxis", getxAxis())
            .append("yAxis", getyAxis())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
