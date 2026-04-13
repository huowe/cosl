package com.ruoyi.framework.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import com.ruoyi.common.config.PlatformConfig;

/**
 * 平台配置初始化器
 * 在项目启动时加载并打印平台配置信息
 * 
 * @author ruoyi
 */
@Component
public class PlatformConfigInitializer implements ApplicationRunner
{
    private static final Logger log = LoggerFactory.getLogger(PlatformConfigInitializer.class);

    @Autowired
    private PlatformConfig platformConfig;

    @Override
    public void run(ApplicationArguments args) throws Exception
    {
        String platformNo = platformConfig.getPlatformNo();
        log.info("===========================================");
        log.info("钻井平台编号配置: {}", platformNo);
        log.info("提示: 可在 application.yml 中修改 ruoyi.platformNo 配置项");
        log.info("提示: 用户登录时会从 Token 中动态获取平台编号");
        log.info("===========================================");
    }
}
