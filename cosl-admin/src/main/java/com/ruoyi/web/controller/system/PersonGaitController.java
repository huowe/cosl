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
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.PersonGait;
import com.ruoyi.system.service.IPersonGaitService;

/**
 * 人员步态 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/api/personGait")
public class PersonGaitController extends BaseController
{
    private String prefix = "system/personGait";

    @Autowired
    private IPersonGaitService personGaitService;

    @RequiresPermissions("system:personGait:view")
    @GetMapping()
    public String personGait()
    {
        return prefix + "/personGait";
    }

    /**
     * 查询人员步态列表
     */
    @RequiresPermissions("system:personGait:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(@RequestBody PersonGait personGait)
    {
        startPage();
        List<PersonGait> list = personGaitService.selectPersonGaitList(personGait);
        return getDataTable(list);
    }

    @Log(title = "人员步态管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:personGait:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PersonGait personGait)
    {
        List<PersonGait> list = personGaitService.selectPersonGaitList(personGait);
        ExcelUtil<PersonGait> util = new ExcelUtil<PersonGait>(PersonGait.class);
        return util.exportExcel(list, "人员步态数据");
    }

    /**
     * 新增人员步态
     */
    @RequiresPermissions("system:personGait:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存人员步态
     */
    @RequiresPermissions("system:personGait:add")
    @Log(title = "新增人员步态", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody PersonGait personGait)
    {
        return toAjax(personGaitService.insertPersonGait(personGait));
    }

    /**
     * 修改人员步态
     */
    @RequiresPermissions("system:personGait:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("personGait", personGaitService.selectPersonGaitById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存人员步态
     */
    @RequiresPermissions("system:personGait:edit")
    @Log(title = "人员步态管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody PersonGait personGait)
    {
        return toAjax(personGaitService.updatePersonGait(personGait));
    }

    /**
     * 删除人员步态
     */
    @RequiresPermissions("system:personGait:remove")
    @Log(title = "人员步态管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(personGaitService.deletePersonGaitByIds(ids));
    }
}
