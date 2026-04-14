package com.ruoyi.system.service.impl;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.Person;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.PersonFace;
import com.ruoyi.system.mapper.PersonFaceMapper;
import com.ruoyi.system.mapper.PersonMapper;
import com.ruoyi.system.service.IPersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 人员信息 Service 业务层处理
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Service
public class PersonServiceImpl implements IPersonService
{
    @Autowired
    private PersonMapper personMapper;
    @Autowired
    private PersonFaceMapper personFaceMapper;

    /**
     * 查询人员信息
     * 
     * @param id 人员 ID
     * @return 人员信息
     */
    @Override
    public Person selectPersonById(Long id)
    {
        return personMapper.selectPersonById(id);
    }

    /**
     * 查询人员列表
     * 
     * @param person 人员信息
     * @return 人员
     */
    @Override
    public List<Person> selectPersonList(Person person)
    {
        return personMapper.selectPersonList(person);
    }

    /**
     * 新增人员
     * 
     * @param person 人员信息
     * @return 结果
     */
    @Override
    public int insertPerson(Person person)
    {
        return personMapper.insertPerson(person);
    }

    /**
     * 修改人员
     * 
     * @param person 人员信息
     * @return 结果
     */
    @Override
    public int updatePerson(Person person)
    {
        return personMapper.updatePerson(person);
    }

    /**
     * 批量删除人员
     * 
     * @param ids 需要删除的人员 ID
     * @return 结果
     */
    @Override
    public int deletePersonByIds(String ids)
    {
        Long[] personIds = Convert.toLongArray(ids);
        for (Long personId : personIds)
        {
            personMapper.deletePersonById(personId);
        }
        return personIds.length;
    }

    /**
     * 删除人员
     * 
     * @param id 人员 ID
     * @return 结果
     */
    @Override
    public int deletePersonById(Long id)
    {
        return personMapper.deletePersonById(id);
    }

    /**
     * 校验 MTS 卡号是否唯一
     * 
     * @param person 人员信息
     * @return 结果
     */
    @Override
    public boolean checkMtsCardNoUnique(Person person)
    {
        String mtsCardNo = person.getMtsCardNo();
        Person info = personMapper.checkMtsCardNoUnique(mtsCardNo);
        if (StringUtils.isNotNull(info))
        {
            if (!person.getId().equals(info.getId())){
                return UserConstants.NOT_UNIQUE;
            }

        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验身份证号是否唯一
     * 
     * @param person 人员信息
     * @return 结果
     */
    @Override
    public boolean checkIdCardUnique(Person person)
    {
        String idCard = person.getIdCard();
        Person info = personMapper.checkIdCardUnique(idCard);
        if (StringUtils.isNotNull(info))
        {
            if (!person.getId().equals(info.getId())){
                return UserConstants.NOT_UNIQUE;
            }
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 批量更新人员房间信息
     * 
     * @param persons 人员信息列表
     * @return 结果
     */
    @Override
    public int batchUpdateRoomInfo(List<Person> persons)
    {
        if (persons == null || persons.isEmpty())
        {
            throw new ServiceException("批量更新数据不能为空");
        }
        return personMapper.batchUpdateRoomInfo(persons);
    }
}
