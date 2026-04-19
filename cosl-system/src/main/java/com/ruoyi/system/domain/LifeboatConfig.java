package com.ruoyi.system.domain;

import java.util.Date;
import java.util.List;
import javax.validation.constraints.*;

import lombok.Data;
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
@Data
public class LifeboatConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 ID */
    @Excel(name = "主键 ID", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

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

    /** 人员列表（简化信息：id, name, monitorId） */
    private List<SimplePersonInfo> personList;
}
