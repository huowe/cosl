package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import com.ruoyi.common.utils.StringUtils;
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
import com.ruoyi.system.domain.LifeboatConfig;
import com.ruoyi.system.domain.EvacuationPoint;
import com.ruoyi.system.domain.LifeboatSeat;
import com.ruoyi.system.domain.LifeboatPerson;
import com.ruoyi.system.service.ILifeboatConfigService;
import com.ruoyi.system.service.IEvacuationPointService;
import com.ruoyi.system.service.ILifeboatSeatService;
import com.ruoyi.system.service.ILifeboatPersonService;

/**
 * 救生艇配置 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/api/lifeboat")
public class LifeboatController extends BaseController
{
    private String prefix = "system/lifeboat";

    @Autowired
    private ILifeboatConfigService lifeboatConfigService;

    @Autowired
    private IEvacuationPointService evacuationPointService;

    @Autowired
    private ILifeboatSeatService lifeboatSeatService;

    @Autowired
    private ILifeboatPersonService lifeboatPersonService;

    // ==================== 撤离点管理 ====================

    /**
     * 查询撤离点列表
     */
    @RequiresPermissions("system:lifeboat:view")
    @PostMapping("/evacuationPoint/list")
    @ResponseBody
    public TableDataInfo listEvacuationPoints(@RequestBody EvacuationPoint evacuationPoint)
    {
        startPage();
        List<EvacuationPoint> list = evacuationPointService.selectEvacuationPointList(evacuationPoint);
        return getDataTable(list);
    }

    /**
     * 获取撤离点详情
     */
    @RequiresPermissions("system:lifeboat:view")
    @GetMapping("/evacuationPoint/{id}")
    @ResponseBody
    public AjaxResult getEvacuationPoint(@PathVariable Long id)
    {
        return success(evacuationPointService.selectEvacuationPointById(id));
    }

    /**
     * 新增撤离点
     */
    @RequiresPermissions("system:lifeboat:add")
    @Log(title = "撤离点管理", businessType = BusinessType.INSERT)
    @PostMapping("/evacuationPoint/add")
    @ResponseBody
    public AjaxResult addEvacuationPoint(@RequestBody EvacuationPoint evacuationPoint)
    {
        if (!evacuationPointService.checkPointNameUnique(evacuationPoint))
        {
            return error("新增撤离点'" + evacuationPoint.getPointName() + "'失败，撤离点名称已存在");
        }
        evacuationPoint.setCreateBy(getLoginName());
        return toAjax(evacuationPointService.insertEvacuationPoint(evacuationPoint));
    }

    /**
     * 修改撤离点
     */
    @RequiresPermissions("system:lifeboat:edit")
    @Log(title = "撤离点管理", businessType = BusinessType.UPDATE)
    @PostMapping("/evacuationPoint/edit")
    @ResponseBody
    public AjaxResult editEvacuationPoint(@RequestBody EvacuationPoint evacuationPoint)
    {
        if (!evacuationPointService.checkPointNameUnique(evacuationPoint))
        {
            return error("修改撤离点'" + evacuationPoint.getPointName() + "'失败，撤离点名称已存在");
        }
        evacuationPoint.setUpdateBy(getLoginName());
        return toAjax(evacuationPointService.updateEvacuationPoint(evacuationPoint));
    }

    /**
     * 删除撤离点
     */
    @RequiresPermissions("system:lifeboat:remove")
    @Log(title = "撤离点管理", businessType = BusinessType.DELETE)
    @PostMapping("/evacuationPoint/remove")
    @ResponseBody
    public AjaxResult removeEvacuationPoints(@RequestParam String ids)
    {
        return toAjax(evacuationPointService.deleteEvacuationPointByIds(ids));
    }

    // ==================== 救生艇配置管理 ====================

    /**
     * 查询救生艇配置列表
     */
    @RequiresPermissions("system:lifeboat:view")
    @PostMapping("/page")
    @ResponseBody
    public TableDataInfo listLifeboatConfigs(@RequestBody LifeboatConfig lifeboatConfig)
    {
        startPage();
        List<LifeboatConfig> list = lifeboatConfigService.selectLifeboatConfigList(lifeboatConfig);
        return getDataTable(list);
    }

    /**
     * 获取救生艇配置详情
     */
    @RequiresPermissions("system:lifeboat:view")
    @GetMapping("/{id}")
    @ResponseBody
    public AjaxResult getLifeboatConfig(@PathVariable Long id)
    {
        return success(lifeboatConfigService.selectLifeboatConfigById(id));
    }

    /**
     * 新增救生艇配置
     */
    @RequiresPermissions("system:lifeboat:add")
    @Log(title = "救生艇管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addLifeboatConfig(@RequestBody LifeboatConfig lifeboatConfig)
    {
        if (!lifeboatConfigService.checkBoatNoUnique(lifeboatConfig))
        {
            return error("新增救生艇'" + lifeboatConfig.getBoatName() + "'失败，救生艇编号已存在");
        }
        lifeboatConfig.setCreateBy(getLoginName());
        int result = lifeboatConfigService.insertLifeboatConfig(lifeboatConfig);
        
        // 如果是新增且需要初始化座位，可以在这里添加座位初始化逻辑
        
        return toAjax(result);
    }

    /**
     * 修改救生艇配置
     */
    @RequiresPermissions("system:lifeboat:edit")
    @Log(title = "救生艇管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editLifeboatConfig(@RequestBody LifeboatConfig lifeboatConfig)
    {
        if (!lifeboatConfigService.checkBoatNoUnique(lifeboatConfig))
        {
            return error("修改救生艇'" + lifeboatConfig.getBoatName() + "'失败，救生艇编号已存在");
        }
        lifeboatConfig.setUpdateBy(getLoginName());
        return toAjax(lifeboatConfigService.updateLifeboatConfig(lifeboatConfig));
    }

    /**
     * 删除救生艇配置
     */
    @RequiresPermissions("system:lifeboat:remove")
    @Log(title = "救生艇管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult removeLifeboatConfigs(@RequestParam String ids)
    {
        return toAjax(lifeboatConfigService.deleteLifeboatConfigByIds(ids));
    }

    /**
     * 根据撤离点 ID 查询救生艇列表
     */
    @RequiresPermissions("system:lifeboat:view")
    @GetMapping("/listByPoint/{pointId}")
    @ResponseBody
    public AjaxResult listLifeboatConfigsByPoint(@PathVariable Long pointId)
    {
        List<LifeboatConfig> list = lifeboatConfigService.selectLifeboatConfigsByPointId(pointId);
        return success(list);
    }

    // ==================== 座位管理 ====================

    /**
     * 查询座位列表
     */
    @RequiresPermissions("system:lifeboat:view")
    @PostMapping("/seat/list")
    @ResponseBody
    public TableDataInfo listSeats(@RequestBody LifeboatSeat lifeboatSeat)
    {
        startPage();
        List<LifeboatSeat> list = lifeboatSeatService.selectLifeboatSeatList(lifeboatSeat);
        return getDataTable(list);
    }

    /**
     * 根据救生艇 ID 查询座位列表
     */
    @RequiresPermissions("system:lifeboat:view")
    @GetMapping("/seat/listByBoat/{boatId}")
    @ResponseBody
    public AjaxResult listSeatsByBoat(@PathVariable Long boatId)
    {
        List<LifeboatSeat> list = lifeboatSeatService.selectSeatsByLifeboatId(boatId);
        return success(list);
    }

    /**
     * 新增座位
     */
    @RequiresPermissions("system:lifeboat:add")
    @Log(title = "座位管理", businessType = BusinessType.INSERT)
    @PostMapping("/seat/add")
    @ResponseBody
    public AjaxResult addSeat(@RequestBody LifeboatSeat lifeboatSeat)
    {
        if (!lifeboatSeatService.checkSeatNoUnique(lifeboatSeat))
        {
            return error("新增座位失败，座位号已存在");
        }
        lifeboatSeat.setCreateBy(getLoginName());
        return toAjax(lifeboatSeatService.insertLifeboatSeat(lifeboatSeat));
    }

    /**
     * 修改座位
     */
    @RequiresPermissions("system:lifeboat:edit")
    @Log(title = "座位管理", businessType = BusinessType.UPDATE)
    @PostMapping("/seat/edit")
    @ResponseBody
    public AjaxResult editSeat(@RequestBody LifeboatSeat lifeboatSeat)
    {
        if (!lifeboatSeatService.checkSeatNoUnique(lifeboatSeat))
        {
            return error("修改座位失败，座位号已存在");
        }
        lifeboatSeat.setUpdateBy(getLoginName());
        return toAjax(lifeboatSeatService.updateLifeboatSeat(lifeboatSeat));
    }

    /**
     * 删除座位
     */
    @RequiresPermissions("system:lifeboat:remove")
    @Log(title = "座位管理", businessType = BusinessType.DELETE)
    @PostMapping("/seat/remove")
    @ResponseBody
    public AjaxResult removeSeats(@RequestParam String ids)
    {
        return toAjax(lifeboatSeatService.deleteLifeboatSeatByIds(ids));
    }

    /**
     * 统计空闲座位数
     */
    @RequiresPermissions("system:lifeboat:view")
    @GetMapping("/seat/countFree/{boatId}")
    @ResponseBody
    public AjaxResult countFreeSeats(@PathVariable Long boatId)
    {
        int count = lifeboatSeatService.countFreeSeats(boatId);
        Map<String, Object> result = new HashMap<>();
        result.put("freeSeats", count);
        return success(result);
    }

    // ==================== 人员分配管理 ====================

    /**
     * 查询救生艇上的人员列表
     */
    @RequiresPermissions("system:lifeboat:view")
    @GetMapping("/person/listByBoat/{boatId}")
    @ResponseBody
    public AjaxResult listPersonsByBoat(@PathVariable Long boatId)
    {
        List<LifeboatPerson> list = lifeboatPersonService.selectPersonsByLifeboatId(boatId);
        return success(list);
    }

    /**
     * 查询人员的分配情况
     */
    @RequiresPermissions("system:lifeboat:view")
    @GetMapping("/person/getByPerson/{personId}")
    @ResponseBody
    public AjaxResult getPersonAssignment(@PathVariable Long personId)
    {
        LifeboatPerson lifeboatPerson = lifeboatPersonService.selectByPersonId(personId);
        if (StringUtils.isNull(lifeboatPerson))
        {
            return error("该人员未被分配到救生艇");
        }
        return success(lifeboatPerson);
    }

    /**
     * 分配人员到救生艇
     */
    @RequiresPermissions("system:lifeboat:edit")
    @Log(title = "人员分配", businessType = BusinessType.INSERT)
    @PostMapping("/person/assign")
    @ResponseBody
    public AjaxResult assignPersonToBoat(@RequestBody Map<String, Object> params)
    {
        try
        {
            Long personId = Long.valueOf(params.get("personId").toString());
            Long lifeboatId = Long.valueOf(params.get("lifeboatId").toString());
            Long seatId = params.get("seatId") != null ? Long.valueOf(params.get("seatId").toString()) : null;

            lifeboatPersonService.assignPersonToBoat(personId, lifeboatId, seatId);
            return success();
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }
    }

    /**
     * 从救生艇移除人员
     */
    @RequiresPermissions("system:lifeboat:edit")
    @Log(title = "人员分配", businessType = BusinessType.DELETE)
    @PostMapping("/person/remove")
    @ResponseBody
    public AjaxResult removePersonFromBoat(@RequestParam Long personId)
    {
        try
        {
            lifeboatPersonService.removePersonFromBoat(personId);
            return success();
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }
    }

    /**
     * 统计救生艇上的人数
     */
    @RequiresPermissions("system:lifeboat:view")
    @GetMapping("/person/count/{boatId}")
    @ResponseBody
    public AjaxResult countPersons(@PathVariable Long boatId)
    {
        int count = lifeboatPersonService.countPersonsByLifeboatId(boatId);
        Map<String, Object> result = new HashMap<>();
        result.put("personCount", count);
        return success(result);
    }

    // ==================== 综合统计 ====================

    /**
     * 获取救生艇详细信息（包含座位和人员）
     */
    @RequiresPermissions("system:lifeboat:view")
    @GetMapping("/detail/{boatId}")
    @ResponseBody
    public AjaxResult getLifeboatDetail(@PathVariable Long boatId)
    {
        Map<String, Object> result = new HashMap<>();
        
        // 救生艇信息
        LifeboatConfig boat = lifeboatConfigService.selectLifeboatConfigById(boatId);
        if (StringUtils.isNull(boat))
        {
            return error("救生艇不存在");
        }
        result.put("boat", boat);

        // 座位信息
        List<LifeboatSeat> seats = lifeboatSeatService.selectSeatsByLifeboatId(boatId);
        result.put("seats", seats);

        // 人员信息
        List<LifeboatPerson> persons = lifeboatPersonService.selectPersonsByLifeboatId(boatId);
        result.put("persons", persons);

        // 统计信息
        int totalSeats = seats.size();
        int freeSeats = lifeboatSeatService.countFreeSeats(boatId);
        int personCount = persons.size();
        
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalSeats", totalSeats);
        stats.put("freeSeats", freeSeats);
        stats.put("occupiedSeats", totalSeats - freeSeats);
        stats.put("personCount", personCount);
        result.put("stats", stats);

        return success(result);
    }

}
