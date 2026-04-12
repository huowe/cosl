package com.ruoyi.system.domain;

import java.util.Date;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 救生艇座位 lifeboat_seat
 * 
 * @author ruoyi
 */
public class LifeboatSeat extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "主键", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 救生艇 ID */
    @Excel(name = "救生艇 ID", cellType = ColumnType.NUMERIC)
    private Long lifeboatId;

    /** 座位号 */
    @Excel(name = "座位号")
    private String seatNo;

    /** 状态 FREE/OCCUPIED/LOCKED */
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

    @NotNull(message = "救生艇 ID 不能为空")
    public Long getLifeboatId()
    {
        return lifeboatId;
    }

    public void setLifeboatId(Long lifeboatId)
    {
        this.lifeboatId = lifeboatId;
    }

    @Size(min = 0, max = 20, message = "座位号不能超过 20 个字符")
    @NotBlank(message = "座位号不能为空")
    public String getSeatNo()
    {
        return seatNo;
    }

    public void setSeatNo(String seatNo)
    {
        this.seatNo = seatNo;
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
            .append("lifeboatId", getLifeboatId())
            .append("seatNo", getSeatNo())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
