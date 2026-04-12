package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.RoomConfig;

import java.util.List;

/**
 * 房间配置 Mapper 接口
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public interface RoomConfigMapper
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
     * 删除房间配置
     * 
     * @param id 房间配置 ID
     * @return 结果
     */
    public int deleteRoomConfigById(Long id);

    /**
     * 批量删除房间配置
     * 
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deleteRoomConfigByIds(Long[] ids);

    /**
     * 校验房间号是否唯一
     * 
     * @param roomNo 房间号
     * @return 结果
     */
    public RoomConfig checkRoomNoUnique(String roomNo);

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
    public int batchLock(Long[] ids, String status);

    /**
     * 统计房间总数
     * 
     * @return 房间总数
     */
    public int countRoomTotal();

    /**
     * 统计空闲房间数
     * 
     * @return 空闲房间数
     */
    public int countRoomFree();
}
