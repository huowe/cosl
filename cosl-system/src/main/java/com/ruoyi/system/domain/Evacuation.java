package com.ruoyi.system.domain;

import java.util.Date;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 紧急撤离事件表 evacuation
 * 
 * @author ruoyi
 */
public class Evacuation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 ID */
    @Excel(name = "主键 ID", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 撤离事件名称 */
    @Excel(name = "撤离事件名称")
    private String name;

    /** 撤离类型（FIRE:火灾，COLLISION:碰撞，GAS_LEAK:气体泄漏，ABANDON_SHIP:弃船，OTHER:其他） */
    @Excel(name = "撤离类型")
    private String type;

    /** 警报级别（LEVEL1:一级，LEVEL2:二级，LEVEL3:三级） */
    @Excel(name = "警报级别")
    private String alarmLevel;

    /** 开始时间 */
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 结束时间 */
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 预计撤离人数 */
    @Excel(name = "预计撤离人数", cellType = ColumnType.NUMERIC)
    private Integer expectedCount;

    /** 实际撤离人数 */
    @Excel(name = "实际撤离人数", cellType = ColumnType.NUMERIC)
    private Integer actualCount;

    /** 集合点位置 */
    @Excel(name = "集合点位置")
    private String assemblyPoint;

    /** 状态（PLANNED:计划中，ACTIVE:进行中，COMPLETED:已完成，CANCELLED:已取消） */
    @Excel(name = "状态")
    private String status;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    @Size(min = 0, max = 100, message = "撤离事件名称不能超过 100 个字符")
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    @Size(min = 0, max = 50, message = "撤离类型长度不能超过 50 个字符")
    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    @Size(min = 0, max = 20, message = "警报级别长度不能超过 20 个字符")
    public String getAlarmLevel()
    {
        return alarmLevel;
    }

    public void setAlarmLevel(String alarmLevel)
    {
        this.alarmLevel = alarmLevel;
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

    @Size(min = 0, max = 200, message = "集合点位置长度不能超过 200 个字符")
    public String getAssemblyPoint()
    {
        return assemblyPoint;
    }

    public void setAssemblyPoint(String assemblyPoint)
    {
        this.assemblyPoint = assemblyPoint;
    }

    @Size(min = 0, max = 20, message = "状态长度不能超过 20 个字符")
    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    @Size(min = 0, max = 500, message = "备注长度不能超过 500 个字符")
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
            .append("name", getName())
            .append("type", getType())
            .append("alarmLevel", getAlarmLevel())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("expectedCount", getExpectedCount())
            .append("actualCount", getActualCount())
            .append("assemblyPoint", getAssemblyPoint())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
