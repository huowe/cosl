package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.PlatformStats;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.service.IPlatformStatsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 平台数据统计 Controller
 * 
 * @author ruoyi
 * @date 2026-04-04
 */
@Controller
@RequestMapping("/api/platform")
public class PlatformStatsController extends BaseController
{
    @Autowired
    private IPlatformStatsService platformStatsService;

    /**
     * 获取平台数据统计
     */
    @RequiresPermissions("system:platform:view")
    @Log(title = "平台数据统计", businessType = BusinessType.OTHER)
    @GetMapping("/stats")
    @ResponseBody
    public AjaxResult getPlatformStats()
    {
        PlatformStats stats = platformStatsService.getPlatformStats();
        return success(stats);
    }
}
