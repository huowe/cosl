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
 * 紧急撤离事件表 evacuation
 * 
 * @author ruoyi
 */
@Data
public class Evacuation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 ID */
    @Excel(name = "主键 ID", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

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

    /** 参与演习的人员列表（关联查询） */
    private List<SimplePersonInfo> personList;

    /** 撤离点列表（关联查询） */
    private List<EvacuationPoint> evacuationPoints;

}
