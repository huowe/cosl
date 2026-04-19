package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.Date;
import java.util.ArrayList;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONArray;
import com.ruoyi.common.utils.PlatformContext;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.domain.entity.Person;
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
import com.ruoyi.system.domain.Evacuation;
import com.ruoyi.system.domain.EvacuationRecord;
import com.ruoyi.system.domain.LifeboatConfig;
import com.ruoyi.system.service.IEvacuationService;
import com.ruoyi.system.mapper.PersonMapper;
import com.ruoyi.web.controller.tool.YuanJianApiClient;

/**
 * 紧急撤离 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/api/evacuation")
public class EvacuationController extends BaseController
{
    private String prefix = "system/evacuation";

    @Autowired
    private IEvacuationService evacuationService;

    @Autowired
    private PersonMapper personMapper;

    @Autowired
    private YuanJianApiClient yuanJianApiClient;

    @RequiresPermissions("system:evacuation:view")
    @GetMapping()
    public String evacuation()
    {
        return prefix + "/evacuation";
    }

    /**
     * 查询紧急撤离列表
     */
    @RequiresPermissions("system:evacuation:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(@RequestBody Evacuation evacuation)
    {
        startPage();
        List<Evacuation> list = evacuationService.selectEvacuationList(evacuation);
        return getDataTable(list);
    }

    @Log(title = "紧急撤离管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:evacuation:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Evacuation evacuation)
    {
        List<Evacuation> list = evacuationService.selectEvacuationList(evacuation);
        ExcelUtil<Evacuation> util = new ExcelUtil<Evacuation>(Evacuation.class);
        return util.exportExcel(list, "紧急撤离数据");
    }

    /**
     * 新增紧急撤离
     */
    @RequiresPermissions("system:evacuation:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存紧急撤离
     */
    @RequiresPermissions("system:evacuation:add")
    @Log(title = "新增紧急撤离", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody Evacuation evacuation)
    {
        String platformNo = PlatformContext.getPlatformNo();
        evacuation.setPlatformNo(platformNo);
        evacuation.setCreateBy(getLoginName());
        evacuationService.insertEvacuationWithAllPersons(evacuation);
        return success(evacuation);
    }

    /**
     * 新增保存紧急撤离（包含全部人员）
     */
    @RequiresPermissions("system:evacuation:add")
    @Log(title = "", businessType = BusinessType.INSERT)
    @PostMapping("/addWithAllPersons")
    @ResponseBody
    public AjaxResult addWithAllPersons(@RequestBody Evacuation evacuation)
    {
        String platformNo = PlatformContext.getPlatformNo();
        evacuation.setPlatformNo(platformNo);
        evacuation.setCreateBy(getLoginName());
        return toAjax(evacuationService.insertEvacuationWithAllPersons(evacuation));
    }

    /**
     * 修改紧急撤离
     */
    @RequiresPermissions("system:evacuation:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("evacuation", evacuationService.selectEvacuationById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存紧急撤离
     */
    @RequiresPermissions("system:evacuation:edit")
    @Log(title = "紧急撤离管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody Evacuation evacuation)
    {
        evacuation.setUpdateBy(getLoginName());
        evacuationService.updateEvacuation(evacuation);
        return success(evacuation);
    }

    /**
     * 删除紧急撤离
     */
    @RequiresPermissions("system:evacuation:remove")
    @Log(title = "紧急撤离管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(evacuationService.deleteEvacuationByIds(ids));
    }

    /**
     * 开始撤离
     */
    @RequiresPermissions("system:evacuation:edit")
    @Log(title = "紧急撤离管理", businessType = BusinessType.UPDATE)
    @PostMapping("/startEvacuation")
    @ResponseBody
    public AjaxResult startEvacuation(@RequestParam Long id)
    {
        return toAjax(evacuationService.startEvacuation(id));
    }

    /**
     * 获取进行中的撤离事件
     */
    @RequiresPermissions("system:evacuation:view")
    @GetMapping("/getActiveEvacuation")
    @ResponseBody
    public AjaxResult getActiveEvacuation(@RequestParam Long id)
    {
        Evacuation activeEvacuation = evacuationService.getActiveEvacuation(id);
        if (StringUtils.isNull(activeEvacuation))
        {
            return error("当前没有进行中的撤离事件");
        }
        return success(activeEvacuation);
    }

    /**
     * 结束撤离
     */
    @RequiresPermissions("system:evacuation:edit")
    @Log(title = "紧急撤离管理", businessType = BusinessType.UPDATE)
    @PostMapping("/endEvacuation")
    @ResponseBody
    public AjaxResult endEvacuation(@RequestParam Long id)
    {
        return toAjax(evacuationService.endEvacuation(id));
    }

    /**
     * 登记人员撤离信息
     */
    @RequiresPermissions("system:evacuation:edit")
    @Log(title = "紧急撤离管理", businessType = BusinessType.UPDATE)
    @PostMapping("/registerPerson")
    @ResponseBody
    public AjaxResult registerPerson(@RequestParam Long evacuationId,
                                     @RequestParam Long personId,
                                     @RequestParam(required = false) Long lifeboatId,
                                     @RequestParam(required = false) Integer seatNo,
                                     @RequestParam(defaultValue = "EVACUATED") String status)
    {
        return toAjax(evacuationService.registerEvacuationPerson(evacuationId, personId, lifeboatId, seatNo, status));
    }

    /**
     * 更新人员到达时间
     */
    @RequiresPermissions("system:evacuation:edit")
    @Log(title = "紧急撤离管理", businessType = BusinessType.UPDATE)
    @PostMapping("/updateArriveTime")
    @ResponseBody
    public AjaxResult updateArriveTime(@RequestParam Long recordId)
    {
        return toAjax(evacuationService.updateArriveTime(recordId));
    }

    /**
     * 更新人员登艇时间
     */
    @RequiresPermissions("system:evacuation:edit")
    @Log(title = "紧急撤离管理", businessType = BusinessType.UPDATE)
    @PostMapping("/updateBoardTime")
    @ResponseBody
    public AjaxResult updateBoardTime(@RequestParam Long recordId)
    {
        return toAjax(evacuationService.updateBoardTime(recordId));
    }

    /**
     * 更新人员撤离状态
     */
    @RequiresPermissions("system:evacuation:edit")
    @Log(title = "紧急撤离管理", businessType = BusinessType.UPDATE)
    @PostMapping("/updateRecordStatus")
    @ResponseBody
    public AjaxResult updateRecordStatus(@RequestParam Long recordId,
                                         @RequestParam String status)
    {
        return toAjax(evacuationService.updateEvacuationRecordStatus(recordId, status));
    }

    /**
     * 查询未满员的救生艇列表
     */
    @RequiresPermissions("system:evacuation:view")
    @GetMapping("/availableLifeboats/{evacuationId}")
    @ResponseBody
    public AjaxResult availableLifeboats(@PathVariable("evacuationId") Long evacuationId)
    {
        List<LifeboatConfig> list = evacuationService.selectAvailableLifeboats(evacuationId);
        return success(list);
    }

    /**
     * 自动检测并更新撤离人员状态
     */
    @RequiresPermissions("system:evacuation:edit")
    @Log(title = "紧急撤离管理", businessType = BusinessType.UPDATE)
    @PostMapping("/autoUpdateStatus")
    @ResponseBody
    public AjaxResult autoUpdateStatus(@RequestParam Long evacuationId,
                                       @RequestParam String startTime,
                                       @RequestParam String endTime)
    {
        try {
            // 1. 查询撤离事件的所有人员记录
            List<EvacuationRecord> records = evacuationService.selectEvacuationRecordsByEvacuationId(evacuationId);
            if (records == null || records.isEmpty())
            {
                return error("没有找到撤离人员记录");
            }

            // 2. 对每个人员调用 API 检测
            int updatedCount = 0;
            for (EvacuationRecord record : records)
            {
                if (record.getPersonId() == null)
                {
                    continue;
                }

                Person person = personMapper.selectPersonById(record.getPersonId());
                if (person == null || person.getMonitorId() == null || person.getMonitorId().isEmpty())
                {
                    continue;
                }

                try
                {
                    // 2.1 获取人员的 featureId
                    String monitorFeatureRes = yuanJianApiClient.getMonitorFeature(person.getMonitorId());
                    JSONObject monitorFeatureJson = JSONObject.parseObject(monitorFeatureRes);

                    if (!"SUCCESS".equals(monitorFeatureJson.getString("code")))
                    {
                        continue;
                    }

                    JSONObject data = monitorFeatureJson.getJSONObject("data");
                    if (data == null)
                    {
                        continue;
                    }

                    String featureId = data.getString("featureId");
                    if (featureId == null || featureId.isEmpty())
                    {
                        continue;
                    }

                    // 2.2 调用 /comparison/snap 接口检测抓拍
                    List<String> featureIds = new ArrayList<>();
                    featureIds.add(featureId);

                    String comparisonRes = yuanJianApiClient.snapComparisonForMonitor(featureIds, startTime, endTime);
                    JSONObject comparisonJson = JSONObject.parseObject(comparisonRes);

                    if (!"SUCCESS".equals(comparisonJson.getString("code")))
                    {
                        continue;
                    }

                    JSONObject comparisonData = comparisonJson.getJSONObject("data");
                    if (comparisonData == null)
                    {
                        continue;
                    }

                    // 2.3 检查返回结果数量
                    JSONArray page = comparisonData.getJSONArray("page");
                    if (page != null && !page.isEmpty())
                    {
                        JSONArray recordsArray = page.getJSONObject(0).getJSONArray("records");
                        if (recordsArray != null && recordsArray.size() >= 1)
                        {
                            // 2.4 更新状态为已撤离
                            evacuationService.updateEvacuationRecordStatus(record.getId(), "EVACUATED");
                            updatedCount++;
                        }
                    }
                }
                catch (Exception e)
                {
                    // 记录错误但不中断流程
                    System.err.println("处理人员 " + person.getName() + " 时出错: " + e.getMessage());
                    e.printStackTrace();
                }
            }

            return success("成功更新 " + updatedCount + " 条记录的状态");
        }
        catch (Exception e)
        {
            return error("自动更新状态失败: " + e.getMessage());
        }
    }

    /**
     * 查询撤离人员记录列表
     */
    @RequiresPermissions("system:evacuation:view")
    @GetMapping("/records/{evacuationId}")
    @ResponseBody
    public TableDataInfo records(@PathVariable("evacuationId") Long evacuationId)
    {
        List<EvacuationRecord> list = evacuationService.selectEvacuationRecordsByEvacuationId(evacuationId);
        return getDataTable(list);
    }

    /**
     * 删除撤离人员记录
     */
    @RequiresPermissions("system:evacuation:remove")
    @Log(title = "紧急撤离管理", businessType = BusinessType.DELETE)
    @PostMapping("/record/remove")
    @ResponseBody
    public AjaxResult removeRecord(@RequestParam String ids)
    {
        return toAjax(evacuationService.deleteEvacuationRecordByIds(ids));
    }

    /**
     * 详情
     */
    @RequiresPermissions("system:evacuation:view")
    @PostMapping("/detail")
    @ResponseBody
    public AjaxResult detail(@RequestParam Long id)
    {
        return success(evacuationService.selectEvacuationById(id));
    }

}
