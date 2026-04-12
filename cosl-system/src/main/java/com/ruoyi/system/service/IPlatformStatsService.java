package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.PlatformStats;

/**
 * 平台数据统计 Service 接口
 * 
 * @author ruoyi
 * @date 2026-04-04
 */
public interface IPlatformStatsService
{
    /**
     * 获取平台数据统计
     * 
     * @return 平台数据统计信息
     */
    public PlatformStats getPlatformStats();
}
