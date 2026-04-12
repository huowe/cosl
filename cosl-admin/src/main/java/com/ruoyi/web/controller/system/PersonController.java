package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.common.core.domain.entity.Person;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.IPersonService;
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

/**
 * 人员信息操作处理
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Controller
@RequestMapping("/api/person")
public class PersonController extends BaseController
{
    private String prefix = "system/person";

    @Autowired
    private IPersonService personService;

    @RequiresPermissions("system:person:view")
    @GetMapping()
    public String operlog()
    {
        return prefix + "/person";
    }

    @RequiresPermissions("system:person:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list( @RequestBody  Person person)
    {
        startPage();
        List<Person> list = personService.selectPersonList(person);
        return getDataTable(list);
    }

    @Log(title = "人员管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:person:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Person person)
    {
        List<Person> list = personService.selectPersonList(person);
        ExcelUtil<Person> util = new ExcelUtil<Person>(Person.class);
        return util.exportExcel(list, "人员数据");
    }

    @RequiresPermissions("system:person:remove")
    @Log(title = "人员管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(personService.deletePersonByIds(ids));
    }

    /**
     * 新增人员
     */
    @RequiresPermissions("system:person:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存人员
     */
    @RequiresPermissions("system:person:add")
    @Log(title = "人员管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody Person person)
    {
        if (!personService.checkMtsCardNoUnique(person))
        {
            return error("新增人员'" + person.getName() + "'失败，MTS 卡号已存在");
        }
        if (StringUtils.isNotEmpty(person.getIdCard()) && !personService.checkIdCardUnique(person))
        {
            return error("新增人员'" + person.getName() + "'失败，身份证号已存在");
        }
        return toAjax(personService.insertPerson(person));
    }

    /**
     * 修改人员
     */
    @RequiresPermissions("system:person:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("person", personService.selectPersonById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存人员
     */
    @RequiresPermissions("system:person:edit")
    @Log(title = "人员管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody Person person)
    {
        if (!personService.checkMtsCardNoUnique(person))
        {
            return error("修改人员'" + person.getName() + "'失败，MTS 卡号已存在");
        }
        if (StringUtils.isNotEmpty(person.getIdCard()) && !personService.checkIdCardUnique(person))
        {
            return error("修改人员'" + person.getName() + "'失败，身份证号已存在");
        }
        return toAjax(personService.updatePerson(person));
    }

    /**
     * 校验 MTS 卡号
     */
    @PostMapping("/checkMtsCardNoUnique")
    @ResponseBody
    public boolean checkMtsCardNoUnique(Person person)
    {
        return personService.checkMtsCardNoUnique(person);
    }

    /**
     * 校验身份证号
     */
    @PostMapping("/checkIdCardUnique")
    @ResponseBody
    public boolean checkIdCardUnique(Person person)
    {
        return personService.checkIdCardUnique(person);
    }
    /**
     * 修改人员
     */
    @RequiresPermissions("system:person:view")
    @GetMapping("/getStats")
    @ResponseBody
    public AjaxResult getStats(@RequestParam Long id)
    {
        Person person = personService.selectPersonById(id);
        person.setStatus(person.getStatus());
        return success(person);
    }

    /**
     * 批量更新人员房间信息
     */
    @RequiresPermissions("system:person:edit")
    @Log(title = "人员管理", businessType = BusinessType.UPDATE)
    @PostMapping("/batchUpdateRoomInfo")
    @ResponseBody
    public AjaxResult batchUpdateRoomInfo(@RequestBody List<Person> persons)
    {
        try
        {
            if (persons == null || persons.isEmpty())
            {
                return error("批量更新数据不能为空");
            }
            
            // 验证每个人员的房间和床位是否存在（可选）
            for (Person person : persons)
            {
                if (StringUtils.isNull(person.getId()))
                {
                    return error("人员 ID 不能为空：" + person.getName());
                }
            }
            
            int result = personService.batchUpdateRoomInfo(persons);
            return success("成功更新" + result + "条记录");
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }
    }
    
}
