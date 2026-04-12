package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.PlatformStats;
import com.ruoyi.system.mapper.*;
import com.ruoyi.system.service.IPlatformStatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 平台数据统计 Service 业务层处理
 * 
 * @author ruoyi
 * @date 2026-04-04
 */
@Service
public class PlatformStatsServiceImpl implements IPlatformStatsService
{
    @Autowired
    private PersonMapper personMapper;

    @Autowired
    private RoomConfigMapper roomConfigMapper;

    @Autowired
    private LifeboatConfigMapper lifeboatConfigMapper;

    @Autowired
    private CameraMapper cameraMapper;

    @Autowired
    private DrillMapper drillMapper;

    /**
     * 获取平台数据统计
     * 
     * @return 平台数据统计信息
     */
    @Override
    public PlatformStats getPlatformStats()
    {
        PlatformStats platformStats = new PlatformStats();

        // 人员统计
        PlatformStats.PersonStats personStats = new PlatformStats.PersonStats();
        personStats.setTotal(personMapper.countPersonTotal());
        personStats.setCurrent(personMapper.countPersonCurrent());
        personStats.setEnter(personMapper.countPersonEnter());
        personStats.setLeave(personMapper.countPersonLeave());
        platformStats.setPersonStats(personStats);

        // 房间统计
        PlatformStats.RoomStats roomStats = new PlatformStats.RoomStats();
        roomStats.setTotal(roomConfigMapper.countRoomTotal());
        roomStats.setFree(roomConfigMapper.countRoomFree());
        platformStats.setRoomStats(roomStats);

        // 救生艇统计
        PlatformStats.LifeboatStats lifeboatStats = new PlatformStats.LifeboatStats();
        lifeboatStats.setTotal(lifeboatConfigMapper.countLifeboatTotal());
        lifeboatStats.setFree(lifeboatConfigMapper.countLifeboatFree());
        platformStats.setLifeboatStats(lifeboatStats);

        // 摄像头统计
        PlatformStats.CameraStats cameraStats = new PlatformStats.CameraStats();
        cameraStats.setTotal(cameraMapper.countCameraTotal());
        cameraStats.setOnline(cameraMapper.countCameraOnline());
        platformStats.setCameraStats(cameraStats);

        // 演习统计
        PlatformStats.DrillStats drillStats = new PlatformStats.DrillStats();
        drillStats.setThisMonth(drillMapper.countDrillThisMonth());
        drillStats.setTotal(drillMapper.countDrillTotal());
        platformStats.setDrillStats(drillStats);

        return platformStats;
    }
}
