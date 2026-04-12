package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.CertificateAlert;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.service.ICertificateAlertService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 证书到期提醒 Controller
 * 
 * @author ruoyi
 * @date 2026-04-04
 */
@Controller
@RequestMapping("/api/alert")
public class CertificateAlertController extends BaseController
{
    @Autowired
    private ICertificateAlertService certificateAlertService;

    /**
     * 获取证书到期提醒列表
     */
    @RequiresPermissions("system:alert:view")
    @Log(title = "证书到期提醒", businessType = BusinessType.OTHER)
    @GetMapping("/list")
    @ResponseBody
    public AjaxResult getAlertList()
    {
        List<CertificateAlert> alerts = certificateAlertService.getCertificateAlerts();
        return success(alerts);
    }

    /**
     * 获取证书提醒总数
     */
    @RequiresPermissions("system:alert:view")
    @GetMapping("/total")
    @ResponseBody
    public AjaxResult getAlertTotal()
    {
        Integer total = certificateAlertService.getAlertTotal();
        Map<String, Object> result = new HashMap<>();
        result.put("total", total);
        return success(result);
    }

    /**
     * 获取即将到期的证书提醒
     */
    @RequiresPermissions("system:alert:view")
    @GetMapping("/expiring-soon")
    @ResponseBody
    public AjaxResult getExpiringSoonAlert()
    {
        CertificateAlert alert = certificateAlertService.getExpiringSoonAlert();
        return success(alert);
    }

    /**
     * 获取已过期的证书提醒
     */
    @RequiresPermissions("system:alert:view")
    @GetMapping("/expired")
    @ResponseBody
    public AjaxResult getExpiredAlert()
    {
        CertificateAlert alert = certificateAlertService.getExpiredAlert();
        return success(alert);
    }
}
