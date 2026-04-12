package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.LifeboatSeat;

/**
 * 救生艇座位 Mapper 接口
 * 
 * @author ruoyi
 */
public interface LifeboatSeatMapper
{
    /**
     * 查询救生艇座位信息
     * 
     * @param id 座位 ID
     * @return 救生艇座位信息
     */
    public LifeboatSeat selectLifeboatSeatById(Long id);

    /**
     * 查询救生艇座位列表
     * 
     * @param lifeboatSeat 救生艇座位信息
     * @return 救生艇座位集合
     */
    public List<LifeboatSeat> selectLifeboatSeatList(LifeboatSeat lifeboatSeat);

    /**
     * 新增救生艇座位
     * 
     * @param lifeboatSeat 救生艇座位信息
     * @return 结果
     */
    public int insertLifeboatSeat(LifeboatSeat lifeboatSeat);

    /**
     * 修改救生艇座位
     * 
     * @param lifeboatSeat 救生艇座位信息
     * @return 结果
     */
    public int updateLifeboatSeat(LifeboatSeat lifeboatSeat);

    /**
     * 删除救生艇座位
     * 
     * @param id 座位 ID
     * @return 结果
     */
    public int deleteLifeboatSeatById(Long id);

    /**
     * 批量删除救生艇座位
     * 
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deleteLifeboatSeatByIds(String[] ids);

    /**
     * 根据救生艇 ID 查询座位列表
     *
     * @param lifeboatId 救生艇 ID
     * @return 救生艇座位集合
     */
    public List<LifeboatSeat> selectSeatsByLifeboatId(Long lifeboatId);

    /**
     * 检查座位号是否唯一
     *
     * @param lifeboatId 救生艇 ID
     * @param seatNo 座位号
     * @return 结果
     */
    public LifeboatSeat checkSeatNoUnique(Long lifeboatId, String seatNo);

    /**
     * 统计空闲座位数
     *
     * @param lifeboatId 救生艇 ID
     * @return 空闲座位数
     */
    public int countFreeSeats(Long lifeboatId);

}
