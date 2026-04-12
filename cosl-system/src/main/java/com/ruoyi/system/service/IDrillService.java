package com.ruoyi.system.service;

import java.util.Date;
import java.util.List;
import com.ruoyi.system.domain.Drill;

/**
 * 演练 Service 接口
 * 
 * @author ruoyi
 */
public interface IDrillService
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
     * 批量删除演练
     * 
     * @param ids 需要删除的演练 ID
     * @return 结果
     */
    public int deleteDrillByIds(String ids);

    /**
     * 删除演练
     * 
     * @param id 演练 ID
     * @return 结果
     */
    public int deleteDrillById(Long id);

    /**
     * 开始演练
     *
     * @param id 演练 ID
     * @return 结果
     */
    public int startDrill(Long id);

    /**
     * 获取进行中的演练
     *
     * @return 演练信息
     */
    public Drill getActiveDrill();

    /**
     * 结束演练
     *
     * @param id 演练 ID
     * @return 结果
     */
    public int endDrill(Long id);

    /**
     * 切换人员签到状态（点名）
     *
     * @param drillId 演练 ID
     * @param personId 人员 ID
     * @param status 状态
     * @return 结果
     */
    public int togglePersonnelStatus(Long drillId, Long personId, String status);



}
