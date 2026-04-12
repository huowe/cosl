package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.common.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.Camera;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.service.ICameraService;

/**
 * 摄像头操作处理
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Controller
@RequestMapping("/api/camera")
public class CameraController extends BaseController
{
    private String prefix = "system/camera";

    @Autowired
    private ICameraService cameraService;

    @RequiresPermissions("system:camera:view")
    @GetMapping()
    public String operlog()
    {
        return prefix + "/camera";
    }

    @RequiresPermissions("system:camera:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(@RequestBody Camera camera)
    {
        startPage();
        List<Camera> list = cameraService.selectCameraList(camera);
        return getDataTable(list);
    }

    @Log(title = "摄像头管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:camera:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Camera camera)
    {
        List<Camera> list = cameraService.selectCameraList(camera);
        ExcelUtil<Camera> util = new ExcelUtil<Camera>(Camera.class);
        return util.exportExcel(list, "摄像头数据");
    }

    @RequiresPermissions("system:camera:remove")
    @Log(title = "摄像头管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam String ids)
    {
        return toAjax(cameraService.deleteCameraByIds(ids));
    }

    /**
     * 新增摄像头
     */
    @RequiresPermissions("system:camera:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存摄像头
     */
    @RequiresPermissions("system:camera:add")
    @Log(title = "摄像头管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody Camera camera)
    {
        if (!cameraService.checkIpUnique(camera))
        {
            return error("新增摄像头'" + camera.getName() + "'失败，IP 地址已存在");
        }
        camera.setCreateBy(getLoginName());
        return toAjax(cameraService.insertCamera(camera));
    }

    /**
     * 修改摄像头
     */
    @RequiresPermissions("system:camera:view")
    @GetMapping("/detail")
    @ResponseBody
    public AjaxResult detail(@RequestParam Long id)
    {
        return success(cameraService.selectCameraById(id));

    }
    /**
     * 修改摄像头
     */
    @RequiresPermissions("system:camera:view")
    @GetMapping("/getStats")
    @ResponseBody
    public AjaxResult getStats(@RequestParam Long id)
    {
        return success(cameraService.selectCameraById(id));

    }

    /**
     * 修改保存摄像头
     */
    @RequiresPermissions("system:camera:edit")
    @Log(title = "摄像头管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody Camera camera)
    {
        if (!cameraService.checkIpUnique(camera))
        {
            return error("修改摄像头'" + camera.getName() + "'失败，IP 地址已存在");
        }
        camera.setUpdateBy(getLoginName());
        return toAjax(cameraService.updateCamera(camera));
    }

    /**
     * 校验 IP 地址
     */
    @PostMapping("/checkIpUnique")
    @ResponseBody
    public boolean checkIpUnique(Camera camera)
    {
        return cameraService.checkIpUnique(camera);
    }

    /**
     * 根据楼层查询摄像头列表
     */
    @PostMapping("/getCamerasByFloor")
    @ResponseBody
    public List<Camera> getCamerasByFloor(@RequestParam String floor)
    {
        return cameraService.selectCamerasByFloor(floor);
    }

    /**
     * 更新摄像头位置 (地图拖拽)
     */
    @RequiresPermissions("system:camera:edit")
    @Log(title = "摄像头管理", businessType = BusinessType.UPDATE)
    @PostMapping("/updatePosition")
    @ResponseBody
    public AjaxResult updatePosition(@RequestBody Camera camera)
    {
        if (StringUtils.isNull(camera.getId()))
        {
            return error("摄像头 ID 不能为空");
        }
        return toAjax(cameraService.updatePosition(camera.getId(), camera.getxAxis(), camera.getyAxis()));
    }

    /**
     * 清除摄像头位置
     */
    @RequiresPermissions("system:camera:edit")
    @Log(title = "摄像头管理", businessType = BusinessType.UPDATE)
    @PostMapping("/clearPosition")
    @ResponseBody
    public AjaxResult clearPosition(@RequestParam Long id)
    {
        return toAjax(cameraService.clearPosition(id));
    }

}
