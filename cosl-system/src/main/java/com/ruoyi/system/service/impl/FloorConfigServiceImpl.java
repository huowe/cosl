package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.FloorConfig;
import com.ruoyi.system.mapper.FloorConfigMapper;
import com.ruoyi.system.service.IFloorConfigService;

/**
 * 楼层配置 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class FloorConfigServiceImpl implements IFloorConfigService
{
    @Autowired
    private FloorConfigMapper floorConfigMapper;

    /**
     * 查询楼层配置信息
     * 
     * @param id 楼层配置ID
     * @return 楼层配置信息
     */
    @Override
    public FloorConfig selectFloorConfigById(Long id)
    {
        return floorConfigMapper.selectFloorConfigById(id);
    }

    /**
     * 查询楼层配置列表
     * 
     * @param floorConfig 楼层配置信息
     * @return 楼层配置集合
     */
    @Override
    public List<FloorConfig> selectFloorConfigList(FloorConfig floorConfig)
    {
        return floorConfigMapper.selectFloorConfigList(floorConfig);
    }

    /**
     * 新增楼层配置
     * 
     * @param floorConfig 楼层配置信息
     * @return 结果
     */
    @Override
    public int insertFloorConfig(FloorConfig floorConfig)
    {
        // 检查楼层编号是否唯一
        if (!checkFloorNoUnique(floorConfig))
        {
            throw new RuntimeException("楼层编号已存在");
        }
        
        floorConfig.setCreateTime(new Date());
        if (StringUtils.isEmpty(floorConfig.getStatus()))
        {
            floorConfig.setStatus("ACTIVE");
        }
        if (floorConfig.getDeleted() == null)
        {
            floorConfig.setDeleted(0);
        }
        return floorConfigMapper.insertFloorConfig(floorConfig);
    }

    /**
     * 修改楼层配置
     * 
     * @param floorConfig 楼层配置信息
     * @return 结果
     */
    @Override
    public int updateFloorConfig(FloorConfig floorConfig)
    {
        // 检查楼层编号是否唯一
        if (!checkFloorNoUnique(floorConfig))
        {
            throw new RuntimeException("楼层编号已存在");
        }
        
        floorConfig.setUpdateTime(new Date());
        return floorConfigMapper.updateFloorConfig(floorConfig);
    }

    /**
     * 批量删除楼层配置
     * 
     * @param ids 需要删除的楼层配置ID
     * @return 结果
     */
    @Override
    public int deleteFloorConfigByIds(String ids)
    {
        return floorConfigMapper.deleteFloorConfigByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除楼层配置
     * 
     * @param id 楼层配置ID
     * @return 结果
     */
    @Override
    public int deleteFloorConfigById(Long id)
    {
        return floorConfigMapper.deleteFloorConfigById(id);
    }

    /**
     * 检查楼层编号是否唯一
     *
     * @param floorConfig 楼层配置信息
     * @return 结果
     */
    @Override
    public boolean checkFloorNoUnique(FloorConfig floorConfig)
    {
        Long id = StringUtils.isNull(floorConfig.getId()) ? -1L : floorConfig.getId();
        FloorConfig info = floorConfigMapper.checkFloorNoUnique(floorConfig.getFloorNo());
        if (StringUtils.isNotNull(info) && info.getId().longValue() != id.longValue())
        {
            return false;
        }
        return true;
    }

    /**
     * 查询所有启用的楼层列表
     *
     * @return 楼层配置集合
     */
    @Override
    public List<FloorConfig> selectActiveFloorList()
    {
        return floorConfigMapper.selectActiveFloorList();
    }
}
