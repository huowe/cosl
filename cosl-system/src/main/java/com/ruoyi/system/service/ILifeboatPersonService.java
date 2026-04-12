package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.LifeboatPerson;

/**
 * 救生艇人员 Service 接口
 * 
 * @author ruoyi
 */
public interface ILifeboatPersonService
{
    /**
     * 查询救生艇人员信息
     * 
     * @param id 主键
     * @return 救生艇人员信息
     */
    public LifeboatPerson selectLifeboatPersonById(Long id);

    /**
     * 查询救生艇人员列表
     * 
     * @param lifeboatPerson 救生艇人员信息
     * @return 救生艇人员集合
     */
    public List<LifeboatPerson> selectLifeboatPersonList(LifeboatPerson lifeboatPerson);

    /**
     * 新增救生艇人员
     * 
     * @param lifeboatPerson 救生艇人员信息
     * @return 结果
     */
    public int insertLifeboatPerson(LifeboatPerson lifeboatPerson);

    /**
     * 修改救生艇人员
     * 
     * @param lifeboatPerson 救生艇人员信息
     * @return 结果
     */
    public int updateLifeboatPerson(LifeboatPerson lifeboatPerson);

    /**
     * 批量删除救生艇人员
     * 
     * @param ids 需要删除的主键
     * @return 结果
     */
    public int deleteLifeboatPersonByIds(String ids);

    /**
     * 删除救生艇人员
     * 
     * @param id 主键
     * @return 结果
     */
    public int deleteLifeboatPersonById(Long id);

    /**
     * 根据人员 ID 查询分配信息
     *
     * @param personId 人员 ID
     * @return 救生艇人员信息
     */
    public LifeboatPerson selectByPersonId(Long personId);

    /**
     * 根据救生艇 ID 查询人员列表
     *
     * @param lifeboatId 救生艇 ID
     * @return 救生艇人员集合
     */
    public List<LifeboatPerson> selectPersonsByLifeboatId(Long lifeboatId);

    /**
     * 检查人员是否已分配
     *
     * @param personId 人员 ID
     * @return 结果
     */
    public boolean checkPersonAssigned(Long personId);

    /**
     * 统计救生艇上的人数
     *
     * @param lifeboatId 救生艇 ID
     * @return 人数
     */
    public int countPersonsByLifeboatId(Long lifeboatId);

    /**
     * 分配人员到救生艇
     *
     * @param personId 人员 ID
     * @param lifeboatId 救生艇 ID
     * @param seatId 座位 ID
     * @return 结果
     */
    public int assignPersonToBoat(Long personId, Long lifeboatId, Long seatId);

    /**
     * 从救生艇移除人员
     *
     * @param personId 人员 ID
     * @return 结果
     */
    public int removePersonFromBoat(Long personId);

}
