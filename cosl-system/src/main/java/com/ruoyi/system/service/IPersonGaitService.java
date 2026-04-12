package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.PersonGait;

/**
 * 人员步态 Service 接口
 * 
 * @author ruoyi
 */
public interface IPersonGaitService 
{
    /**
     * 查询人员步态信息
     * 
     * @param id 人员步态 ID
     * @return 人员步态信息
     */
    public PersonGait selectPersonGaitById(Long id);

    /**
     * 查询人员步态列表
     * 
     * @param personGait 人员步态信息
     * @return 人员步态集合
     */
    public List<PersonGait> selectPersonGaitList(PersonGait personGait);

    /**
     * 新增人员步态
     * 
     * @param personGait 人员步态信息
     * @return 结果
     */
    public int insertPersonGait(PersonGait personGait);

    /**
     * 修改人员步态
     * 
     * @param personGait 人员步态信息
     * @return 结果
     */
    public int updatePersonGait(PersonGait personGait);

    /**
     * 批量删除人员步态
     * 
     * @param ids 需要删除的人员步态 ID
     * @return 结果
     */
    public int deletePersonGaitByIds(String ids);

    /**
     * 删除人员步态信息
     * 
     * @param id 人员步态 ID
     * @return 结果
     */
    public int deletePersonGaitById(Long id);
}
