package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.Evacuation;
import com.ruoyi.system.domain.EvacuationRecord;
import com.ruoyi.system.mapper.EvacuationMapper;
import com.ruoyi.system.service.IEvacuationService;

/**
 * 紧急撤离 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class EvacuationServiceImpl implements IEvacuationService 
{
    @Autowired
    private EvacuationMapper evacuationMapper;

    /**
     * 查询紧急撤离事件
     * 
     * @param id 紧急撤离 ID
     * @return 紧急撤离信息
     */
    @Override
    public Evacuation selectEvacuationById(Long id)
    {
        return evacuationMapper.selectEvacuationById(id);
    }

    /**
     * 查询紧急撤离列表
     * 
     * @param evacuation 紧急撤离信息
     * @return 紧急撤离
     */
    @Override
    public List<Evacuation> selectEvacuationList(Evacuation evacuation)
    {
        return evacuationMapper.selectEvacuationList(evacuation);
    }

    /**
     * 新增紧急撤离
     * 
     * @param evacuation 紧急撤离信息
     * @return 结果
     */
    @Override
    public int insertEvacuation(Evacuation evacuation)
    {
        return evacuationMapper.insertEvacuation(evacuation);
    }

    /**
     * 修改紧急撤离
     * 
     * @param evacuation 紧急撤离信息
     * @return 结果
     */
    @Override
    public int updateEvacuation(Evacuation evacuation)
    {
        return evacuationMapper.updateEvacuation(evacuation);
    }

    /**
     * 批量删除紧急撤离
     * 
     * @param ids 需要删除的紧急撤离 ID
     * @return 结果
     */
    @Override
    public int deleteEvacuationByIds(String ids)
    {
        return evacuationMapper.deleteEvacuationByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除紧急撤离信息
     * 
     * @param id 紧急撤离 ID
     * @return 结果
     */
    @Override
    public int deleteEvacuationById(Long id)
    {
        return evacuationMapper.deleteEvacuationById(id);
    }

    /**
     * 开始撤离
     *
     * @param id 撤离事件 ID
     * @return 结果
     */
    @Override
    public int startEvacuation(Long id)
    {
        Evacuation evacuation = new Evacuation();
        evacuation.setId(id);
        evacuation.setStatus("ACTIVE"); // 进行中状态
        evacuation.setStartTime(new Date());
        return evacuationMapper.updateEvacuation(evacuation);
    }

    /**
     * 获取进行中的撤离事件
     *
     * @return 撤离事件信息
     */
    @Override
    public Evacuation getActiveEvacuation()
    {
        List<Evacuation> evacuations = evacuationMapper.selectEvacuationList(new Evacuation());
        if (evacuations != null && !evacuations.isEmpty())
        {
            for (Evacuation evacuation : evacuations)
            {
                if ("ACTIVE".equals(evacuation.getStatus()))
                {
                    return evacuation;
                }
            }
        }
        return null;
    }

    /**
     * 结束撤离
     *
     * @param id 撤离事件 ID
     * @return 结果
     */
    @Override
    public int endEvacuation(Long id)
    {
        Evacuation evacuation = new Evacuation();
        evacuation.setId(id);
        evacuation.setStatus("COMPLETED"); // 已完成状态
        evacuation.setEndTime(new Date());
        return evacuationMapper.updateEvacuation(evacuation);
    }

    /**
     * 登记人员撤离信息
     *
     * @param evacuationId 撤离事件 ID
     * @param personId 人员 ID
     * @param lifeboatId 救生艇 ID
     * @param seatNo 座位号
     * @param status 状态
     * @return 结果
     */
    @Override
    public int registerEvacuationPerson(Long evacuationId, Long personId, Long lifeboatId, Integer seatNo, String status)
    {
        EvacuationRecord record = new EvacuationRecord();
        record.setEvacuationId(evacuationId);
        record.setPersonId(personId);
        record.setLifeboatId(lifeboatId);
        record.setSeatNo(seatNo);
        record.setStatus(status);

        // 检查是否已存在记录
        EvacuationRecord existRecord = evacuationMapper.checkEvacuationRecordExist(record);
        if (existRecord != null)
        {
            record.setId(existRecord.getId());
            return evacuationMapper.updateEvacuationRecord(record);
        }
        else
        {
            return evacuationMapper.insertEvacuationRecord(record);
        }
    }

    /**
     * 更新人员到达时间
     *
     * @param recordId 记录 ID
     * @return 结果
     */
    @Override
    public int updateArriveTime(Long recordId)
    {
        EvacuationRecord record = new EvacuationRecord();
        record.setId(recordId);
        record.setArriveTime(new Date());
        return evacuationMapper.updateEvacuationRecord(record);
    }

    /**
     * 更新人员登艇时间
     *
     * @param recordId 记录 ID
     * @return 结果
     */
    @Override
    public int updateBoardTime(Long recordId)
    {
        EvacuationRecord record = new EvacuationRecord();
        record.setId(recordId);
        record.setBoardTime(new Date());
        return evacuationMapper.updateEvacuationRecord(record);
    }

    /**
     * 根据撤离事件 ID 查询人员记录列表
     *
     * @param evacuationId 撤离事件 ID
     * @return 撤离人员记录集合
     */
    @Override
    public List<EvacuationRecord> selectEvacuationRecordsByEvacuationId(Long evacuationId)
    {
        return evacuationMapper.selectEvacuationRecordsByEvacuationId(evacuationId);
    }

    /**
     * 删除撤离人员记录
     *
     * @param id 撤离人员记录 ID
     * @return 结果
     */
    @Override
    public int deleteEvacuationRecordById(Long id)
    {
        return evacuationMapper.deleteEvacuationRecordById(id);
    }

    /**
     * 批量删除撤离人员记录
     *
     * @param ids 需要删除的记录 ID
     * @return 结果
     */
    @Override
    public int deleteEvacuationRecordByIds(String ids)
    {
        return evacuationMapper.deleteEvacuationRecordByIds(Convert.toLongArray(ids));
    }
}
