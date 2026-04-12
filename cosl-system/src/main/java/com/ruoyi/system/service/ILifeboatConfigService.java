package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.LifeboatConfig;
import com.ruoyi.system.domain.EvacuationPoint;

/**
 * 救生艇配置 Service 接口
 * 
 * @author ruoyi
 */
public interface ILifeboatConfigService
{
    /**
     * 查询救生艇配置信息
     * 
     * @param id 救生艇 ID
     * @return 救生艇配置信息
     */
    public LifeboatConfig selectLifeboatConfigById(Long id);

    /**
     * 查询救生艇配置列表
     * 
     * @param lifeboatConfig 救生艇配置信息
     * @return 救生艇配置集合
     */
    public List<LifeboatConfig> selectLifeboatConfigList(LifeboatConfig lifeboatConfig);

    /**
     * 新增救生艇配置
     * 
     * @param lifeboatConfig 救生艇配置信息
     * @return 结果
     */
    public int insertLifeboatConfig(LifeboatConfig lifeboatConfig);

    /**
     * 修改救生艇配置
     * 
     * @param lifeboatConfig 救生艇配置信息
     * @return 结果
     */
    public int updateLifeboatConfig(LifeboatConfig lifeboatConfig);

    /**
     * 批量删除救生艇配置
     * 
     * @param ids 需要删除的救生艇 ID
     * @return 结果
     */
    public int deleteLifeboatConfigByIds(String ids);

    /**
     * 删除救生艇配置
     * 
     * @param id 救生艇 ID
     * @return 结果
     */
    public int deleteLifeboatConfigById(Long id);

    /**
     * 检查救生艇编号是否唯一
     *
     * @param lifeboatConfig 救生艇配置信息
     * @return 结果
     */
    public boolean checkBoatNoUnique(LifeboatConfig lifeboatConfig);

    /**
     * 根据撤离点 ID 查询救生艇列表
     *
     * @param evacuationPointId 撤离点 ID
     * @return 救生艇配置集合
     */
    public List<LifeboatConfig> selectLifeboatConfigsByPointId(Long evacuationPointId);

}
