package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.RoomBed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.RoomBedMapper;
import com.ruoyi.system.service.IRoomBedService;

/**
 * 房间床位 Service 业务层处理
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Service
public class RoomBedServiceImpl implements IRoomBedService
{
    @Autowired
    private RoomBedMapper roomBedMapper;

    /**
     * 查询房间床位
     * 
     * @param id 房间床位 ID
     * @return 房间床位
     */
    @Override
    public RoomBed selectRoomBedById(Long id)
    {
        return roomBedMapper.selectRoomBedById(id);
    }

    /**
     * 查询房间床位列表
     * 
     * @param roomBed 房间床位
     * @return 房间床位
     */
    @Override
    public List<RoomBed> selectRoomBedList(RoomBed roomBed)
    {
        return roomBedMapper.selectRoomBedList(roomBed);
    }

    /**
     * 新增房间床位
     * 
     * @param roomBed 房间床位
     * @return 结果
     */
    @Override
    public int insertRoomBed(RoomBed roomBed)
    {
        return roomBedMapper.insertRoomBed(roomBed);
    }

    /**
     * 修改房间床位
     * 
     * @param roomBed 房间床位
     * @return 结果
     */
    @Override
    public int updateRoomBed(RoomBed roomBed)
    {
        return roomBedMapper.updateRoomBed(roomBed);
    }

    /**
     * 批量删除房间床位
     * 
     * @param ids 需要删除的房间床位 ID
     * @return 结果
     */
    @Override
    public int deleteRoomBedByIds(String ids)
    {
        Long[] roomBedIds = Convert.toLongArray(ids);
        for (Long roomBedId : roomBedIds)
        {
            roomBedMapper.deleteRoomBedById(roomBedId);
        }
        return roomBedIds.length;
    }

    /**
     * 删除房间床位
     * 
     * @param id 房间床位 ID
     * @return 结果
     */
    @Override
    public int deleteRoomBedById(Long id)
    {
        return roomBedMapper.deleteRoomBedById(id);
    }

    /**
     * 校验房间床位是否唯一
     * 
     * @param roomBed 房间床位
     * @return 结果
     */
    @Override
    public boolean checkRoomBedUnique(RoomBed roomBed)
    {
        RoomBed info = roomBedMapper.checkRoomBedUnique(roomBed);
        if (StringUtils.isNotNull(info))
        {
            if (!info.getId().equals(roomBed.getId())){
                return UserConstants.NOT_UNIQUE;
            }
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 根据房间 ID 查询床位列表
     * 
     * @param roomId 房间 ID
     * @return 床位列表
     */
    @Override
    public List<RoomBed> selectRoomBedsByRoomId(Long roomId)
    {
        return roomBedMapper.selectRoomBedsByRoomId(roomId);
    }

    /**
     * 批量更新床位状态
     *
     * @param bedIds 床位 ID 数组
     * @param status 状态
     * @return 结果
     */
    @Override
    public int updateBedStatusByIds(String bedIds, String status)
    {
        Long[] roomBedIds = Convert.toLongArray(bedIds);
        for (Long roomBedId : roomBedIds)
        {
            RoomBed roomBed = new RoomBed();
            roomBed.setId(roomBedId);
            roomBed.setStatus(status);

            roomBedMapper.updateRoomBed(roomBed);
        }
        return roomBedIds.length;
    }
}
