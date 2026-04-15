package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 查询底库人员请求对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class MonitorQueryRequest implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 分页 */
    private Integer page;

    /** 名字/身份证搜索条件 */
    private String query;

    /** 底库id列表 */
    private List<String> repIds;

    /** 每页数量 */
    private Integer size;
}
