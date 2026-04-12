package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.system.domain.DrillPerson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.Drill;
import com.ruoyi.system.mapper.DrillMapper;
import com.ruoyi.system.service.IDrillService;

/**
 * 演练 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class DrillServiceImpl implements IDrillService
{
    @Autowired
    private DrillMapper drillMapper;

    /**
     * 查询演练信息
     * 
     * @param id 演练 ID
     * @return 演练信息
     */
    @Override
    public Drill selectDrillById(Long id)
    {
        return drillMapper.selectDrillById(id);
    }

    /**
     * 查询演练列表
     * 
     * @param drill 演练信息
     * @return 演练集合
     */
    @Override
    public List<Drill> selectDrillList(Drill drill)
    {
        return drillMapper.selectDrillList(drill);
    }

    /**
     * 新增演练
     * 
     * @param drill 演练信息
     * @return 结果
     */
    @Override
    public int insertDrill(Drill drill)
    {
        return drillMapper.insertDrill(drill);
    }

    /**
     * 修改演练
     * 
     * @param drill 演练信息
     * @return 结果
     */
    @Override
    public int updateDrill(Drill drill)
    {
        return drillMapper.updateDrill(drill);
    }

    /**
     * 批量删除演练
     * 
     * @param ids 需要删除的演练 ID
     * @return 结果
     */
    @Override
    public int deleteDrillByIds(String ids)
    {
        return drillMapper.deleteDrillByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除演练
     * 
     * @param id 演练 ID
     * @return 结果
     */
    @Override
    public int deleteDrillById(Long id)
    {
        return drillMapper.deleteDrillById(id);
    }

    /**
     * 开始演练
     *
     * @param id 演练 ID
     * @return 结果
     */
    @Override
    public int startDrill(Long id)
    {
        Drill drill = new Drill();
        drill.setId(id);
        drill.setStatus("ACTIVE"); // 进行中状态
        drill.setStartTime(new Date());
        return drillMapper.updateDrill(drill);
    }

    /**
     * 获取进行中的演练
     *
     * @return 演练信息
     */
    @Override
    public Drill getActiveDrill()
    {
        List<Drill> drills = drillMapper.selectDrillList(new Drill());
        if (drills != null && !drills.isEmpty())
        {
            for (Drill drill : drills)
            {
                if ("ACTIVE".equals(drill.getStatus()))
                {
                    return drill;
                }
            }
        }
        return null;
    }

    /**
     * 结束演练
     *
     * @param id 演练 ID
     * @return 结果
     */
    @Override
    public int endDrill(Long id)
    {
        Drill drill = new Drill();
        drill.setId(id);
        drill.setStatus("COMPLETED"); // 已完成状态
        drill.setEndTime(new Date());
        return drillMapper.updateDrill(drill);
    }

    /**
     * 切换人员签到状态（点名）
     *
     * @param drillId 演练 ID
     * @param personId 人员 ID
     * @param status 状态
     * @return 结果
     */
    @Override
    public int togglePersonnelStatus(Long drillId, Long personId, String status)
    {
        // 这里可能需要一个关联表来记录演练中的人员签到状态
        // 假设存在 drill_person 关联表
        DrillPerson drillPerson = new DrillPerson();
        drillPerson.setDrillId(drillId);
        drillPerson.setPersonId(personId);
        drillPerson.setStatus(status);
        drillPerson.setUpdateTime(new Date());
        drillPerson.setCreateTime(new Date());

        // 需要先检查是否已存在记录，存在则更新，不存在则插入
        DrillPerson existInfo = drillMapper.checkDrillPersonExist(drillPerson);
        if (existInfo != null)
        {
            drillPerson.setId(existInfo.getId());
            return drillMapper.updateDrillPerson(drillPerson);
        }
        else
        {
            return drillMapper.insertDrillPerson(drillPerson);
        }
    }

}
