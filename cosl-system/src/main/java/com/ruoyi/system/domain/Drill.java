package com.ruoyi.system.domain;

import java.util.Date;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 演练表 drill
 * 
 * @author ruoyi
 */
public class Drill extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "主键", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 演练名称 */
    @Excel(name = "演练名称")
    private String name;

    /** 开始时间 */
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 结束时间 */
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 预期人数 */
    @Excel(name = "预期人数", cellType = ColumnType.NUMERIC)
    private Integer expectedCount;

    /** 实际人数 */
    @Excel(name = "实际人数", cellType = ColumnType.NUMERIC)
    private Integer actualCount;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    @Size(min = 0, max = 100, message = "演练名称不能超过 100 个字符")
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public Date getStartTime()
    {
        return startTime;
    }

    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }

    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public Integer getExpectedCount()
    {
        return expectedCount;
    }

    public void setExpectedCount(Integer expectedCount)
    {
        this.expectedCount = expectedCount;
    }

    public Integer getActualCount()
    {
        return actualCount;
    }

    public void setActualCount(Integer actualCount)
    {
        this.actualCount = actualCount;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public void setPlatformNo(String platformNo)
    {
        this.platformNo = platformNo;
    }

    public String getPlatformNo()
    {
        return platformNo;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("expectedCount", getExpectedCount())
            .append("actualCount", getActualCount())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
