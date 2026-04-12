package com.ruoyi.common.core.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 人员轨迹对象 person_track
 * 
 * @author ruoyi
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class PersonTrack extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 人员 ID */
    @Excel(name = "人员 ID", cellType = ColumnType.NUMERIC)
    private Long personId;

    /** 摄像头 ID */
    @Excel(name = "摄像头 ID", cellType = ColumnType.NUMERIC)
    private Long cameraId;

    /** 抓拍时间 */
    @Excel(name = "抓拍时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date captureTime;

    /** X 轴坐标 */
    @Excel(name = "X 轴坐标", cellType = ColumnType.NUMERIC)
    private BigDecimal xAxis;

    /** Y 轴坐标 */
    @Excel(name = "Y 轴坐标", cellType = ColumnType.NUMERIC)
    private BigDecimal yAxis;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setPersonId(Long personId) 
    {
        this.personId = personId;
    }

    public Long getPersonId() 
    {
        return this.personId;
    }

    public void setCameraId(Long cameraId) 
    {
        this.cameraId = cameraId;
    }

    public Long getCameraId() 
    {
        return this.cameraId;
    }

    public void setCaptureTime(Date captureTime) 
    {
        this.captureTime = captureTime;
    }

    public Date getCaptureTime() 
    {
        return this.captureTime;
    }

    public void setxAxis(BigDecimal xAxis) 
    {
        this.xAxis = xAxis;
    }

    public BigDecimal getxAxis() 
    {
        return this.xAxis;
    }

    public void setyAxis(BigDecimal yAxis)
    {
        this.yAxis = yAxis;
    }
    
    public void setPlatformNo(String platformNo)
    {
        this.platformNo = platformNo;
    }
    
    public String getPlatformNo()
    {
        return platformNo;
    }

    public BigDecimal getyAxis() 
    {
        return this.yAxis;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("personId", getPersonId())
            .append("cameraId", getCameraId())
            .append("captureTime", getCaptureTime())
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
