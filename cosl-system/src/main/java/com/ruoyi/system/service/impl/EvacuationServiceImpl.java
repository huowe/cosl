package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.entity.PersonImagePo;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.core.domain.entity.Person;
import com.ruoyi.system.domain.LifeboatConfig;
import com.ruoyi.system.mapper.PersonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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

    @Autowired
    private PersonMapper personMapper;

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
                // 检查状态为 PLANNED（计划中）或 ACTIVE（进行中）的任务
                if ("ACTIVE".equals(evacuation.getStatus()) || "PLANNED".equals(evacuation.getStatus()))
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
     * 更新人员撤离状态
     *
     * @param recordId 记录 ID
     * @param status 状态（EVACUATED:已撤离，MISSING:失踪，INJURED:受伤）
     * @return 结果
     */
    @Override
    public int updateEvacuationRecordStatus(Long recordId, String status)
    {
        EvacuationRecord record = new EvacuationRecord();
        record.setId(recordId);
        record.setStatus(status);
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

    /**
     * 新增紧急撤离并包含全部人员
     *
     * @param evacuation 紧急撤离信息
     * @return 结果
     */
    @Override
    @Transactional
    public int insertEvacuationWithAllPersons(Evacuation evacuation)
    {
        // 0. 检查是否存在进行中的撤离任务
        Evacuation activeEvacuation = getActiveEvacuation();
        if (activeEvacuation != null)
        {
            throw new RuntimeException("当前存在进行中的撤离任务【" + activeEvacuation.getName() + "】，请先结束该任务后再创建新任务");
        }
        
        // 1. 先插入撤离事件
        int result = evacuationMapper.insertEvacuation(evacuation);
        
        if (result > 0 && evacuation.getId() != null)
        {
            List<PersonImagePo> targetPersons = null;
            
            // 2. 判断是否指定了人员列表
            if (evacuation.getPersonList() != null && !evacuation.getPersonList().isEmpty())
            {
                // 2.1 使用指定的人员列表
                // 从 SimplePersonInfo 中提取人员 ID，查询完整的人员信息
                List<Long> personIds = new java.util.ArrayList<>();
                for (com.ruoyi.system.domain.SimplePersonInfo personInfo : evacuation.getPersonList())
                {
                    if (personInfo.getId() != null)
                    {
                        personIds.add(personInfo.getId());
                    }
                }
                
                if (!personIds.isEmpty())
                {
                    targetPersons = personMapper.selectPersonByIds(personIds.toArray(new Long[0]));
                }
            }
            else
            {
                // 2.2 使用平台下的所有人员
                Person queryPerson = new Person();
                queryPerson.setPlatformNo(evacuation.getPlatformNo());
                targetPersons = personMapper.selectPersonList(queryPerson);
            }
            
            // 3. 为每个人员创建撤离记录
            if (targetPersons != null && !targetPersons.isEmpty())
            {
                for (PersonImagePo person : targetPersons)
                {
                    EvacuationRecord record = new EvacuationRecord();
                    record.setEvacuationId(evacuation.getId());
                    record.setPersonId(person.getId());
                    record.setPersonName(person.getName());
                    record.setStatus("PENDING"); // 待撤离状态
                    
                    evacuationMapper.insertEvacuationRecord(record);
                }
                
                // 4. 更新预计撤离人数
                Evacuation updateEvacuation = new Evacuation();
                updateEvacuation.setId(evacuation.getId());
                updateEvacuation.setExpectedCount(targetPersons.size());
                evacuationMapper.updateEvacuation(updateEvacuation);
            }
        }
        
        return result;
    }

    /**
     * 查询未满员的救生艇列表
     *
     * @param evacuationId 撤离事件 ID
     * @return 未满员的救生艇列表
     */
    @Override
    public List<LifeboatConfig> selectAvailableLifeboats(Long evacuationId)
    {
        return evacuationMapper.selectAvailableLifeboats(evacuationId);
    }
}
