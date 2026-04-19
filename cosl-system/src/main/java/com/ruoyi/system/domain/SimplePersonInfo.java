package com.ruoyi.system.domain;

import java.io.Serializable;

/**
 * 简化人员信息（只包含id, name, monitorId）
 */
public class SimplePersonInfo implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 人员ID */
    private Long id;

    /** 姓名 */
    private String name;

    /** 监控ID */
    private String monitorId;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getMonitorId()
    {
        return monitorId;
    }

    public void setMonitorId(String monitorId)
    {
        this.monitorId = monitorId;
    }
}
