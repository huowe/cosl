package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.entity.*;
import com.ruoyi.common.utils.PlatformContext;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysPost;
import com.ruoyi.system.service.IPersonFeatureDetailService;
import com.ruoyi.system.service.IPersonService;
import com.ruoyi.system.service.ISysDictDataService;
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
import com.ruoyi.common.utils.ImageBase64Utils;
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
    @Autowired
    private IPersonFeatureDetailService personFeatureDetailService;
    @Autowired
    private ISysDictDataService dictDataService;
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
        
        // 从字典表获取默认的 repId
        String defaultRepId = getDefaultRepId();
        monitorCreateRequest.setRepId(defaultRepId);
        
        MonitorQueryRequest monitorQueryRequest = new MonitorQueryRequest();
        List<String> repIds = new ArrayList<>();
        repIds.add(defaultRepId);
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
     * 获取人员详情
     */
    @RequiresPermissions("system:person:view")
    @GetMapping("/getStats")
    @ResponseBody
    public AjaxResult getStats(@RequestParam Long id)
    {
        Person person = personService.selectPersonById(id);
        person.setStatus(person.getStatus());
        
        // 根据monitorId查询所有特征数据
        if (person.getMonitorId() != null && !person.getMonitorId().isEmpty()) {
            PersonFeatureDetail queryParam = new PersonFeatureDetail();
            queryParam.setMonitorId(person.getMonitorId());
            List<PersonFeatureDetail> featureDetails = personFeatureDetailService.selectPersonFeatureDetailList(queryParam);
            
            // 将特征数据添加到返回结果中
            JSONObject result = JSONObject.parseObject(JSONObject.toJSONString(person));
            result.put("featureDetails", featureDetails);
            return success(result);
        }
        
        return success(person);
    }

    /**
     * 确认步态特征已采集
     */
    @RequiresPermissions("system:person:edit")
    @Log(title = "人员管理", businessType = BusinessType.UPDATE)
    @PostMapping("/confirmGaitFeature")
    @ResponseBody
    public AjaxResult confirmGaitFeature(@RequestBody JSONObject params)
    {
        Long id = params.getLong("id");
        
        if (id == null) {
            return error("人员 ID 不能为空");
        }
        
        Person person = personService.selectPersonById(id);
        if (person == null) {
            return error("人员不存在");
        }
        
        // 更新步态特征确认状态为已确认
        person.setGaitFeatureConfirmed(1);
        
        int result = personService.updatePerson(person);
        
        if (result > 0) {
            return success("步态特征确认成功");
        } else {
            return error("步态特征确认失败");
        }
    }

    /**
     * 取消步态特征确认
     */
    @RequiresPermissions("system:person:edit")
    @Log(title = "人员管理", businessType = BusinessType.UPDATE)
    @PostMapping("/cancelGaitFeatureConfirm")
    @ResponseBody
    public AjaxResult cancelGaitFeatureConfirm(@RequestBody JSONObject params)
    {
        Long id = params.getLong("id");
        
        if (id == null) {
            return error("人员 ID 不能为空");
        }
        
        Person person = personService.selectPersonById(id);
        if (person == null) {
            return error("人员不存在");
        }
        
        // 更新步态特征确认状态为未确认
        person.setGaitFeatureConfirmed(0);
        
        int result = personService.updatePerson(person);
        
        if (result > 0) {
            return success("取消步态特征确认成功");
        } else {
            return error("取消步态特征确认失败");
        }
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
     * 绑定底库人员特征并确认步态采集
     */
    @RequiresPermissions("system:person:edit")
    @Log(title = "绑定底库人员特征", businessType = BusinessType.INSERT)
    @PostMapping("/bindFeatureAndConfirm")
    @ResponseBody
    public AjaxResult bindFeatureAndConfirm(@RequestBody MonitorBindFeatureRequest request)
    {
        String res = yuanJianApiClient.monitorBindFeature(request);
        JSONObject jsonObject = JSONObject.parseObject(res);
        
        // 如果绑定成功，执行后续操作
        if (jsonObject.getString("code").equals("SUCCESS")) {
            try {
                // 1. 查询特征详情并保存到数据库
                saveFeatureDetails(request.getMonitorId(), request.getFeatureIds());
                
                // 2. 根据 monitorId 查找对应的人员，确认步态特征
                confirmGaitFeatureByMonitorId(request.getMonitorId());
                
            } catch (Exception e) {
                // 记录日志但不影响主流程
                System.err.println("保存特征详情或确认步态失败: " + e.getMessage());
                e.printStackTrace();
            }
        }
        
        return success(jsonObject);
    }

    /**
     * 根据 monitorId 确认人员的步态特征
     * @param monitorId 底库人员ID
     */
    private void confirmGaitFeatureByMonitorId(String monitorId) {
        if (monitorId == null || monitorId.isEmpty()) {
            return;
        }
        
        // 根据 monitorId 查询人员
        Person queryParam = new Person();
        queryParam.setMonitorId(monitorId);
        List<Person> personList = personService.selectPersonList(queryParam);
        
        if (personList != null && !personList.isEmpty()) {
            Person person = personList.get(0);
            
            // 如果还未确认，则确认为已确认
            if (person.getGaitFeatureConfirmed() == null || person.getGaitFeatureConfirmed() != 1) {
                person.setGaitFeatureConfirmed(1);
                personService.updatePerson(person);
                
                System.out.println("人员 " + person.getName() + " (ID: " + person.getId() + ") 的步态特征已自动确认");
            }
        } else {
            System.err.println("未找到 monitorId 为 " + monitorId + " 的人员");
        }
    }

    /**
     * 绑定底库人员特征（原接口，保留兼容）
     */
    @RequiresPermissions("system:person:view")
    @Log(title = "绑定底库人员特征", businessType = BusinessType.INSERT)
    @PostMapping("/monitorBindFeature")
    @ResponseBody
    public AjaxResult monitorBindFeature(@RequestBody MonitorBindFeatureRequest request)
    {
        String res = yuanJianApiClient.monitorBindFeature(request);
        JSONObject jsonObject = JSONObject.parseObject(res);
        
        // 如果绑定成功，查询特征详情并保存到数据库
        if (jsonObject.getString("code").equals("SUCCESS")) {
            try {
                saveFeatureDetails(request.getMonitorId(), request.getFeatureIds());
            } catch (Exception e) {
                // 记录日志但不影响主流程
                System.err.println("保存特征详情失败: " + e.getMessage());
                e.printStackTrace();
            }
        }
        
        return success(jsonObject);
    }

    /**
     * 保存特征详情到数据库
     * @param monitorId 底库人员id
     * @param featureIds 特征id列表
     */
    private void saveFeatureDetails(String monitorId, List<String> featureIds) {
        if (featureIds == null || featureIds.isEmpty()) {
            return;
        }

        List<PersonFeatureDetail> detailList = new ArrayList<>();

        for (String featureId : featureIds) {
            try {
                // 调用API获取特征详情
                String response = yuanJianApiClient.getMonitorFeatureDetail(featureId);
                MonitorFeatureResponse featureResponse = JSONObject.parseObject(response, MonitorFeatureResponse.class);

                if (featureResponse.getSuccess() && featureResponse.getData() != null) {
                    MonitorFeatureData data = featureResponse.getData();

                    // 检查是否已存在
                    PersonFeatureDetail existing = personFeatureDetailService.selectByMonitorIdAndFeatureId(monitorId, featureId);
                    
                    PersonFeatureDetail detail = new PersonFeatureDetail();
                    detail.setMonitorId(monitorId);
                    detail.setFeatureId(data.getGaitID());
                    detail.setAngle(data.getAngle());
                    detail.setCreateTime(data.getCreateTime());
                    detail.setDeviceId(data.getDeviceId());
                    
                    // 将图片URL转换为Base64
                    detail.setFacePath(convertImageToBase64(data.getFacePath()));
                    detail.setMasterOriginalImage(convertImageToBase64(data.getMasterOriginalImage()));
                    detail.setOriginalImage(convertImageToBase64(data.getOriginalImage()));
                    detail.setPreviewImage(convertImageToBase64(data.getPreviewImage()));
                    
                    detail.setSequenceCount(data.getSequenceCount());
                    detail.setSequenceImgUrl(convertImageToBase64(data.getSequenceImgUrl()));
                    detail.setSequenceVideoUrl(data.getSequenceVideoUrl()); // 视频保持URL
                    detail.setSourceIdentify(data.getSourceIdentify());
                    detail.setSourceType(data.getSourceType());
                    detail.setTargetType(data.getTargetType());
                    detail.setVideoSourceName(data.getVideoSourceName());
                    detail.setVideoUrl(data.getVideoUrl()); // 视频保持URL
                    detail.setZipUrl(data.getZipUrl()); // ZIP保持URL

                    if (existing != null) {
                        // 更新已有记录
                        detail.setId(existing.getId());
                        personFeatureDetailService.updatePersonFeatureDetail(detail);
                    } else {
                        // 新增记录
                        detailList.add(detail);
                    }
                }
            } catch (Exception e) {
                System.err.println("获取特征详情失败，featureId: " + featureId + ", 错误: " + e.getMessage());
            }
        }

        // 批量插入新记录
        if (!detailList.isEmpty()) {
            personFeatureDetailService.batchInsertPersonFeatureDetail(detailList);
        }
    }

    /**
     * 将图片URL转换为Base64
     * @param imageUrl 图片URL
     * @return Base64字符串，如果URL为空或转换失败则返回原值
     */
    private String convertImageToBase64(String imageUrl) {
        if (imageUrl == null || imageUrl.isEmpty()) {
            return imageUrl;
        }
        
        try {
            String base64 = ImageBase64Utils.imageUrlToBase64(imageUrl);
            return base64 != null ? base64 : imageUrl; // 如果转换失败，保留原URL
        } catch (Exception e) {
            System.err.println("图片转Base64失败，URL: " + imageUrl + ", 错误: " + e.getMessage());
            return imageUrl; // 转换失败时保留原URL
        }
    }

    /**
     * 从字典表获取默认的 repId
     * @return 默认的 repId
     */
    private String getDefaultRepId() {
        String platformNo = PlatformContext.getPlatformNo();
        
        SysDictData queryParam = new SysDictData();
        queryParam.setDictType("yuanjian_config");
        queryParam.setDictLabel("repId");
        queryParam.setPlatformNo(platformNo);
        
        List<SysDictData> list = dictDataService.selectDictDataList(queryParam);
        
        if (list != null && !list.isEmpty()) {
            return list.get(0).getDictValue();
        }
        
        // 如果字典表中没有，返回默认值
        return "69df3d66b3efc17c8d04bab5";
    }

    /**
     * 从字典表获取默认的 cameraGroupId
     * @return 默认的 cameraGroupId
     */
    private String getDefaultCameraGroupId() {
        String platformNo = PlatformContext.getPlatformNo();
        
        SysDictData queryParam = new SysDictData();
        queryParam.setDictType("yuanjian_config");
        queryParam.setDictLabel("cameraGroupId");
        queryParam.setPlatformNo(platformNo);
        
        List<SysDictData> list = dictDataService.selectDictDataList(queryParam);
        
        if (list != null && !list.isEmpty()) {
            return list.get(0).getDictValue();
        }
        
        // 如果字典表中没有，返回null
        return null;
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
