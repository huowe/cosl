package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.PersonFeatureDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 人员特征详情Mapper接口
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
public interface PersonFeatureDetailMapper 
{
    /**
     * 查询人员特征详情
     * 
     * @param id 人员特征详情ID
     * @return 人员特征详情
     */
    public PersonFeatureDetail selectPersonFeatureDetailById(Long id);

    /**
     * 根据monitorId和featureId查询
     * 
     * @param monitorId 底库人员id
     * @param featureId 特征id
     * @return 人员特征详情
     */
    public PersonFeatureDetail selectByMonitorIdAndFeatureId(@Param("monitorId") String monitorId,
                                                             @Param("featureId") String featureId);

    /**
     * 查询人员特征详情列表
     * 
     * @param personFeatureDetail 人员特征详情
     * @return 人员特征详情集合
     */
    public List<PersonFeatureDetail> selectPersonFeatureDetailList(PersonFeatureDetail personFeatureDetail);

    /**
     * 新增人员特征详情
     * 
     * @param personFeatureDetail 人员特征详情
     * @return 结果
     */
    public int insertPersonFeatureDetail(PersonFeatureDetail personFeatureDetail);

    /**
     * 批量新增人员特征详情
     * 
     * @param list 人员特征详情列表
     * @return 结果
     */
    public int batchInsertPersonFeatureDetail(List<PersonFeatureDetail> list);

    /**
     * 修改人员特征详情
     * 
     * @param personFeatureDetail 人员特征详情
     * @return 结果
     */
    public int updatePersonFeatureDetail(PersonFeatureDetail personFeatureDetail);

    /**
     * 删除人员特征详情
     * 
     * @param id 人员特征详情ID
     * @return 结果
     */
    public int deletePersonFeatureDetailById(Long id);

    /**
     * 批量删除人员特征详情
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePersonFeatureDetailByIds(Long[] ids);

    /**
     * 根据monitorId删除特征详情
     * 
     * @param monitorId 底库人员id
     * @return 结果
     */
    public int deleteByMonitorId(@org.apache.ibatis.annotations.Param("monitorId") String monitorId);
}
