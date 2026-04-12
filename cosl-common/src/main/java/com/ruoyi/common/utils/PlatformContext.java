package com.ruoyi.common.utils;

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
     * 
     * @return 平台编号
     */
    public static String getPlatformNo()
    {
        return PLATFORM_HOLDER.get();
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
