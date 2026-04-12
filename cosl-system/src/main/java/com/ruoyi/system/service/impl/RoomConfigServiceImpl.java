package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.entity.Person;
import com.ruoyi.common.core.domain.entity.RoomBed;
import com.ruoyi.common.core.domain.entity.RoomConfig;
import com.ruoyi.common.core.domain.entity.RoomStats;
import com.ruoyi.system.service.IPersonService;
import com.ruoyi.system.service.IRoomBedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.RoomConfigMapper;
import com.ruoyi.system.service.IRoomConfigService;

/**
 * 房间配置 Service 业务层处理
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Service
public class RoomConfigServiceImpl implements IRoomConfigService
{
    @Autowired
    private RoomConfigMapper roomConfigMapper;
    @Autowired
    private IRoomBedService roomBedService;
    @Autowired
    private IPersonService personService;

    /**
     * 查询房间配置
     * 
     * @param id 房间配置 ID
     * @return 房间配置
     */
    @Override
    public RoomConfig selectRoomConfigById(Long id)
    {
        return roomConfigMapper.selectRoomConfigById(id);
    }

    /**
     * 查询房间配置列表
     * 
     * @param roomConfig 房间配置
     * @return 房间配置
     */
    @Override
    public List<RoomConfig> selectRoomConfigList(RoomConfig roomConfig)
    {
        return roomConfigMapper.selectRoomConfigList(roomConfig);
    }

    /**
     * 新增房间配置
     * 
     * @param roomConfig 房间配置
     * @return 结果
     */
    @Override
    public int insertRoomConfig(RoomConfig roomConfig)
    {
        return roomConfigMapper.insertRoomConfig(roomConfig);
    }

    /**
     * 修改房间配置
     * 
     * @param roomConfig 房间配置
     * @return 结果
     */
    @Override
    public int updateRoomConfig(RoomConfig roomConfig)
    {
        return roomConfigMapper.updateRoomConfig(roomConfig);
    }

    /**
     * 批量删除房间配置
     * 
     * @param ids 需要删除的房间配置 ID
     * @return 结果
     */
    @Override
    public int deleteRoomConfigByIds(String ids)
    {
        Long[] roomConfigIds = Convert.toLongArray(ids);
        for (Long roomConfigId : roomConfigIds)
        {
            roomConfigMapper.deleteRoomConfigById(roomConfigId);
        }
        return roomConfigIds.length;
    }

    /**
     * 删除房间配置
     * 
     * @param id 房间配置 ID
     * @return 结果
     */
    @Override
    public int deleteRoomConfigById(Long id)
    {
        return roomConfigMapper.deleteRoomConfigById(id);
    }

    /**
     * 校验房间号是否唯一
     * 
     * @param roomConfig 房间配置
     * @return 结果
     */
    @Override
    public boolean checkRoomNoUnique(RoomConfig roomConfig)
    {
        String roomNo = roomConfig.getRoomNo();
        RoomConfig info = roomConfigMapper.checkRoomNoUnique(roomNo);
        if (StringUtils.isNotNull(info))
        {
            if (!roomConfig.getId().equals(info.getId())){
                return UserConstants.NOT_UNIQUE;
            }
        }
        return UserConstants.UNIQUE;
    }


    /**
     * 查询房间详情（包含床位信息）
     *
     * @param id 房间 ID
     * @return 房间配置及床位列表
     */
    @Override
    public RoomConfig getRoomDetail(Long id)
    {
        RoomConfig roomConfig = roomConfigMapper.selectRoomConfigById(id);
        if (roomConfig != null)
        {
            List<RoomBed> beds = roomBedService.selectRoomBedsByRoomId(id);
            beds = beds.stream().map(bed -> {
                //查询床位关联的人员信息
                Person query = new Person();
                query.setBedId(bed.getId());
                List<Person> person = personService.selectPersonList(query);
                if (person != null && person.size() > 0){
                    bed.setPerson(person.get(0));
                }
                return bed;
            }).collect(Collectors.toList());
            roomConfig.setBedList(beds);
        }
        return roomConfig;
    }

    /**
     * 获取房间统计数据
     *
     * @return 房间统计信息
     */
    @Override
    public RoomStats getRoomStats()
    {
        RoomStats stats = new RoomStats();
        
        // 查询所有房间
        List<RoomConfig> allRooms = roomConfigMapper.selectRoomConfigList(new RoomConfig());
        
        // 初始化统计数据
        int totalRooms = 0;
        int freeRooms = 0;
        int lockedRooms = 0;
        int occupiedRooms = 0;
        int totalBeds = 0;
        int freeBeds = 0;
        int lockedBeds = 0;
        int occupiedBeds = 0;
        
        if (allRooms != null && !allRooms.isEmpty())
        {
            for (RoomConfig room : allRooms)
            {
                totalRooms++;
                
                // 统计房间状态
                String roomStatus = room.getStatus();
                if ("FREE".equals(roomStatus))
                {
                    freeRooms++;
                }
                else if ("LOCKED".equals(roomStatus))
                {
                    lockedRooms++;
                }
                else if ("OCCUPIED".equals(roomStatus))
                {
                    occupiedRooms++;
                }
                
                // 查询该房间的所有床位
                List<RoomBed> beds = roomBedService.selectRoomBedsByRoomId(room.getId());
                if (beds != null && !beds.isEmpty())
                {
                    for (RoomBed bed : beds)
                    {
                        totalBeds++;
                        
                        // 统计床位状态
                        String bedStatus = bed.getStatus();
                        if ("FREE".equals(bedStatus))
                        {
                            freeBeds++;
                        }
                        else if ("LOCKED".equals(bedStatus))
                        {
                            lockedBeds++;
                        }
                        else if ("OCCUPIED".equals(bedStatus))
                        {
                            occupiedBeds++;
                        }
                    }
                }
            }
        }
        
        // 设置统计结果
        stats.setTotalRooms(totalRooms);
        stats.setFreeRooms(freeRooms);
        stats.setLockedRooms(lockedRooms);
        stats.setOccupiedRooms(occupiedRooms);
        stats.setTotalBeds(totalBeds);
        stats.setFreeBeds(freeBeds);
        stats.setLockedBeds(lockedBeds);
        stats.setOccupiedBeds(occupiedBeds);
        
        return stats;
    }

    /**
     * 锁定/解锁房间
     *
     * @param id 房间 ID
     * @param status 状态（LOCKED/FREE）
     * @return 结果
     */
    @Override
    public int toggleLock(Long id, String status)
    {
        RoomConfig roomConfig = roomConfigMapper.selectRoomConfigById(id);
        if (StringUtils.isNull(roomConfig))
        {
            throw new ServiceException("房间不存在");
        }
        
        // 如果房间已占用，不允许锁定或解锁
        if ("OCCUPIED".equals(roomConfig.getStatus()))
        {
            throw new ServiceException("房间已占用，无法更改状态");
        }
        
        return roomConfigMapper.toggleLock(id, status);
    }

    /**
     * 批量锁定/解锁房间
     *
     * @param ids 房间 ID 数组
     * @param status 状态（LOCKED/FREE）
     * @return 结果
     */
    @Override
    public int batchLock(String ids, String status)
    {
        Long[] roomIds = Convert.toLongArray(ids);
        int count = 0;
        
        for (Long roomId : roomIds)
        {
            try
            {
                toggleLock(roomId, status);
                count++;
            }
            catch (ServiceException e)
            {
                // 跳过有问题的房间，继续处理其他房间
                continue;
            }
        }
        
        return count;
    }
}
