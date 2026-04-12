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
import com.ruoyi.system.domain.PersonFace;
import com.ruoyi.system.service.IPersonFaceService;

/**
 * 人员人脸 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/api/personFace")
public class PersonFaceController extends BaseController
{
    private String prefix = "system/personFace";

    @Autowired
    private IPersonFaceService personFaceService;

    @RequiresPermissions("system:personFace:view")
    @GetMapping()
    public String personFace()
    {
        return prefix + "/personFace";
    }

    /**
     * 查询人员人脸列表
     */
    @RequiresPermissions("system:personFace:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(@RequestBody PersonFace personFace)
    {
        startPage();
        List<PersonFace> list = personFaceService.selectPersonFaceList(personFace);
        return getDataTable(list);
    }

    @Log(title = "人员人脸管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:personFace:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PersonFace personFace)
    {
        List<PersonFace> list = personFaceService.selectPersonFaceList(personFace);
        ExcelUtil<PersonFace> util = new ExcelUtil<PersonFace>(PersonFace.class);
        return util.exportExcel(list, "人员人脸数据");
    }

    /**
     * 新增人员人脸
     */
    @RequiresPermissions("system:personFace:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存人员人脸
     */
    @RequiresPermissions("system:personFace:add")
    @Log(title = "新增人员人脸", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody PersonFace personFace)
    {
        return toAjax(personFaceService.insertPersonFace(personFace));
    }

    /**
     * 修改人员人脸
     */
    @RequiresPermissions("system:personFace:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("personFace", personFaceService.selectPersonFaceById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存人员人脸
     */
    @RequiresPermissions("system:personFace:edit")
    @Log(title = "人员人脸管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody PersonFace personFace)
    {
        return toAjax(personFaceService.updatePersonFace(personFace));
    }

    /**
     * 删除人员人脸
     */
    @RequiresPermissions("system:personFace:remove")
    @Log(title = "人员人脸管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(personFaceService.deletePersonFaceByIds(ids));
    }
}
