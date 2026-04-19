package com.ruoyi.system.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * 简化人员信息（只包含id, name, monitorId）
 */
@Data
public class SimplePersonInfo implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 人员ID */
    private Long id;

    /** 姓名 */
    private String name;

    /** 监控ID */
    private String monitorId;
    private Long recordId;
}
