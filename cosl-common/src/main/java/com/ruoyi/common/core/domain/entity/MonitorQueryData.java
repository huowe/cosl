package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 查询底库人员响应数据对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class MonitorQueryData implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 底库人员列表 */
    private List<MonitorInfoData> monitors;

    /** 总数 */
    private Integer total;
}
