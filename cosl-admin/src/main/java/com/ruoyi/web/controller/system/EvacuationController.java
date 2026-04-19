package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.Date;

import com.ruoyi.common.utils.PlatformContext;
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
import com.ruoyi.system.domain.Evacuation;
import com.ruoyi.system.domain.EvacuationRecord;
import com.ruoyi.system.domain.LifeboatConfig;
import com.ruoyi.system.service.IEvacuationService;

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
    public AjaxResult getActiveEvacuation()
    {
        Evacuation activeEvacuation = evacuationService.getActiveEvacuation();
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
