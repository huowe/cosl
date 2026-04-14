package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;

/**
 * 创建底库人员请求对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class MonitorCreateRequest implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 身份证 */
    private String idCard;

    /** 姓名 */
    private String name;

    /** 底库id */
    private String repId;
}
