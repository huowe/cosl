package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.common.core.domain.entity.RoomBed;
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
import com.ruoyi.system.service.IRoomBedService;

/**
 * 房间床位操作处理
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Controller
@RequestMapping("/api/roomBed")
public class RoomBedController extends BaseController
{
    private String prefix = "api/room";

    @Autowired
    private IRoomBedService roomBedService;

    @RequiresPermissions("system:roomBed:view")
    @GetMapping()
    public String operlog()
    {
        return prefix + "/roomBed";
    }

    @RequiresPermissions("system:roomBed:list")
    @PostMapping("/page")
    @ResponseBody
    public TableDataInfo list(RoomBed roomBed)
    {
        startPage();
        List<RoomBed> list = roomBedService.selectRoomBedList(roomBed);
        return getDataTable(list);
    }

    @Log(title = "房间床位管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:roomBed:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(RoomBed roomBed)
    {
        List<RoomBed> list = roomBedService.selectRoomBedList(roomBed);
        ExcelUtil<RoomBed> util = new ExcelUtil<RoomBed>(RoomBed.class);
        return util.exportExcel(list, "房间床位数据");
    }

    @RequiresPermissions("system:roomBed:remove")
    @Log(title = "房间床位管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(roomBedService.deleteRoomBedByIds(ids));
    }

    /**
     * 新增房间床位
     */
    @RequiresPermissions("system:roomBed:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存房间床位
     */
    @RequiresPermissions("system:roomBed:add")
    @Log(title = "房间床位管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody RoomBed roomBed)
    {
        String platformNo = PlatformContext.getPlatformNo();
        roomBed.setPlatformNo(platformNo);
        if (!roomBedService.checkRoomBedUnique(roomBed))
        {
            return error("新增床位失败，该房间已存在相同床位号");
        }
        roomBed.setCreateBy(getLoginName());
        return toAjax(roomBedService.insertRoomBed(roomBed));
    }

    /**
     * 修改房间床位
     */
    @RequiresPermissions("system:roomBed:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("roomBed", roomBedService.selectRoomBedById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存房间床位
     */
    @RequiresPermissions("system:roomBed:edit")
    @Log(title = "房间床位管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody RoomBed roomBed)
    {
        if (!roomBedService.checkRoomBedUnique(roomBed))
        {
            return error("修改床位失败，该房间已存在相同床位号");
        }
        roomBed.setUpdateBy(getLoginName());
        return toAjax(roomBedService.updateRoomBed(roomBed));
    }

    /**
     * 校验床位号
     */
    @PostMapping("/checkRoomBedUnique")
    @ResponseBody
    public boolean checkRoomBedUnique(RoomBed roomBed)
    {
        return roomBedService.checkRoomBedUnique(roomBed);
    }

    /**
     * 根据房间 ID 查询床位列表
     */
    @PostMapping("/getBedsByRoomId")
    @ResponseBody
    public List<RoomBed> getBedsByRoomId(Long roomId)
    {
        return roomBedService.selectRoomBedsByRoomId(roomId);
    }

    /**
     * 批量更新床位状态
     */
    @RequiresPermissions("system:roomBed:edit")
    @Log(title = "床位状态管理", businessType = BusinessType.UPDATE)
    @PostMapping("/batchChangeStatus")
    @ResponseBody
    public AjaxResult batchChangeStatus(@RequestParam String ids, @RequestParam String status)
    {
        roomBedService.updateBedStatusByIds(ids, status);
        return success("更新成功");
    }


    /**
     * 批量更新床位状态
     */
    @RequiresPermissions("system:roomBed:edit")
    @Log(title = "床位状态管理", businessType = BusinessType.UPDATE)
    @PostMapping("/toggleLock")
    @ResponseBody
    public AjaxResult toggleLock(@RequestParam String ids, @RequestParam String status)
    {
        roomBedService.updateBedStatusByIds(ids, status);
        return success("更新成功");
    }

}
