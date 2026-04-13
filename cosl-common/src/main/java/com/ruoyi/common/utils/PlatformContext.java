package com.ruoyi.common.utils;

import com.ruoyi.common.config.PlatformConfig;
import com.ruoyi.common.utils.spring.SpringUtils;

/**
 * 钻井平台上下文工具类
 * 用于存储和获取当前用户选择的钻井平台编号
 * 
 * @author ruoyi
 * @date 2026-04-12
 */
public class PlatformContext
{
    /**
     * 使用ThreadLocal存储当前线程的平台编号，确保线程安全
     */
    private static final ThreadLocal<String> PLATFORM_HOLDER = new ThreadLocal<>();

    /**
     * 设置当前平台编号
     * 
     * @param platformNo 平台编号
     */
    public static void setPlatformNo(String platformNo)
    {
        PLATFORM_HOLDER.set(platformNo);
    }

    /**
     * 获取当前平台编号
     * 如果ThreadLocal中没有，则从配置文件中读取默认值
     * 
     * @return 平台编号
     */
    public static String getPlatformNo()
    {
        String platformNo = PLATFORM_HOLDER.get();
        // 如果ThreadLocal中没有，尝试从配置文件获取默认值
        if (platformNo == null || platformNo.isEmpty())
        {
            try
            {
                PlatformConfig platformConfig = SpringUtils.getBean(PlatformConfig.class);
                if (platformConfig != null)
                {
                    platformNo = platformConfig.getPlatformNo();
                }
            }
            catch (Exception e)
            {
                // 如果无法获取Bean，返回默认值
                platformNo = "DEFAULT";
            }
        }
        return platformNo;
    }

    /**
     * 清除当前平台编号
     */
    public static void clear()
    {
        PLATFORM_HOLDER.remove();
    }

    /**
     * 判断是否已设置平台编号
     * 
     * @return true-已设置，false-未设置
     */
    public static boolean hasPlatformNo()
    {
        String platformNo = PLATFORM_HOLDER.get();
        return platformNo != null && !platformNo.isEmpty();
    }
}
