package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.LifeboatConfigMapper;
import com.ruoyi.system.domain.LifeboatConfig;
import com.ruoyi.system.service.ILifeboatConfigService;

/**
 * 救生艇配置 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class LifeboatConfigServiceImpl implements ILifeboatConfigService 
{
    @Autowired
    private LifeboatConfigMapper lifeboatConfigMapper;

    /**
     * 查询救生艇配置信息
     * 
     * @param id 救生艇 ID
     * @return 救生艇配置信息
     */
    @Override
    public LifeboatConfig selectLifeboatConfigById(Long id)
    {
        return lifeboatConfigMapper.selectLifeboatConfigById(id);
    }

    /**
     * 查询救生艇配置列表
     * 
     * @param lifeboatConfig 救生艇配置信息
     * @return 救生艇配置信息
     */
    @Override
    public List<LifeboatConfig> selectLifeboatConfigList(LifeboatConfig lifeboatConfig)
    {
        return lifeboatConfigMapper.selectLifeboatConfigList(lifeboatConfig);
    }

    /**
     * 新增救生艇配置
     * 
     * @param lifeboatConfig 救生艇配置信息
     * @return 结果
     */
    @Override
    public int insertLifeboatConfig(LifeboatConfig lifeboatConfig)
    {
        lifeboatConfig.setCreateTime(DateUtils.getNowDate());
        lifeboatConfig.setUpdateTime(DateUtils.getNowDate());
        lifeboatConfig.setDeleted(0);
        return lifeboatConfigMapper.insertLifeboatConfig(lifeboatConfig);
    }

    /**
     * 修改救生艇配置
     * 
     * @param lifeboatConfig 救生艇配置信息
     * @return 结果
     */
    @Override
    public int updateLifeboatConfig(LifeboatConfig lifeboatConfig)
    {
        lifeboatConfig.setUpdateTime(DateUtils.getNowDate());
        return lifeboatConfigMapper.updateLifeboatConfig(lifeboatConfig);
    }

    /**
     * 批量删除救生艇配置
     * 
     * @param ids 需要删除的救生艇 ID
     * @return 结果
     */
    @Override
    public int deleteLifeboatConfigByIds(String ids)
    {
        String[] idArr = ids.split(",");
        for (String id : idArr) {
            // 检查是否有人员关联
            Long boatId = Long.valueOf(id);
            // TODO: 可以在这里添加检查是否有人员关联的逻辑
            lifeboatConfigMapper.deleteLifeboatConfigById(boatId);

        }
        return 1;
    }

    /**
     * 删除救生艇配置
     * 
     * @param id 救生艇 ID
     * @return 结果
     */
    @Override
    public int deleteLifeboatConfigById(Long id)
    {
        return lifeboatConfigMapper.deleteLifeboatConfigById(id);
    }

    /**
     * 检查救生艇编号是否唯一
     *
     * @param lifeboatConfig 救生艇配置信息
     * @return 结果
     */
    @Override
    public boolean checkBoatNoUnique(LifeboatConfig lifeboatConfig)
    {
        Long id = StringUtils.isNull(lifeboatConfig.getId()) ? -1L : lifeboatConfig.getId();
        LifeboatConfig info = lifeboatConfigMapper.checkBoatNoUnique(lifeboatConfig.getBoatNo());
        if (StringUtils.isNotNull(info) && info.getId().longValue() != id.longValue())
        {
            return false;
        }
        return true;
    }

    /**
     * 根据撤离点 ID 查询救生艇列表
     *
     * @param evacuationPointId 撤离点 ID
     * @return 救生艇配置集合
     */
    @Override
    public List<LifeboatConfig> selectLifeboatConfigsByPointId(Long evacuationPointId)
    {
        return lifeboatConfigMapper.selectLifeboatConfigsByPointId(evacuationPointId);
    }

}
