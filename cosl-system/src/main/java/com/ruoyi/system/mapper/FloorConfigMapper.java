package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FloorConfig;

/**
 * 楼层配置 Mapper 接口
 * 
 * @author ruoyi
 */
public interface FloorConfigMapper
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
     * 删除楼层配置
     * 
     * @param id 楼层配置ID
     * @return 结果
     */
    public int deleteFloorConfigById(Long id);

    /**
     * 批量删除楼层配置
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteFloorConfigByIds(String[] ids);

    /**
     * 检查楼层编号是否唯一
     *
     * @param floorNo 楼层编号
     * @return 结果
     */
    public FloorConfig checkFloorNoUnique(String floorNo);

    /**
     * 查询所有启用的楼层列表
     *
     * @return 楼层配置集合
     */
    public List<FloorConfig> selectActiveFloorList();
}
