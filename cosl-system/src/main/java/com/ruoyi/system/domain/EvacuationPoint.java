package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 撤离点 evacuation_point
 * 
 * @author ruoyi
 */
public class EvacuationPoint extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "主键", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 撤离点名称 */
    @Excel(name = "撤离点名称")
    private String pointName;

    /** 楼层 */
    @Excel(name = "楼层")
    private String floor;

    /** 地图坐标 X */
    @Excel(name = "地图坐标 X", cellType = ColumnType.NUMERIC)
    private BigDecimal xAxis;

    /** 地图坐标 Y */
    @Excel(name = "地图坐标 Y", cellType = ColumnType.NUMERIC)
    private BigDecimal yAxis;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    private  Integer deleted;

    public Integer getDeleted() {
        return deleted;
    }
    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    @Size(min = 0, max = 100, message = "撤离点名称不能超过 100 个字符")
    @NotBlank(message = "撤离点名称不能为空")
    public String getPointName()
    {
        return pointName;
    }

    public void setPointName(String pointName)
    {
        this.pointName = pointName;
    }

    @Size(min = 0, max = 10, message = "楼层不能超过 10 个字符")
    public String getFloor()
    {
        return floor;
    }

    public void setFloor(String floor)
    {
        this.floor = floor;
    }

    public BigDecimal getxAxis()
    {
        return xAxis;
    }

    public void setxAxis(BigDecimal xAxis)
    {
        this.xAxis = xAxis;
    }
    public BigDecimal getyAxis()
    {
        return yAxis;
    }
    public void setyAxis(BigDecimal yAxis)
    {
        this.yAxis = yAxis;
    }

    @Size(min = 0, max = 255, message = "备注不能超过 255 个字符")
    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("pointName", getPointName())
            .append("floor", getFloor())
            .append("xAxis", getxAxis())
            .append("yAxis", getyAxis())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
