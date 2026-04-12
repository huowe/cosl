package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FloorConfig;

/**
 * 楼层配置 Service 接口
 * 
 * @author ruoyi
 */
public interface IFloorConfigService
{
    /**
     * 查询楼层配置信息
     * 
     * @param id 楼层配置ID
     * @return 楼层配置信息
     */
    public FloorConfig selectFloorConfigById(Long id);

    /**
     * 查询楼层配置列表
     * 
     * @param floorConfig 楼层配置信息
     * @return 楼层配置集合
     */
    public List<FloorConfig> selectFloorConfigList(FloorConfig floorConfig);

    /**
     * 新增楼层配置
     * 
     * @param floorConfig 楼层配置信息
     * @return 结果
     */
    public int insertFloorConfig(FloorConfig floorConfig);

    /**
     * 修改楼层配置
     * 
     * @param floorConfig 楼层配置信息
     * @return 结果
     */
    public int updateFloorConfig(FloorConfig floorConfig);

    /**
     * 批量删除楼层配置
     * 
     * @param ids 需要删除的楼层配置ID
     * @return 结果
     */
    public int deleteFloorConfigByIds(String ids);

    /**
     * 删除楼层配置
     * 
     * @param id 楼层配置ID
     * @return 结果
     */
    public int deleteFloorConfigById(Long id);

    /**
     * 检查楼层编号是否唯一
     *
     * @param floorConfig 楼层配置信息
     * @return 结果
     */
    public boolean checkFloorNoUnique(FloorConfig floorConfig);

    /**
     * 查询所有启用的楼层列表
     *
     * @return 楼层配置集合
     */
    public List<FloorConfig> selectActiveFloorList();
}
