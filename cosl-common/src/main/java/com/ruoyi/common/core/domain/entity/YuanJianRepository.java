package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 摄像头对象 camera
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class YuanJianRepository
{

    private static final long serialVersionUID = 1L;

    private String desc;

    private String repName;

    private String repParentId;

}
