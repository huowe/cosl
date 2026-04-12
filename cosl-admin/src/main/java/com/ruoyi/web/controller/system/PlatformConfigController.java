package com.ruoyi.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.PlatformConfig;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.service.IPlatformConfigService;

/**
 * 钻井平台配置Controller
 * 
 * @author ruoyi
 * @date 2026-04-12
 */
@Controller
@RequestMapping("/system/platform")
public class PlatformConfigController extends BaseController
{
    private String prefix = "system/platform";

    @Autowired
    private IPlatformConfigService platformConfigService;

    @RequiresPermissions("system:platform:view")
    @GetMapping()
    public String platform()
    {
        return prefix + "/platform";
    }

    /**
     * 查询钻井平台配置列表
     */
    @RequiresPermissions("system:platform:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PlatformConfig platformConfig)
    {
        startPage();
        List<PlatformConfig> list = platformConfigService.selectPlatformConfigList(platformConfig);
        return getDataTable(list);
    }

    /**
     * 导出钻井平台配置列表
     */
    @RequiresPermissions("system:platform:export")
    @Log(title = "钻井平台配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PlatformConfig platformConfig)
    {
        List<PlatformConfig> list = platformConfigService.selectPlatformConfigList(platformConfig);
        ExcelUtil<PlatformConfig> util = new ExcelUtil<PlatformConfig>(PlatformConfig.class);
        return util.exportExcel(list, "钻井平台配置数据");
    }

    /**
     * 获取钻井平台配置详细信息
     */
    @RequiresPermissions("system:platform:query")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(platformConfigService.selectPlatformConfigById(id));
    }

    /**
     * 根据平台编号获取钻井平台配置
     */
    @GetMapping(value = "/no/{platformNo}")
    @ResponseBody
    public AjaxResult getByPlatformNo(@PathVariable("platformNo") String platformNo)
    {
        return success(platformConfigService.selectPlatformConfigByNo(platformNo));
    }

    /**
     * 获取所有启用的钻井平台列表（用于下拉选择）
     */
    @GetMapping("/active")
    @ResponseBody
    public AjaxResult getActivePlatforms()
    {
        List<PlatformConfig> list = platformConfigService.selectActivePlatformList();
        return success(list);
    }

    /**
     * 新增钻井平台配置
     */
    @RequiresPermissions("system:platform:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存钻井平台配置
     */
    @RequiresPermissions("system:platform:add")
    @Log(title = "钻井平台配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated PlatformConfig platformConfig)
    {
        if (!platformConfigService.checkPlatformNoUnique(platformConfig))
        {
            return error("新增钻井平台'" + platformConfig.getPlatformName() + "'失败，平台编号已存在");
        }
        platformConfig.setCreateBy(getLoginName());
        return toAjax(platformConfigService.insertPlatformConfig(platformConfig));
    }

    /**
     * 修改钻井平台配置
     */
    @RequiresPermissions("system:platform:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        PlatformConfig platformConfig = platformConfigService.selectPlatformConfigById(id);
        mmap.put("platformConfig", platformConfig);
        return prefix + "/edit";
    }

    /**
     * 修改保存钻井平台配置
     */
    @RequiresPermissions("system:platform:edit")
    @Log(title = "钻井平台配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated PlatformConfig platformConfig)
    {
        if (!platformConfigService.checkPlatformNoUnique(platformConfig))
        {
            return error("修改钻井平台'" + platformConfig.getPlatformName() + "'失败，平台编号已存在");
        }
        platformConfig.setUpdateBy(getLoginName());
        return toAjax(platformConfigService.updatePlatformConfig(platformConfig));
    }

    /**
     * 删除钻井平台配置
     */
    @RequiresPermissions("system:platform:remove")
    @Log(title = "钻井平台配置", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(platformConfigService.deletePlatformConfigByIds(ids));
    }
}
