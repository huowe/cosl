package com.ruoyi.common.core.domain.entity;

import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房间床位对象 room_bed
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public class RoomBed extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 房间 ID */
    @Excel(name = "房间 ID", cellType = ColumnType.NUMERIC)
    private Long roomId;

    /** 床位号 */
    @Excel(name = "床位号")
    private String bedNo;

    /** 状态 FREE/OCCUPIED/LOCKED */
    @Excel(name = "状态", readConverterExp = "FREE=空闲，OCCUPIED=已占用，LOCKED=锁定")
    private String status;

    private Person person;

    public Person getPerson() {
        return person;
    }
    public void setPerson(Person person) {
        this.person = person;
    }

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setRoomId(Long roomId) 
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }

    @Size(min = 0, max = 10, message = "床位号长度不能超过10个字符")
    public String getBedNo()
    {
        return bedNo;
    }

    public void setBedNo(String bedNo) 
    {
        this.bedNo = bedNo;
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
            .append("roomId", getRoomId())
            .append("bedNo", getBedNo())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
