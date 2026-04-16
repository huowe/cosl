package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.entity.RoomConfig;
import com.ruoyi.common.utils.PlatformContext;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.service.IRoomConfigService;

/**
 * 房间配置操作处理
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Controller
@RequestMapping("/api/room")
public class RoomConfigController extends BaseController
{
    private String prefix = "system/roomConfig";

    @Autowired
    private IRoomConfigService roomConfigService;

    @RequiresPermissions("system:roomConfig:view")
    @GetMapping()
    public String operlog()
    {
        return prefix + "/roomConfig";
    }

    @RequiresPermissions("system:roomConfig:list")
    @PostMapping("/page")
    @ResponseBody
    public TableDataInfo list(@RequestBody RoomConfig roomConfig)
    {
        startPage();
        List<RoomConfig> list = roomConfigService.selectRoomConfigList(roomConfig);
        return getDataTable(list);
    }

    @Log(title = "房间配置管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:roomConfig:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(RoomConfig roomConfig)
    {
        List<RoomConfig> list = roomConfigService.selectRoomConfigList(roomConfig);
        ExcelUtil<RoomConfig> util = new ExcelUtil<RoomConfig>(RoomConfig.class);
        return util.exportExcel(list, "房间配置数据");
    }

    @RequiresPermissions("system:roomConfig:remove")
    @Log(title = "房间配置管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(roomConfigService.deleteRoomConfigByIds(ids));
    }

    /**
     * 新增房间配置
     */
    @RequiresPermissions("system:roomConfig:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存房间配置
     */
    @RequiresPermissions("system:roomConfig:add")
    @Log(title = "房间配置管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody RoomConfig roomConfig)
    {
        String platformNo = PlatformContext.getPlatformNo();
        roomConfig.setPlatformNo(platformNo);
        if (!roomConfigService.checkRoomNoUnique(roomConfig))
        {
            return error("新增房间'" + roomConfig.getRoomNo() + "'失败，房间号已存在");
        }
        roomConfig.setCreateBy(getLoginName());
        return toAjax(roomConfigService.insertRoomConfig(roomConfig));
    }

    /**
     * 修改房间配置
     */
    @RequiresPermissions("system:roomConfig:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("roomConfig", roomConfigService.selectRoomConfigById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存房间配置
     */
    @RequiresPermissions("system:roomConfig:edit")
    @Log(title = "房间配置管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody RoomConfig roomConfig)
    {
        if (!roomConfigService.checkRoomNoUnique(roomConfig))
        {
            return error("修改房间'" + roomConfig.getRoomNo() + "'失败，房间号已存在");
        }
        roomConfig.setUpdateBy(getLoginName());
        return toAjax(roomConfigService.updateRoomConfig(roomConfig));
    }
    /**
     * 校验房间号
     */
    @PostMapping("/checkRoomNoUnique")
    @ResponseBody
    public boolean checkRoomNoUnique(RoomConfig roomConfig)
    {
        return roomConfigService.checkRoomNoUnique(roomConfig);
    }
    /**
     * 查询房间详情（包含床位信息）
     */
    @RequiresPermissions("system:roomConfig:view")
    @GetMapping("/detail")
    @ResponseBody
    public AjaxResult detail(@RequestParam Long id)
    {
        RoomConfig roomConfig = roomConfigService.getRoomDetail(id);
        return success(roomConfig);
    }

    @RequiresPermissions("system:roomConfig:view")
    @PostMapping("/listWithBeds")
    @ResponseBody
    public TableDataInfo listWithBeds(@RequestBody RoomConfig roomConfig)
    {
        startPage();
        List<RoomConfig> list = roomConfigService.selectRoomConfigList(roomConfig);
        List<RoomConfig> newList = new ArrayList<>();
        for (int i = 0;i<list.size();i++){
            RoomConfig room = roomConfigService.getRoomDetail(list.get(i).getId());
            newList.add(room);
        }
        return getDataTable(newList);

    }

    /**
     * 获取房间统计数据
     */
    @RequiresPermissions("system:roomConfig:view")
    @GetMapping("/stats")
    @ResponseBody
    public AjaxResult stats()
    {
        return success(roomConfigService.getRoomStats());
    }

    /**
     * 锁定/解锁房间
     */
    @RequiresPermissions("system:roomConfig:edit")
    @Log(title = "房间管理", businessType = BusinessType.UPDATE)
    @PostMapping("/toggleLock")
    @ResponseBody
    public AjaxResult toggleLock(@RequestParam Long id, @RequestParam String status)
    {
        roomConfigService.toggleLock(id, status);
        return success("操作成功");
    }

    /**
     * 批量锁定/解锁房间
     */
    @RequiresPermissions("system:roomConfig:edit")
    @Log(title = "房间管理", businessType = BusinessType.UPDATE)
    @PostMapping("/batchLock")
    @ResponseBody
    public AjaxResult batchLock(@RequestParam String ids, @RequestParam String status)
    {
        int count = roomConfigService.batchLock(ids, status);
        return success("成功" + count + "个房间");
    }
}
