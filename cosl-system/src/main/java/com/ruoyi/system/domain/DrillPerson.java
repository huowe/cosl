package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 演练人员关联表 drill_person
 */
public class DrillPerson extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 演练 ID */
    private Long drillId;

    /** 人员 ID */
    private Long personId;

    /** 签到状态 */
    private String status;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public Long getDrillId() { return drillId; }
    public void setDrillId(Long drillId) { this.drillId = drillId; }
    
    public Long getPersonId() { return personId; }
    public void setPersonId(Long personId) { this.personId = personId; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

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
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("drillId", getDrillId())
            .append("personId", getPersonId())
            .append("status", getStatus())
            .toString();
    }
}
