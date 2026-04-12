package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.RoomBed;
import com.ruoyi.common.core.text.Convert;

import java.util.List;

/**
 * 房间床位 Service 接口
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public interface IRoomBedService
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
     * 批量删除房间床位
     * 
     * @param ids 需要删除的房间床位 ID
     * @return 结果
     */
    public int deleteRoomBedByIds(String ids);

    /**
     * 删除房间床位
     * 
     * @param id 房间床位 ID
     * @return 结果
     */
    public int deleteRoomBedById(Long id);

    /**
     * 校验房间床位是否唯一
     * 
     * @param roomBed 房间床位
     * @return 结果
     */
    public boolean checkRoomBedUnique(RoomBed roomBed);

    /**
     * 根据房间 ID 查询床位列表
     * 
     * @param roomId 房间 ID
     * @return 床位列表
     */
    public List<RoomBed> selectRoomBedsByRoomId(Long roomId);
    /**
     * 批量更新床位状态
     *
     * @param bedIds 床位 ID 数组
     * @param status 状态
     * @return 结果
     */
    public int updateBedStatusByIds(String bedIds, String status);

}
