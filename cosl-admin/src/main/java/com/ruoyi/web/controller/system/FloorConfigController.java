package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.common.utils.PlatformContext;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.FloorConfig;
import com.ruoyi.system.service.IFloorConfigService;

/**
 * 楼层配置 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/api/floor")
public class FloorConfigController extends BaseController
{
    private String prefix = "system/floor";

    @Autowired
    private IFloorConfigService floorConfigService;

    /**
     * 跳转页面
     */
    @RequiresPermissions("system:floor:view")
    @GetMapping()
    public String floor()
    {
        return prefix + "/floor";
    }

    /**
     * 查询楼层配置列表
     */
    @RequiresPermissions("system:floor:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(FloorConfig floorConfig)
    {
        startPage();
        List<FloorConfig> list = floorConfigService.selectFloorConfigList(floorConfig);
        return getDataTable(list);
    }

    /**
     * 导出楼层配置列表
     */
    @Log(title = "楼层配置管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:floor:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(FloorConfig floorConfig)
    {
        List<FloorConfig> list = floorConfigService.selectFloorConfigList(floorConfig);
        ExcelUtil<FloorConfig> util = new ExcelUtil<FloorConfig>(FloorConfig.class);
        return util.exportExcel(list, "楼层配置数据");
    }

    /**
     * 新增楼层配置
     */
    @RequiresPermissions("system:floor:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存楼层配置
     */
    @RequiresPermissions("system:floor:add")
    @Log(title = "新增楼层配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody FloorConfig floorConfig)
    {
        String platformNo = PlatformContext.getPlatformNo();
        floorConfig.setPlatformNo(platformNo);
        floorConfig.setCreateBy(getLoginName());
        try
        {
            return toAjax(floorConfigService.insertFloorConfig(floorConfig));
        }
        catch (RuntimeException e)
        {
            return error(e.getMessage());
        }
    }

    /**
     * 修改楼层配置
     */
    @RequiresPermissions("system:floor:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("floorConfig", floorConfigService.selectFloorConfigById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存楼层配置
     */
    @RequiresPermissions("system:floor:edit")
    @Log(title = "楼层配置管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody FloorConfig floorConfig)
    {
        floorConfig.setUpdateBy(getLoginName());
        try
        {
            return toAjax(floorConfigService.updateFloorConfig(floorConfig));
        }
        catch (RuntimeException e)
        {
            return error(e.getMessage());
        }
    }

    /**
     * 删除楼层配置
     */
    @RequiresPermissions("system:floor:remove")
    @Log(title = "楼层配置管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(floorConfigService.deleteFloorConfigByIds(ids));
    }

    /**
     * 详情
     */
    @RequiresPermissions("system:floor:view")
    @PostMapping("/detail")
    @ResponseBody
    public AjaxResult detail(@RequestParam Long id)
    {
        return success(floorConfigService.selectFloorConfigById(id));
    }

    /**
     * 查询所有启用的楼层列表
     */
    @RequiresPermissions("system:floor:view")
    @GetMapping("/activeList")
    @ResponseBody
    public AjaxResult activeList()
    {
        List<FloorConfig> list = floorConfigService.selectActiveFloorList();
        return success(list);
    }

    /**
     * 检查楼层编号是否唯一
     */
    @PostMapping("/checkFloorNoUnique")
    @ResponseBody
    public boolean checkFloorNoUnique(FloorConfig floorConfig)
    {
        return floorConfigService.checkFloorNoUnique(floorConfig);
    }
}
