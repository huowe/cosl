package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.LifeboatSeatMapper;
import com.ruoyi.system.domain.LifeboatSeat;
import com.ruoyi.system.service.ILifeboatSeatService;

/**
 * 救生艇座位 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class LifeboatSeatServiceImpl implements ILifeboatSeatService 
{
    @Autowired
    private LifeboatSeatMapper lifeboatSeatMapper;

    /**
     * 查询救生艇座位信息
     * 
     * @param id 座位 ID
     * @return 救生艇座位信息
     */
    @Override
    public LifeboatSeat selectLifeboatSeatById(Long id)
    {
        return lifeboatSeatMapper.selectLifeboatSeatById(id);
    }

    /**
     * 查询救生艇座位列表
     * 
     * @param lifeboatSeat 救生艇座位信息
     * @return 救生艇座位信息
     */
    @Override
    public List<LifeboatSeat> selectLifeboatSeatList(LifeboatSeat lifeboatSeat)
    {
        return lifeboatSeatMapper.selectLifeboatSeatList(lifeboatSeat);
    }

    /**
     * 新增救生艇座位
     * 
     * @param lifeboatSeat 救生艇座位信息
     * @return 结果
     */
    @Override
    public int insertLifeboatSeat(LifeboatSeat lifeboatSeat)
    {
        lifeboatSeat.setCreateTime(DateUtils.getNowDate());
        lifeboatSeat.setUpdateTime(DateUtils.getNowDate());
        return lifeboatSeatMapper.insertLifeboatSeat(lifeboatSeat);
    }

    /**
     * 修改救生艇座位
     * 
     * @param lifeboatSeat 救生艇座位信息
     * @return 结果
     */
    @Override
    public int updateLifeboatSeat(LifeboatSeat lifeboatSeat)
    {
        lifeboatSeat.setUpdateTime(DateUtils.getNowDate());
        return lifeboatSeatMapper.updateLifeboatSeat(lifeboatSeat);
    }

    /**
     * 批量删除救生艇座位
     * 
     * @param ids 需要删除的座位 ID
     * @return 结果
     */
    @Override
    public int deleteLifeboatSeatByIds(String ids)
    {
        String[] idArr = ids.split(",");
        for (String id : idArr) {
            // 检查是否有救生艇关联
            Long seatId = Long.valueOf(id);
            // TODO: 可以在这里添加检查是否有救生艇关联的逻辑
            lifeboatSeatMapper.deleteLifeboatSeatById(seatId);
        }
        return 1;
    }

    /**
     * 删除救生艇座位
     * 
     * @param id 座位 ID
     * @return 结果
     */
    @Override
    public int deleteLifeboatSeatById(Long id)
    {
        return lifeboatSeatMapper.deleteLifeboatSeatById(id);
    }

    /**
     * 根据救生艇 ID 查询座位列表
     *
     * @param lifeboatId 救生艇 ID
     * @return 救生艇座位集合
     */
    @Override
    public List<LifeboatSeat> selectSeatsByLifeboatId(Long lifeboatId)
    {
        return lifeboatSeatMapper.selectSeatsByLifeboatId(lifeboatId);
    }

    /**
     * 检查座位号是否唯一
     *
     * @param lifeboatSeat 救生艇座位信息
     * @return 结果
     */
    @Override
    public boolean checkSeatNoUnique(LifeboatSeat lifeboatSeat)
    {
        LifeboatSeat info = lifeboatSeatMapper.checkSeatNoUnique(lifeboatSeat.getLifeboatId(), lifeboatSeat.getSeatNo());
        if (StringUtils.isNotNull(info))
        {
            return false;
        }
        return true;
    }

    /**
     * 统计空闲座位数
     *
     * @param lifeboatId 救生艇 ID
     * @return 空闲座位数
     */
    @Override
    public int countFreeSeats(Long lifeboatId)
    {
        return lifeboatSeatMapper.countFreeSeats(lifeboatId);
    }

}
