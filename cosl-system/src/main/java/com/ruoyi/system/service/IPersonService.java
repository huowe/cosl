package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.Person;
import com.ruoyi.common.core.domain.entity.PersonImagePo;

import java.util.List;

/**
 * 人员信息 Service 接口
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public interface IPersonService
{
    /**
     * 查询人员信息
     * 
     * @param id 人员 ID
     * @return 人员信息
     */
    public Person selectPersonById(Long id);

    /**
     * 查询人员列表
     * 
     * @param person 人员信息
     * @return 人员集合
     */
    public List<PersonImagePo> selectPersonList(Person person);

    /**
     * 新增人员
     * 
     * @param person 人员信息
     * @return 结果
     */
    public int insertPerson(Person person);

    /**
     * 修改人员
     * 
     * @param person 人员信息
     * @return 结果
     */
    public int updatePerson(Person person);

    /**
     * 批量删除人员
     * 
     * @param ids 需要删除的人员 ID
     * @return 结果
     */
    public int deletePersonByIds(String ids);

    /**
     * 删除人员
     * 
     * @param id 人员 ID
     * @return 结果
     */
    public int deletePersonById(Long id);

    /**
     * 校验 MTS 卡号是否唯一
     * 
     * @param person 人员信息
     * @return 结果
     */
    public boolean checkMtsCardNoUnique(Person person);

    /**
     * 校验身份证号是否唯一
     * 
     * @param person 人员信息
     * @return 结果
     */
    public boolean checkIdCardUnique(Person person);

    /**
     * 批量更新人员房间信息
     * 
     * @param persons 人员信息列表
     * @return 结果
     */
    public int batchUpdateRoomInfo(List<Person> persons);

}
