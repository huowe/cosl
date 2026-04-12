package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.PersonGait;
import com.ruoyi.system.mapper.PersonGaitMapper;
import com.ruoyi.system.service.IPersonGaitService;

/**
 * 人员步态 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class PersonGaitServiceImpl implements IPersonGaitService
{
    @Autowired
    private PersonGaitMapper personGaitMapper;

    /**
     * 查询人员步态信息
     * 
     * @param id 人员步态 ID
     * @return 人员步态信息
     */
    @Override
    public PersonGait selectPersonGaitById(Long id)
    {
        return personGaitMapper.selectPersonGaitById(id);
    }

    /**
     * 查询人员步态列表
     * 
     * @param personGait 人员步态信息
     * @return 人员步态集合
     */
    @Override
    public List<PersonGait> selectPersonGaitList(PersonGait personGait)
    {
        return personGaitMapper.selectPersonGaitList(personGait);
    }

    /**
     * 新增人员步态
     * 
     * @param personGait 人员步态信息
     * @return 结果
     */
    @Override
    public int insertPersonGait(PersonGait personGait)
    {
        return personGaitMapper.insertPersonGait(personGait);
    }

    /**
     * 修改人员步态
     * 
     * @param personGait 人员步态信息
     * @return 结果
     */
    @Override
    public int updatePersonGait(PersonGait personGait)
    {
        return personGaitMapper.updatePersonGait(personGait);
    }

    /**
     * 批量删除人员步态
     * 
     * @param ids 需要删除的人员步态 ID
     * @return 结果
     */
    @Override
    public int deletePersonGaitByIds(String ids)
    {
        return personGaitMapper.deletePersonGaitByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除人员步态信息
     * 
     * @param id 人员步态 ID
     * @return 结果
     */
    @Override
    public int deletePersonGaitById(Long id)
    {
        return personGaitMapper.deletePersonGaitById(id);
    }
}
