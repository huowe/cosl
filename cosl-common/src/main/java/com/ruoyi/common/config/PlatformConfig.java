package com.ruoyi.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 平台配置属性
 * 
 * @author ruoyi
 */
@Component
@ConfigurationProperties(prefix = "ruoyi")
public class PlatformConfig
{
    /** 钻井平台编号 */
    private String platformNo = "DEFAULT";

    public String getPlatformNo()
    {
        return platformNo;
    }

    public void setPlatformNo(String platformNo)
    {
        this.platformNo = platformNo;
    }
}
