package com.ruoyi.system.domain;

import java.util.Date;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 救生艇配置 lifeboat_config
 * 
 * @author ruoyi
 */
public class LifeboatConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 ID */
    @Excel(name = "主键 ID", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 救生艇编号 */
    @Excel(name = "救生艇编号")
    private String boatNo;

    /** 救生艇名称 */
    @Excel(name = "救生艇名称")
    private String boatName;

    /** 最大容量 */
    @Excel(name = "最大容量", cellType = ColumnType.NUMERIC)
    private Integer maxCapacity;

    /** 所属撤离点 ID */
    @Excel(name = "所属撤离点 ID", cellType = ColumnType.NUMERIC)
    private Long evacuationPointId;

    /** 状态 ACTIVE/INACTIVE */
    @Excel(name = "状态")
    private String status;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    private Integer deleted;

    public Integer getDeleted(){
        return deleted;
    }
    public void setDeleted(Integer deleted){
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

    @Size(min = 0, max = 50, message = "救生艇编号不能超过 50 个字符")
    @NotBlank(message = "救生艇编号不能为空")
    public String getBoatNo()
    {
        return boatNo;
    }

    public void setBoatNo(String boatNo)
    {
        this.boatNo = boatNo;
    }

    @Size(min = 0, max = 100, message = "救生艇名称不能超过 100 个字符")
    public String getBoatName()
    {
        return boatName;
    }

    public void setBoatName(String boatName)
    {
        this.boatName = boatName;
    }

    @NotNull(message = "最大容量不能为空")
    @Min(value = 0, message = "最大容量不能小于 0")
    public Integer getMaxCapacity()
    {
        return maxCapacity;
    }

    public void setMaxCapacity(Integer maxCapacity)
    {
        this.maxCapacity = maxCapacity;
    }

    public Long getEvacuationPointId()
    {
        return evacuationPointId;
    }

    public void setEvacuationPointId(Long evacuationPointId)
    {
        this.evacuationPointId = evacuationPointId;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
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
            .append("boatNo", getBoatNo())
            .append("boatName", getBoatName())
            .append("maxCapacity", getMaxCapacity())
            .append("evacuationPointId", getEvacuationPointId())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("deleted", getDeleted())
            .toString();
    }
}
