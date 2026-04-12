package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Evacuation;
import com.ruoyi.system.domain.EvacuationRecord;

/**
 * 紧急撤离 Mapper 接口
 * 
 * @author ruoyi
 */
public interface EvacuationMapper 
{
    /**
     * 查询紧急撤离事件
     * 
     * @param id 紧急撤离 ID
     * @return 紧急撤离信息
     */
    public Evacuation selectEvacuationById(Long id);

    /**
     * 查询紧急撤离列表
     * 
     * @param evacuation 紧急撤离信息
     * @return 紧急撤离集合
     */
    public List<Evacuation> selectEvacuationList(Evacuation evacuation);

    /**
     * 新增紧急撤离
     * 
     * @param evacuation 紧急撤离信息
     * @return 结果
     */
    public int insertEvacuation(Evacuation evacuation);

    /**
     * 修改紧急撤离
     * 
     * @param evacuation 紧急撤离信息
     * @return 结果
     */
    public int updateEvacuation(Evacuation evacuation);

    /**
     * 删除紧急撤离
     * 
     * @param id 紧急撤离 ID
     * @return 结果
     */
    public int deleteEvacuationById(Long id);

    /**
     * 批量删除紧急撤离
     * 
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deleteEvacuationByIds(String[] ids);

    /**
     * 检查撤离记录是否存在
     *
     * @param evacuationId 撤离事件 ID
     * @param personId 人员 ID
     * @return 撤离记录信息
     */
    public EvacuationRecord checkEvacuationRecordExist(EvacuationRecord evacuationRecord);

    /**
     * 新增撤离人员记录
     *
     * @param evacuationRecord 撤离人员记录
     * @return 结果
     */
    public int insertEvacuationRecord(EvacuationRecord evacuationRecord);

    /**
     * 修改撤离人员记录
     *
     * @param evacuationRecord 撤离人员记录
     * @return 结果
     */
    public int updateEvacuationRecord(EvacuationRecord evacuationRecord);

    /**
     * 根据撤离事件 ID 查询人员记录列表
     *
     * @param evacuationId 撤离事件 ID
     * @return 撤离人员记录集合
     */
    public List<EvacuationRecord> selectEvacuationRecordsByEvacuationId(Long evacuationId);

    /**
     * 删除撤离人员记录
     *
     * @param id 撤离人员记录 ID
     * @return 结果
     */
    public int deleteEvacuationRecordById(Long id);

    /**
     * 批量删除撤离人员记录
     *
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deleteEvacuationRecordByIds(Long[] ids);
}
