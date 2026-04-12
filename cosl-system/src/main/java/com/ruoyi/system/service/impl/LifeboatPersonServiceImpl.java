package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.LifeboatPersonMapper;
import com.ruoyi.system.domain.LifeboatPerson;
import com.ruoyi.system.service.ILifeboatPersonService;
import com.ruoyi.system.mapper.LifeboatSeatMapper;

/**
 * 救生艇人员 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class LifeboatPersonServiceImpl implements ILifeboatPersonService 
{
    @Autowired
    private LifeboatPersonMapper lifeboatPersonMapper;

    @Autowired
    private LifeboatSeatMapper lifeboatSeatMapper;

    /**
     * 查询救生艇人员信息
     * 
     * @param id 主键
     * @return 救生艇人员信息
     */
    @Override
    public LifeboatPerson selectLifeboatPersonById(Long id)
    {
        return lifeboatPersonMapper.selectLifeboatPersonById(id);
    }

    /**
     * 查询救生艇人员列表
     * 
     * @param lifeboatPerson 救生艇人员信息
     * @return 救生艇人员信息
     */
    @Override
    public List<LifeboatPerson> selectLifeboatPersonList(LifeboatPerson lifeboatPerson)
    {
        return lifeboatPersonMapper.selectLifeboatPersonList(lifeboatPerson);
    }

    /**
     * 新增救生艇人员
     * 
     * @param lifeboatPerson 救生艇人员信息
     * @return 结果
     */
    @Override
    public int insertLifeboatPerson(LifeboatPerson lifeboatPerson)
    {
        lifeboatPerson.setCreateTime(DateUtils.getNowDate());
        lifeboatPerson.setUpdateTime(DateUtils.getNowDate());
        return lifeboatPersonMapper.insertLifeboatPerson(lifeboatPerson);
    }

    /**
     * 修改救生艇人员
     * 
     * @param lifeboatPerson 救生艇人员信息
     * @return 结果
     */
    @Override
    public int updateLifeboatPerson(LifeboatPerson lifeboatPerson)
    {
        lifeboatPerson.setUpdateTime(DateUtils.getNowDate());
        return lifeboatPersonMapper.updateLifeboatPerson(lifeboatPerson);
    }

    /**
     * 批量删除救生艇人员
     * 
     * @param ids 需要删除的主键
     * @return 结果
     */
    @Override
    public int deleteLifeboatPersonByIds(String ids)
    {
        Long[] lifeboatIds = Convert.toLongArray(ids);
        for (Long lifeboatId : lifeboatIds)
        {
            lifeboatPersonMapper.deleteLifeboatPersonById(lifeboatId);
        }
        return 1;
    }

    /**
     * 删除救生艇人员
     * 
     * @param id 主键
     * @return 结果
     */
    @Override
    public int deleteLifeboatPersonById(Long id)
    {
        return lifeboatPersonMapper.deleteLifeboatPersonById(id);
    }

    /**
     * 根据人员 ID 查询分配信息
     *
     * @param personId 人员 ID
     * @return 救生艇人员信息
     */
    @Override
    public LifeboatPerson selectByPersonId(Long personId)
    {
        return lifeboatPersonMapper.selectByPersonId(personId);
    }

    /**
     * 根据救生艇 ID 查询人员列表
     *
     * @param lifeboatId 救生艇 ID
     * @return 救生艇人员集合
     */
    @Override
    public List<LifeboatPerson> selectPersonsByLifeboatId(Long lifeboatId)
    {
        return lifeboatPersonMapper.selectPersonsByLifeboatId(lifeboatId);
    }

    /**
     * 检查人员是否已分配
     *
     * @param personId 人员 ID
     * @return 结果
     */
    @Override
    public boolean checkPersonAssigned(Long personId)
    {
        LifeboatPerson person = lifeboatPersonMapper.checkPersonAssigned(personId);
        return StringUtils.isNull(person);
    }

    /**
     * 统计救生艇上的人数
     *
     * @param lifeboatId 救生艇 ID
     * @return 人数
     */
    @Override
    public int countPersonsByLifeboatId(Long lifeboatId)
    {
        return lifeboatPersonMapper.countPersonsByLifeboatId(lifeboatId);
    }

    /**
     * 分配人员到救生艇
     *
     * @param personId 人员 ID
     * @param lifeboatId 救生艇 ID
     * @param seatId 座位 ID
     * @return 结果
     */
    @Override
    public int assignPersonToBoat(Long personId, Long lifeboatId, Long seatId)
    {
        // 检查人员是否已被分配
        if (!checkPersonAssigned(personId))
        {
            throw new ServiceException("该人员已被分配到其他救生艇");
        }

        // 检查座位是否可用
        // TODO: 可以添加座位状态检查逻辑

        LifeboatPerson lifeboatPerson = new LifeboatPerson();
        lifeboatPerson.setPersonId(personId);
        lifeboatPerson.setLifeboatId(lifeboatId);
        lifeboatPerson.setSeatId(seatId);
        lifeboatPerson.setAssignTime(DateUtils.getNowDate());

        return insertLifeboatPerson(lifeboatPerson);
    }

    /**
     * 从救生艇移除人员
     *
     * @param personId 人员 ID
     * @return 结果
     */
    @Override
    public int removePersonFromBoat(Long personId)
    {
        LifeboatPerson lifeboatPerson = lifeboatPersonMapper.selectByPersonId(personId);
        if (StringUtils.isNull(lifeboatPerson))
        {
            throw new ServiceException("该人员未被分配到救生艇");
        }

        return lifeboatPersonMapper.deleteLifeboatPersonById(lifeboatPerson.getId());
    }

}
