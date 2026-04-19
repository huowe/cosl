package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Evacuation;
import com.ruoyi.system.domain.EvacuationRecord;
import com.ruoyi.system.domain.LifeboatConfig;

/**
 * 紧急撤离 Service 接口
 * 
 * @author ruoyi
 */
public interface IEvacuationService 
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
     * 批量删除紧急撤离
     * 
     * @param ids 需要删除的紧急撤离 ID
     * @return 结果
     */
    public int deleteEvacuationByIds(String ids);

    /**
     * 删除紧急撤离信息
     * 
     * @param id 紧急撤离 ID
     * @return 结果
     */
    public int deleteEvacuationById(Long id);

    /**
     * 开始撤离
     *
     * @param id 撤离事件 ID
     * @return 结果
     */
    public int startEvacuation(Long id);

    /**
     * 获取进行中的撤离事件
     *
     * @return 撤离事件信息
     */
    public Evacuation getActiveEvacuation();

    /**
     * 结束撤离
     *
     * @param id 撤离事件 ID
     * @return 结果
     */
    public int endEvacuation(Long id);

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
    public int registerEvacuationPerson(Long evacuationId, Long personId, Long lifeboatId, Integer seatNo, String status);

    /**
     * 更新人员到达时间
     *
     * @param recordId 记录 ID
     * @return 结果
     */
    public int updateArriveTime(Long recordId);

    /**
     * 更新人员登艇时间
     *
     * @param recordId 记录 ID
     * @return 结果
     */
    public int updateBoardTime(Long recordId);

    /**
     * 更新人员撤离状态
     *
     * @param recordId 记录 ID
     * @param status 状态（EVACUATED:已撤离，MISSING:失踪，INJURED:受伤）
     * @return 结果
     */
    public int updateEvacuationRecordStatus(Long recordId, String status);

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
     * @param ids 需要删除的记录 ID
     * @return 结果
     */
    public int deleteEvacuationRecordByIds(String ids);

    /**
     * 新增紧急撤离并包含全部人员
     *
     * @param evacuation 紧急撤离信息
     * @return 结果
     */
    public int insertEvacuationWithAllPersons(Evacuation evacuation);

    /**
     * 查询未满员的救生艇列表
     *
     * @param evacuationId 撤离事件 ID
     * @return 未满员的救生艇列表
     */
    public List<LifeboatConfig> selectAvailableLifeboats(Long evacuationId);
}
