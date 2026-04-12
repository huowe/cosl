package com.ruoyi.system.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 紧急撤离人员记录表 evacuation_record
 * 
 * @author ruoyi
 */
public class EvacuationRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 ID */
    private Long id;

    /** 撤离事件 ID */
    private Long evacuationId;

    /** 人员 ID */
    private Long personId;

    /** 人员姓名 */
    private String personName;

    /** 救生艇 ID */
    private Long lifeboatId;

    /** 救生艇编号 */
    private String lifeboatNo;

    /** 座位号 */
    private Integer seatNo;

    /** 到达集合点时间 */
    private Date arriveTime;

    /** 登艇时间 */
    private Date boardTime;

    /** 状态（EVACUATED:已撤离，MISSING:失踪，INJURED:受伤） */
    private String status;

    /** 备注 */
    private String remark;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getEvacuationId()
    {
        return evacuationId;
    }

    public void setEvacuationId(Long evacuationId)
    {
        this.evacuationId = evacuationId;
    }

    public Long getPersonId()
    {
        return personId;
    }

    public void setPersonId(Long personId)
    {
        this.personId = personId;
    }

    public String getPersonName()
    {
        return personName;
    }

    public void setPersonName(String personName)
    {
        this.personName = personName;
    }

    public Long getLifeboatId()
    {
        return lifeboatId;
    }

    public void setLifeboatId(Long lifeboatId)
    {
        this.lifeboatId = lifeboatId;
    }

    public String getLifeboatNo()
    {
        return lifeboatNo;
    }

    public void setLifeboatNo(String lifeboatNo)
    {
        this.lifeboatNo = lifeboatNo;
    }

    public Integer getSeatNo()
    {
        return seatNo;
    }

    public void setSeatNo(Integer seatNo)
    {
        this.seatNo = seatNo;
    }

    public Date getArriveTime()
    {
        return arriveTime;
    }

    public void setArriveTime(Date arriveTime)
    {
        this.arriveTime = arriveTime;
    }

    public Date getBoardTime()
    {
        return boardTime;
    }

    public void setBoardTime(Date boardTime)
    {
        this.boardTime = boardTime;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

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
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("evacuationId", getEvacuationId())
            .append("personId", getPersonId())
            .append("personName", getPersonName())
            .append("lifeboatId", getLifeboatId())
            .append("lifeboatNo", getLifeboatNo())
            .append("seatNo", getSeatNo())
            .append("arriveTime", getArriveTime())
            .append("boardTime", getBoardTime())
            .append("status", getStatus())
            .append("remark", getRemark())
            .toString();
    }
}
