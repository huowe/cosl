package com.ruoyi.system.mapper;


import com.ruoyi.common.core.domain.entity.Person;

import java.util.List;

/**
 * 人员信息 Mapper 接口
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public interface PersonMapper
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
    public List<Person> selectPersonList(Person person);

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
     * 删除人员
     * 
     * @param id 人员 ID
     * @return 结果
     */
    public int deletePersonById(Long id);

    /**
     * 批量删除人员
     * 
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deletePersonByIds(Long[] ids);

    /**
     * 校验 MTS 卡号是否唯一
     * 
     * @param mtsCardNo MTS 卡号
     * @return 结果
     */
    public Person checkMtsCardNoUnique(String mtsCardNo);

    /**
     * 校验身份证号是否唯一
     * 
     * @param idCard 身份证号
     * @return 结果
     */
    public Person checkIdCardUnique(String idCard);

    /**
     * 批量更新人员房间信息
     * 
     * @param persons 人员信息列表
     * @return 结果
     */
    public int batchUpdateRoomInfo(List<Person> persons);

    /**
     * 统计人员总数
     * 
     * @return 人员总数
     */
    public int countPersonTotal();

    /**
     * 统计当前在船人员数
     * 
     * @return 在船人员数
     */
    public int countPersonCurrent();

    /**
     * 统计今日进入人员数
     * 
     * @return 进入人员数
     */
    public int countPersonEnter();

    /**
     * 统计今日离开人员数
     * 
     * @return 离开人员数
     */
    public int countPersonLeave();

    /**
     * 查询即将到期的证书人员列表（30天内）
     * 
     * @return 人员列表
     */
    public List<Person> selectExpiringSoonPersons();

    /**
     * 查询已过期的证书人员列表
     * 
     * @return 人员列表
     */
    public List<Person> selectExpiredPersons();

    /**
     * 统计即将到期的证书人数（30天内）
     * 
     * @return 人数
     */
    public int countExpiringSoonPersons();

    /**
     * 统计已过期的证书人数
     * 
     * @return 人数
     */
    public int countExpiredPersons();
}
