package com.ruoyi.web.controller.common;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.PlatformConfig;
import com.ruoyi.common.utils.PlatformContext;
import com.ruoyi.system.service.IPlatformConfigService;

/**
 * 平台切换通用接口
 * 
 * @author ruoyi
 * @date 2026-04-12
 */
@RestController
@RequestMapping("/cosl/api/platform")
public class PlatformSwitchController extends BaseController
{
    @Autowired
    private IPlatformConfigService platformConfigService;

    /**
     * 获取所有启用的钻井平台列表
     * 用于前端下拉选择
     */
    @GetMapping("/list")
    public AjaxResult getPlatformList()
    {
        List<PlatformConfig> platforms = platformConfigService.selectActivePlatformList();
        return success(platforms);
    }

    /**
     * 切换当前钻井平台
     * 前端调用此接口后，后续请求需要在Header中携带 X-Platform-No
     * 
     * @param params 包含 platformNo 参数
     * @return 结果
     */
    @PostMapping("/switch")
    public AjaxResult switchPlatform(@RequestBody java.util.Map<String, String> params)
    {
        String platformNo = params.get("platformNo");
        
        if (platformNo == null || platformNo.isEmpty())
        {
            return error("平台编号不能为空");
        }

        // 验证平台是否存在且启用
        PlatformConfig platform = platformConfigService.selectPlatformConfigByNo(platformNo);
        if (platform == null)
        {
            return error("平台不存在或已停用");
        }

        // 这里可以将平台编号存储到Session或Redis中
        // 目前通过拦截器从请求头获取，前端需要在后续请求中携带
        
        // 返回平台信息
        return success(platform);
    }

    /**
     * 获取当前选择的平台信息
     */
    @GetMapping("/current")
    public AjaxResult getCurrentPlatform()
    {
        String platformNo = PlatformContext.getPlatformNo();
        
        if (platformNo == null || platformNo.isEmpty())
        {
            return success(null);
        }

        PlatformConfig platform = platformConfigService.selectPlatformConfigByNo(platformNo);
        return success(platform);
    }
}
