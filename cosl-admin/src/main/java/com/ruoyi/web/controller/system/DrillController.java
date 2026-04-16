package com.ruoyi.web.controller.system;

import java.util.List;

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
import com.ruoyi.system.domain.Drill;
import com.ruoyi.system.service.IDrillService;

/**
 * 演练 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/api/drill")
public class DrillController extends BaseController
{
    private String prefix = "system/drill";

    @Autowired
    private IDrillService drillService;

    @RequiresPermissions("system:drill:view")
    @GetMapping()
    public String drill()
    {
        return prefix + "/drill";
    }

    /**
     * 查询演练列表
     */
    @RequiresPermissions("system:drill:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(@RequestBody Drill drill)
    {
        startPage();
        List<Drill> list = drillService.selectDrillList(drill);
        return getDataTable(list);
    }

    @Log(title = "演练管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:drill:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Drill drill)
    {
        List<Drill> list = drillService.selectDrillList(drill);
        ExcelUtil<Drill> util = new ExcelUtil<Drill>(Drill.class);
        return util.exportExcel(list, "演练数据");
    }

    /**
     * 新增演练
     */
    @RequiresPermissions("system:drill:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存演练
     */
    @RequiresPermissions("system:drill:add")
    @Log(title = "新增演练", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody Drill drill)
    {
        String platformNo = PlatformContext.getPlatformNo();
        drill.setPlatformNo(platformNo);
        drill.setCreateBy(getLoginName());
        return toAjax(drillService.insertDrill(drill));
    }

    /**
     * 修改演练
     */
    @RequiresPermissions("system:drill:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("drill", drillService.selectDrillById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存演练
     */
    @RequiresPermissions("system:drill:edit")
    @Log(title = "演练管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody Drill drill)
    {
        drill.setUpdateBy(getLoginName());
        return toAjax(drillService.updateDrill(drill));
    }

    /**
     * 删除演练
     */
    @RequiresPermissions("system:drill:remove")
    @Log(title = "演练管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(drillService.deleteDrillByIds(ids));
    }
    /**
     * 开始演练
     */
    @RequiresPermissions("system:drill:edit")
    @Log(title = "演练管理", businessType = BusinessType.UPDATE)
    @PostMapping("/startDrill")
    @ResponseBody
    public AjaxResult startDrill(@RequestParam Long id)
    {
        return toAjax(drillService.startDrill(id));
    }

    /**
     * 获取进行中的演练
     */
    @RequiresPermissions("system:drill:view")
    @GetMapping("/getActiveDrill")
    @ResponseBody
    public AjaxResult getActiveDrill()
    {
        Drill activeDrill = drillService.getActiveDrill();
        if (StringUtils.isNull(activeDrill))
        {
            return error("当前没有进行中的演练");
        }
        return success(activeDrill);
    }

    /**
     * 结束演练
     */
    @RequiresPermissions("system:drill:edit")
    @Log(title = "演练管理", businessType = BusinessType.UPDATE)
    @PostMapping("/endDrill")
    @ResponseBody
    public AjaxResult endDrill(@RequestParam Long id)
    {
        return toAjax(drillService.endDrill(id));
    }

    /**
     * 切换人员签到状态（点名）
     */
    @RequiresPermissions("system:drill:edit")
    @Log(title = "演练管理", businessType = BusinessType.UPDATE)
    @PostMapping("/togglePersonnelStatus")
    @ResponseBody
    public AjaxResult togglePersonnelStatus(@RequestParam Long drillId,
                                            @RequestParam Long personId,
                                            @RequestParam String status)
    {
        return toAjax(drillService.togglePersonnelStatus(drillId, personId, status));
    }

    @RequiresPermissions("system:drill:view")
    @Log(title = "演练管理", businessType = BusinessType.UPDATE)
    @PostMapping("/detail")
    @ResponseBody
    public AjaxResult drillDetail(@RequestParam Long id)
    {
        return success(drillService.selectDrillById(id));
    }

}
