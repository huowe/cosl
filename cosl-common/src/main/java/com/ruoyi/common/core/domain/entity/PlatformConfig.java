package com.ruoyi.common.core.domain.entity;

import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 钻井平台配置对象 platform_config
 * 
 * @author ruoyi
 * @date 2026-04-12
 */
public class PlatformConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @Excel(name = "主键ID", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 钻井平台编号 */
    @Excel(name = "钻井平台编号")
    private String platformNo;

    /** 钻井平台名称 */
    @Excel(name = "钻井平台名称")
    private String platformName;

    /** 平台类型（SEMI_SUB:半潜式，JACK_UP:自升式，DRILL_SHIP:钻井船） */
    @Excel(name = "平台类型", readConverterExp = "SEMI_SUB=半潜式,JACK_UP=自升式,DRILL_SHIP=钻井船")
    private String platformType;

    /** 作业位置 */
    @Excel(name = "作业位置")
    private String location;

    /** 状态（ACTIVE:启用，INACTIVE:停用） */
    @Excel(name = "状态", readConverterExp = "ACTIVE=启用,INACTIVE=停用")
    private String status;

    /** 排序 */
    @Excel(name = "排序", cellType = ColumnType.NUMERIC)
    private Integer sortOrder;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    /** 删除标志（0存在 1删除） */
    private Integer deleted;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    @NotBlank(message = "钻井平台编号不能为空")
    @Size(min = 0, max = 50, message = "钻井平台编号不能超过50个字符")
    public String getPlatformNo()
    {
        return platformNo;
    }

    public void setPlatformNo(String platformNo)
    {
        this.platformNo = platformNo;
    }

    @NotBlank(message = "钻井平台名称不能为空")
    @Size(min = 0, max = 100, message = "钻井平台名称不能超过100个字符")
    public String getPlatformName()
    {
        return platformName;
    }

    public void setPlatformName(String platformName)
    {
        this.platformName = platformName;
    }

    @Size(min = 0, max = 50, message = "平台类型不能超过50个字符")
    public String getPlatformType()
    {
        return platformType;
    }

    public void setPlatformType(String platformType)
    {
        this.platformType = platformType;
    }

    @Size(min = 0, max = 200, message = "作业位置不能超过200个字符")
    public String getLocation()
    {
        return location;
    }

    public void setLocation(String location)
    {
        this.location = location;
    }

    @Size(min = 0, max = 20, message = "状态不能超过20个字符")
    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public Integer getSortOrder()
    {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder)
    {
        this.sortOrder = sortOrder;
    }

    @Size(min = 0, max = 500, message = "备注不能超过500个字符")
    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public Integer getDeleted()
    {
        return deleted;
    }

    public void setDeleted(Integer deleted)
    {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("platformNo", getPlatformNo())
            .append("platformName", getPlatformName())
            .append("platformType", getPlatformType())
            .append("location", getLocation())
            .append("status", getStatus())
            .append("sortOrder", getSortOrder())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("deleted", getDeleted())
            .toString();
    }
}
