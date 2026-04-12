package com.ruoyi.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.PersonTrack;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.service.IPersonTrackService;

/**
 * 人员轨迹操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/api/personTrack")
public class PersonTrackController extends BaseController
{
    private String prefix = "system/personTrack";

    @Autowired
    private IPersonTrackService personTrackService;

    @RequiresPermissions("system:personTrack:view")
    @GetMapping()
    public String operlog()
    {
        return prefix + "/personTrack";
    }

    @RequiresPermissions("system:personTrack:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(@RequestBody PersonTrack personTrack)
    {
        startPage();
        List<PersonTrack> list = personTrackService.selectPersonTrackList(personTrack);
        return getDataTable(list);
    }

    @Log(title = "人员轨迹管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:personTrack:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PersonTrack personTrack)
    {
        List<PersonTrack> list = personTrackService.selectPersonTrackList(personTrack);
        ExcelUtil<PersonTrack> util = new ExcelUtil<PersonTrack>(PersonTrack.class);
        return util.exportExcel(list, "人员轨迹数据");
    }

    @RequiresPermissions("system:personTrack:remove")
    @Log(title = "人员轨迹管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(personTrackService.deletePersonTrackByIds(ids));
    }

    /**
     * 新增人员轨迹
     */
    @RequiresPermissions("system:personTrack:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存人员轨迹
     */
    @RequiresPermissions("system:personTrack:add")
    @Log(title = "人员轨迹管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody PersonTrack personTrack)
    {
        return toAjax(personTrackService.insertPersonTrack(personTrack));
    }

    /**
     * 修改人员轨迹
     */
    @RequiresPermissions("system:personTrack:view")
    @GetMapping("/detail")
    @ResponseBody
    public AjaxResult detail(@RequestParam Long id)
    {
        return success(personTrackService.selectPersonTrackById(id));
    }

    /**
     * 修改保存人员轨迹
     */
    @RequiresPermissions("system:personTrack:edit")
    @Log(title = "人员轨迹管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody PersonTrack personTrack)
    {
        return toAjax(personTrackService.updatePersonTrack(personTrack));
    }
}
