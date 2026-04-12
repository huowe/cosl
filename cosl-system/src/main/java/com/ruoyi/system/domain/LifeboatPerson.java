package com.ruoyi.system.domain;

import java.util.Date;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 救生艇人员 lifeboat_person
 * 
 * @author ruoyi
 */
public class LifeboatPerson extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "主键", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 人员 ID */
    @Excel(name = "人员 ID", cellType = ColumnType.NUMERIC)
    private Long personId;

    /** 救生艇 ID */
    @Excel(name = "救生艇 ID", cellType = ColumnType.NUMERIC)
    private Long lifeboatId;

    /** 座位 ID */
    @Excel(name = "座位 ID", cellType = ColumnType.NUMERIC)
    private Long seatId;

    /** 分配时间 */
    @Excel(name = "分配时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date assignTime;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    @NotNull(message = "人员 ID 不能为空")
    public Long getPersonId()
    {
        return personId;
    }

    public void setPersonId(Long personId)
    {
        this.personId = personId;
    }

    @NotNull(message = "救生艇 ID 不能为空")
    public Long getLifeboatId()
    {
        return lifeboatId;
    }

    public void setLifeboatId(Long lifeboatId)
    {
        this.lifeboatId = lifeboatId;
    }

    public Long getSeatId()
    {
        return seatId;
    }

    public void setSeatId(Long seatId)
    {
        this.seatId = seatId;
    }

    public Date getAssignTime()
    {
        return assignTime;
    }

    public void setAssignTime(Date assignTime)
    {
        this.assignTime = assignTime;
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
            .append("personId", getPersonId())
            .append("lifeboatId", getLifeboatId())
            .append("seatId", getSeatId())
            .append("assignTime", getAssignTime())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
