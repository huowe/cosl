package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Drill;
import com.ruoyi.system.domain.DrillPerson;

/**
 * 演练 Mapper 接口
 * 
 * @author ruoyi
 */
public interface DrillMapper
{
    /**
     * 查询演练信息
     * 
     * @param id 演练 ID
     * @return 演练信息
     */
    public Drill selectDrillById(Long id);

    /**
     * 查询演练列表
     * 
     * @param drill 演练信息
     * @return 演练集合
     */
    public List<Drill> selectDrillList(Drill drill);

    /**
     * 新增演练
     * 
     * @param drill 演练信息
     * @return 结果
     */
    public int insertDrill(Drill drill);

    /**
     * 修改演练
     * 
     * @param drill 演练信息
     * @return 结果
     */
    public int updateDrill(Drill drill);

    /**
     * 删除演练
     * 
     * @param id 演练 ID
     * @return 结果
     */
    public int deleteDrillById(Long id);

    /**
     * 批量删除演练
     * 
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deleteDrillByIds(String[] ids);

    /**
     * 检查演练人员关联是否存在
     *
     * @param drillId 演练 ID
     * @param personId 人员 ID
     * @return 演练人员关联信息
     */
    public DrillPerson checkDrillPersonExist(DrillPerson drillPerson);

    /**
     * 新增演练人员关联
     *
     * @param drillPerson 演练人员关联
     * @return 结果
     */
    public int insertDrillPerson(DrillPerson drillPerson);

    /**
     * 修改演练人员关联
     *
     * @param drillPerson 演练人员关联
     * @return 结果
     */
    public int updateDrillPerson(DrillPerson drillPerson);

    /**
     * 统计本月演习次数
     * 
     * @return 本月演习次数
     */
    public int countDrillThisMonth();

    /**
     * 统计演习累计次数
     * 
     * @return 演习累计次数
     */
    public int countDrillTotal();

}
