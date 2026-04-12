package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.domain.entity.PlatformConfig;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.PlatformConfigMapper;
import com.ruoyi.system.service.IPlatformConfigService;

/**
 * 钻井平台配置Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-04-12
 */
@Service
public class PlatformConfigServiceImpl implements IPlatformConfigService
{
    @Autowired
    private PlatformConfigMapper platformConfigMapper;

    /**
     * 查询钻井平台配置
     * 
     * @param id 钻井平台配置主键
     * @return 钻井平台配置
     */
    @Override
    public PlatformConfig selectPlatformConfigById(Long id)
    {
        return platformConfigMapper.selectPlatformConfigById(id);
    }

    /**
     * 根据平台编号查询钻井平台配置
     * 
     * @param platformNo 平台编号
     * @return 钻井平台配置
     */
    @Override
    public PlatformConfig selectPlatformConfigByNo(String platformNo)
    {
        return platformConfigMapper.selectPlatformConfigByNo(platformNo);
    }

    /**
     * 查询钻井平台配置列表
     * 
     * @param platformConfig 钻井平台配置
     * @return 钻井平台配置
     */
    @Override
    public List<PlatformConfig> selectPlatformConfigList(PlatformConfig platformConfig)
    {
        return platformConfigMapper.selectPlatformConfigList(platformConfig);
    }

    /**
     * 查询所有启用的钻井平台列表
     * 
     * @return 钻井平台配置集合
     */
    @Override
    public List<PlatformConfig> selectActivePlatformList()
    {
        return platformConfigMapper.selectActivePlatformList();
    }

    /**
     * 新增钻井平台配置
     * 
     * @param platformConfig 钻井平台配置
     * @return 结果
     */
    @Override
    public int insertPlatformConfig(PlatformConfig platformConfig)
    {
        return platformConfigMapper.insertPlatformConfig(platformConfig);
    }

    /**
     * 修改钻井平台配置
     * 
     * @param platformConfig 钻井平台配置
     * @return 结果
     */
    @Override
    public int updatePlatformConfig(PlatformConfig platformConfig)
    {
        return platformConfigMapper.updatePlatformConfig(platformConfig);
    }

    /**
     * 批量删除钻井平台配置
     * 
     * @param ids 需要删除的钻井平台配置主键
     * @return 结果
     */
    @Override
    public int deletePlatformConfigByIds(String ids)
    {
        return platformConfigMapper.deletePlatformConfigByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除钻井平台配置信息
     * 
     * @param id 钻井平台配置主键
     * @return 结果
     */
    @Override
    public int deletePlatformConfigById(Long id)
    {
        return platformConfigMapper.deletePlatformConfigById(id);
    }

    /**
     * 校验平台编号是否唯一
     *
     * @param platformConfig 平台配置信息
     * @return 结果
     */
    @Override
    public boolean checkPlatformNoUnique(PlatformConfig platformConfig)
    {
        Long id = StringUtils.isNull(platformConfig.getId()) ? -1L : platformConfig.getId();
        PlatformConfig info = platformConfigMapper.checkPlatformNoUnique(platformConfig.getPlatformNo());
        if (StringUtils.isNotNull(info) && info.getId().longValue() != id.longValue())
        {
            return false;
        }
        return true;
    }
}
