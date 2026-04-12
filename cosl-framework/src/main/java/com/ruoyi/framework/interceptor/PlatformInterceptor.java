package com.ruoyi.framework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.ruoyi.common.utils.PlatformContext;
import com.ruoyi.common.utils.StringUtils;

/**
 * 钻井平台切换拦截器
 * 从请求头或参数中获取平台编号并设置到上下文中
 * 
 * @author ruoyi
 * @date 2026-04-12
 */
@Component
public class PlatformInterceptor implements HandlerInterceptor
{
    /**
     * 平台编号请求头名称
     */
    private static final String PLATFORM_HEADER = "X-Platform-No";

    /**
     * 平台编号请求参数名称
     */
    private static final String PLATFORM_PARAM = "platformNo";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        // 优先从请求头获取平台编号
        String platformNo = request.getHeader(PLATFORM_HEADER);
        
        // 如果请求头中没有，则从请求参数中获取
        if (StringUtils.isEmpty(platformNo))
        {
            platformNo = request.getParameter(PLATFORM_PARAM);
        }

        // 设置到上下文中
        if (StringUtils.isNotEmpty(platformNo))
        {
            PlatformContext.setPlatformNo(platformNo);
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception
    {
        // 可以在这里添加一些后置处理逻辑
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception
    {
        // 请求完成后清除上下文，避免内存泄漏
        PlatformContext.clear();
    }
}
