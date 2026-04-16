package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.PersonFeatureDetail;
import com.ruoyi.common.utils.PlatformContext;
import com.ruoyi.system.mapper.PersonFeatureDetailMapper;
import com.ruoyi.system.service.IPersonFeatureDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 人员特征详情Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Service
public class PersonFeatureDetailServiceImpl implements IPersonFeatureDetailService 
{
    @Autowired
    private PersonFeatureDetailMapper personFeatureDetailMapper;

    /**
     * 查询人员特征详情
     * 
     * @param id 人员特征详情ID
     * @return 人员特征详情
     */
    @Override
    public PersonFeatureDetail selectPersonFeatureDetailById(Long id)
    {
        return personFeatureDetailMapper.selectPersonFeatureDetailById(id);
    }

    /**
     * 查询人员特征详情列表
     * 
     * @param personFeatureDetail 人员特征详情
     * @return 人员特征详情
     */
    @Override
    public List<PersonFeatureDetail> selectPersonFeatureDetailList(PersonFeatureDetail personFeatureDetail)
    {
        return personFeatureDetailMapper.selectPersonFeatureDetailList(personFeatureDetail);
    }

    /**
     * 新增人员特征详情
     * 
     * @param personFeatureDetail 人员特征详情
     * @return 结果
     */
    @Override
    public int insertPersonFeatureDetail(PersonFeatureDetail personFeatureDetail)
    {
        // 自动设置平台编号
        if (personFeatureDetail.getPlatformNo() == null || personFeatureDetail.getPlatformNo().isEmpty()) {
            personFeatureDetail.setPlatformNo(PlatformContext.getPlatformNo());
        }
        // 自动设置记录创建时间
        if (personFeatureDetail.getRecordCreateTime() == null) {
            personFeatureDetail.setRecordCreateTime(new Date());
        }
        // 默认删除标志为0
        if (personFeatureDetail.getDeleted() == null) {
            personFeatureDetail.setDeleted(0);
        }
        return personFeatureDetailMapper.insertPersonFeatureDetail(personFeatureDetail);
    }

    /**
     * 批量新增人员特征详情
     * 
     * @param list 人员特征详情列表
     * @return 结果
     */
    @Override
    public int batchInsertPersonFeatureDetail(List<PersonFeatureDetail> list)
    {
        String platformNo = PlatformContext.getPlatformNo();
        Date now = new Date();
        
        for (PersonFeatureDetail detail : list) {
            if (detail.getPlatformNo() == null || detail.getPlatformNo().isEmpty()) {
                detail.setPlatformNo(platformNo);
            }
            if (detail.getRecordCreateTime() == null) {
                detail.setRecordCreateTime(now);
            }
            if (detail.getDeleted() == null) {
                detail.setDeleted(0);
            }
        }
        
        return personFeatureDetailMapper.batchInsertPersonFeatureDetail(list);
    }

    /**
     * 修改人员特征详情
     * 
     * @param personFeatureDetail 人员特征详情
     * @return 结果
     */
    @Override
    public int updatePersonFeatureDetail(PersonFeatureDetail personFeatureDetail)
    {
        return personFeatureDetailMapper.updatePersonFeatureDetail(personFeatureDetail);
    }

    /**
     * 批量删除人员特征详情
     * 
     * @param ids 需要删除的人员特征详情ID
     * @return 结果
     */
    @Override
    public int deletePersonFeatureDetailByIds(Long[] ids)
    {
        return personFeatureDetailMapper.deletePersonFeatureDetailByIds(ids);
    }

    /**
     * 删除人员特征详情信息
     * 
     * @param id 人员特征详情ID
     * @return 结果
     */
    @Override
    public int deletePersonFeatureDetailById(Long id)
    {
        return personFeatureDetailMapper.deletePersonFeatureDetailById(id);
    }

    /**
     * 根据monitorId删除特征详情
     * 
     * @param monitorId 底库人员id
     * @return 结果
     */
    @Override
    public int deleteByMonitorId(String monitorId)
    {
        return personFeatureDetailMapper.deleteByMonitorId(monitorId);
    }

    /**
     * 根据monitorId和featureId查询
     * 
     * @param monitorId 底库人员id
     * @param featureId 特征id
     * @return 人员特征详情
     */
    @Override
    public PersonFeatureDetail selectByMonitorIdAndFeatureId(String monitorId, String featureId)
    {
        return personFeatureDetailMapper.selectByMonitorIdAndFeatureId(monitorId, featureId);
    }
}
