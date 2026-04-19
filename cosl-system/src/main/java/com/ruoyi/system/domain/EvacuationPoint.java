package com.ruoyi.system.domain;

import java.math.BigDecimal;
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
 * 撤离点 evacuation_point
 * 
 * @author ruoyi
 */
@Data
public class EvacuationPoint extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "主键", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 撤离点名称 */
    @Excel(name = "撤离点名称")
    private String pointName;

    /** 楼层 */
    @Excel(name = "楼层")
    private String floor;

    /** 地图坐标 X */
    @Excel(name = "地图坐标 X", cellType = ColumnType.NUMERIC)
    private BigDecimal xAxis;

    /** 地图坐标 Y */
    @Excel(name = "地图坐标 Y", cellType = ColumnType.NUMERIC)
    private BigDecimal yAxis;

    /** 摄像机ID */
    @Excel(name = "摄像机ID")
    private String cameraId;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    private  Integer deleted;

    /** 救生艇列表（关联查询） */
    private List<LifeboatConfig> lifeboats;


}
