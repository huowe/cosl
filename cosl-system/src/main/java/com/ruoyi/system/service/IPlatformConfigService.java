package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.PlatformConfig;

/**
 * 钻井平台配置Service接口
 * 
 * @author ruoyi
 * @date 2026-04-12
 */
public interface IPlatformConfigService
{
    /**
     * 查询钻井平台配置
     * 
     * @param id 钻井平台配置主键
     * @return 钻井平台配置
     */
    public PlatformConfig selectPlatformConfigById(Long id);

    /**
     * 根据平台编号查询钻井平台配置
     * 
     * @param platformNo 平台编号
     * @return 钻井平台配置
     */
    public PlatformConfig selectPlatformConfigByNo(String platformNo);

    /**
     * 查询钻井平台配置列表
     * 
     * @param platformConfig 钻井平台配置
     * @return 钻井平台配置集合
     */
    public List<PlatformConfig> selectPlatformConfigList(PlatformConfig platformConfig);

    /**
     * 查询所有启用的钻井平台列表
     * 
     * @return 钻井平台配置集合
     */
    public List<PlatformConfig> selectActivePlatformList();

    /**
     * 新增钻井平台配置
     * 
     * @param platformConfig 钻井平台配置
     * @return 结果
     */
    public int insertPlatformConfig(PlatformConfig platformConfig);

    /**
     * 修改钻井平台配置
     * 
     * @param platformConfig 钻井平台配置
     * @return 结果
     */
    public int updatePlatformConfig(PlatformConfig platformConfig);

    /**
     * 批量删除钻井平台配置
     * 
     * @param ids 需要删除的钻井平台配置主键集合
     * @return 结果
     */
    public int deletePlatformConfigByIds(String ids);

    /**
     * 删除钻井平台配置信息
     * 
     * @param id 钻井平台配置主键
     * @return 结果
     */
    public int deletePlatformConfigById(Long id);

    /**
     * 校验平台编号是否唯一
     * 
     * @param platformConfig 平台配置信息
     * @return 结果
     */
    public boolean checkPlatformNoUnique(PlatformConfig platformConfig);
}
