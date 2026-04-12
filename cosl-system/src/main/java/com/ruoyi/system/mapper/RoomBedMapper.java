package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.RoomBed;

import java.util.List;

/**
 * 房间床位 Mapper 接口
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public interface RoomBedMapper
{
    /**
     * 查询房间床位
     * 
     * @param id 房间床位 ID
     * @return 房间床位
     */
    public RoomBed selectRoomBedById(Long id);

    /**
     * 查询房间床位列表
     * 
     * @param roomBed 房间床位
     * @return 房间床位集合
     */
    public List<RoomBed> selectRoomBedList(RoomBed roomBed);

    /**
     * 新增房间床位
     * 
     * @param roomBed 房间床位
     * @return 结果
     */
    public int insertRoomBed(RoomBed roomBed);

    /**
     * 修改房间床位
     * 
     * @param roomBed 房间床位
     * @return 结果
     */
    public int updateRoomBed(RoomBed roomBed);

    /**
     * 删除房间床位
     * 
     * @param id 房间床位 ID
     * @return 结果
     */
    public int deleteRoomBedById(Long id);

    /**
     * 批量删除房间床位
     * 
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deleteRoomBedByIds(Long[] ids);

    /**
     * 校验房间床位是否唯一
     * 
     * @param roomId 房间 ID
     * @param bedNo 床位号
     * @return 结果
     */
    public RoomBed checkRoomBedUnique(RoomBed roomBed);

    /**
     * 根据房间 ID 查询床位列表
     * 
     * @param roomId 房间 ID
     * @return 床位列表
     */
    public List<RoomBed> selectRoomBedsByRoomId(Long roomId);
}
