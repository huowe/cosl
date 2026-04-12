package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.RoomConfig;
import com.ruoyi.common.core.domain.entity.RoomStats;

import java.util.List;

/**
 * 房间配置 Service 接口
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public interface IRoomConfigService
{
    /**
     * 查询房间配置
     * 
     * @param id 房间配置 ID
     * @return 房间配置
     */
    public RoomConfig selectRoomConfigById(Long id);

    /**
     * 查询房间配置列表
     * 
     * @param roomConfig 房间配置
     * @return 房间配置集合
     */
    public List<RoomConfig> selectRoomConfigList(RoomConfig roomConfig);

    /**
     * 新增房间配置
     * 
     * @param roomConfig 房间配置
     * @return 结果
     */
    public int insertRoomConfig(RoomConfig roomConfig);

    /**
     * 修改房间配置
     * 
     * @param roomConfig 房间配置
     * @return 结果
     */
    public int updateRoomConfig(RoomConfig roomConfig);

    /**
     * 批量删除房间配置
     * 
     * @param ids 需要删除的房间配置 ID
     * @return 结果
     */
    public int deleteRoomConfigByIds(String ids);

    /**
     * 删除房间配置
     * 
     * @param id 房间配置 ID
     * @return 结果
     */
    public int deleteRoomConfigById(Long id);

    /**
     * 校验房间号是否唯一
     * 
     * @param roomConfig 房间配置
     * @return 结果
     */
    public boolean checkRoomNoUnique(RoomConfig roomConfig);

    /**
     * 查询房间详情（包含床位信息）
     *
     * @param id 房间 ID
     * @return 房间配置及床位列表
     */
    public RoomConfig getRoomDetail(Long id);

    /**
     * 获取房间统计数据
     *
     * @return 房间统计信息
     */
    public RoomStats getRoomStats();

    /**
     * 锁定/解锁房间
     *
     * @param id 房间 ID
     * @param status 状态（LOCKED/FREE）
     * @return 结果
     */
    public int toggleLock(Long id, String status);

    /**
     * 批量锁定/解锁房间
     *
     * @param ids 房间 ID 数组
     * @param status 状态（LOCKED/FREE）
     * @return 结果
     */
    public int batchLock(String ids, String status);
}
