package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.entity.*;
import com.ruoyi.common.utils.PlatformContext;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysPost;
import com.ruoyi.system.service.IPersonService;
import com.ruoyi.system.service.ISysPostService;
import com.ruoyi.web.controller.tool.YuanJianApiClient;
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

import javax.annotation.Resource;

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
    @Autowired
    private ISysPostService postService;
    @Resource
    private YuanJianApiClient yuanJianApiClient;

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
        String platformNo = PlatformContext.getPlatformNo();
        person.setPlatformNo(platformNo);
        if (!personService.checkMtsCardNoUnique(person))
        {
            return error("新增人员'" + person.getName() + "'失败，MTS 卡号已存在");
        }
        if (StringUtils.isNotEmpty(person.getIdCard()) && !personService.checkIdCardUnique(person))
        {
            return error("新增人员'" + person.getName() + "'失败，身份证号已存在");
        }
        SysPost post = new SysPost();
        post.setPostName(person.getPosition());
        if (postService.checkPostNameUnique(post))
        {
            post.setCreateBy(getLoginName());
            post.setPlatformNo(PlatformContext.getPlatformNo());
            post.setStatus("0");
            postService.insertPost(post);
        }

        MonitorCreateRequest monitorCreateRequest = new MonitorCreateRequest();
        monitorCreateRequest.setName(person.getName());
        monitorCreateRequest.setIdCard(person.getIdCard());
        monitorCreateRequest.setRepId("69df3d66b3efc17c8d04bab5");
        MonitorQueryRequest monitorQueryRequest = new MonitorQueryRequest();
        List<String> repIds = new ArrayList<>();
        repIds.add("69df3d66b3efc17c8d04bab5");
        monitorQueryRequest.setRepIds(repIds);
        monitorQueryRequest.setQuery(person.getIdCard());
        String monitorQueryRes = yuanJianApiClient.queryMonitors(monitorQueryRequest);
        JSONObject monitorQueryJsonObject = JSONObject.parseObject(monitorQueryRes);
        if (monitorQueryJsonObject.getString("code").equals("SUCCESS"))
        {
            JSONArray monitors = monitorQueryJsonObject.getJSONObject("data").getJSONArray("monitors");
            if (monitors != null && !monitors.isEmpty())
            {
                person.setMonitorId(monitors.getJSONObject(0).getString("monitorId"));
            }else{
                String res = yuanJianApiClient.monitorCreate(monitorCreateRequest);
                JSONObject jsonObject = JSONObject.parseObject(res);
                if (jsonObject.getString("code").equals("SUCCESS"))
                {
                    person.setMonitorId(jsonObject.getJSONObject("data").getString("monitorId"));
                }
            }
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
    /**
     * 修改摄像机分组树
     */
    @RequiresPermissions("system:person:view")
    @GetMapping("/repository/tree")
    @ResponseBody
    public AjaxResult repositoryTree()
    {
        String res = yuanJianApiClient.getRepositoryTree();
        JSONObject jsonObject = JSONObject.parseObject(res);
        return success(jsonObject);
    }

    @RequiresPermissions("system:person:add")
    @Log(title = "新增底库", businessType = BusinessType.INSERT)
    @PostMapping("/repository/add")
    @ResponseBody
    public AjaxResult repositoryAdd(@RequestBody YuanJianRepository repository)
    {
        String res = yuanJianApiClient.repositoryAdd(repository);
        JSONObject jsonObject = JSONObject.parseObject(res);
        return success(jsonObject);
    }
    /**
     * 上传图片同步解析
     */
    @RequiresPermissions("system:person:add")
    @Log(title = "上传图片同步解析", businessType = BusinessType.INSERT)
    @PostMapping("/imageAnalysis")
    @ResponseBody
    public AjaxResult imageAnalysis(@RequestBody ImageAnalysisRequest request)
    {
        String res = yuanJianApiClient.imageAnalysis(request);
        JSONObject jsonObject = JSONObject.parseObject(res);
        return success(jsonObject);
    }
    /**
     * 绑定底库人员特征
     */
    @RequiresPermissions("system:person:view")
    @Log(title = "绑定底库人员特征", businessType = BusinessType.INSERT)
    @PostMapping("/monitorBindFeature")
    @ResponseBody
    public AjaxResult monitorBindFeature(@RequestBody MonitorBindFeatureRequest request)
    {
        String res = yuanJianApiClient.monitorBindFeature(request);
        JSONObject jsonObject = JSONObject.parseObject(res);
        return success(jsonObject);
    }

    /**
     * 和抓拍比对
     */
    @RequiresPermissions("system:person:view")
    @Log(title = "和抓拍比对", businessType = BusinessType.INSERT)
    @PostMapping("/snapComparison")
    @ResponseBody
    public AjaxResult snapComparison(@RequestBody SnapComparisonRequest request)
    {
        String res = yuanJianApiClient.snapComparison(request);
        JSONObject jsonObject = JSONObject.parseObject(res);
        return success(jsonObject);
    }




}
