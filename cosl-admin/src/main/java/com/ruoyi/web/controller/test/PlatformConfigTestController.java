package com.ruoyi.web.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ruoyi.common.config.PlatformConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.PlatformContext;

/**
 * 平台配置测试 Controller
 * 用于验证 platform_no 配置是否生效
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/test/platform")
public class PlatformConfigTestController extends BaseController
{
    @Autowired
    private PlatformConfig platformConfig;

    /**
     * 获取当前平台配置信息
     */
    @GetMapping("/info")
    public AjaxResult getPlatformInfo()
    {
        // 从配置文件获取
        String configPlatformNo = platformConfig.getPlatformNo();
        
        // 从 ThreadLocal 获取（可能为空）
        String threadPlatformNo = PlatformContext.getPlatformNo();
        
        // 判断是否有动态设置
        boolean hasDynamicPlatform = PlatformContext.hasPlatformNo();
        
        return AjaxResult.success()
            .put("configPlatformNo", configPlatformNo)
            .put("threadPlatformNo", threadPlatformNo)
            .put("hasDynamicPlatform", hasDynamicPlatform)
            .put("message", hasDynamicPlatform ? "使用动态设置的平台编号" : "使用配置文件默认值");
    }

    /**
     * 测试设置平台编号
     */
    @GetMapping("/set")
    public AjaxResult setPlatform(String platformNo)
    {
        PlatformContext.setPlatformNo(platformNo);
        return AjaxResult.success("平台编号已设置为: " + platformNo);
    }

    /**
     * 测试清除平台编号
     */
    @GetMapping("/clear")
    public AjaxResult clearPlatform()
    {
        PlatformContext.clear();
        return AjaxResult.success("平台编号已清除，将使用配置文件默认值");
    }
}
