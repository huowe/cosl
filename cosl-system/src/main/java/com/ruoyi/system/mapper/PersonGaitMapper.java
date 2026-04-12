package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.PersonGait;

/**
 * 人员步态 Mapper 接口
 * 
 * @author ruoyi
 */
public interface PersonGaitMapper
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
     * 删除人员步态
     * 
     * @param id 人员步态 ID
     * @return 结果
     */
    public int deletePersonGaitById(Long id);

    /**
     * 批量删除人员步态
     * 
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deletePersonGaitByIds(String[] ids);
}
