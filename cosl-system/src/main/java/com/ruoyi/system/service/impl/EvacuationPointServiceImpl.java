package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.EvacuationPointMapper;
import com.ruoyi.system.domain.EvacuationPoint;
import com.ruoyi.system.service.IEvacuationPointService;

/**
 * 撤离点 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class EvacuationPointServiceImpl implements IEvacuationPointService 
{
    @Autowired
    private EvacuationPointMapper evacuationPointMapper;

    /**
     * 查询撤离点信息
     * 
     * @param id 撤离点 ID
     * @return 撤离点信息
     */
    @Override
    public EvacuationPoint selectEvacuationPointById(Long id)
    {
        return evacuationPointMapper.selectEvacuationPointById(id);
    }

    /**
     * 查询撤离点列表
     * 
     * @param evacuationPoint 撤离点信息
     * @return 撤离点信息
     */
    @Override
    public List<EvacuationPoint> selectEvacuationPointList(EvacuationPoint evacuationPoint)
    {
        return evacuationPointMapper.selectEvacuationPointList(evacuationPoint);
    }

    /**
     * 新增撤离点
     * 
     * @param evacuationPoint 撤离点信息
     * @return 结果
     */
    @Override
    public int insertEvacuationPoint(EvacuationPoint evacuationPoint)
    {
        evacuationPoint.setCreateTime(DateUtils.getNowDate());
        evacuationPoint.setUpdateTime(DateUtils.getNowDate());
        evacuationPoint.setDeleted(0);
        return evacuationPointMapper.insertEvacuationPoint(evacuationPoint);
    }

    /**
     * 修改撤离点
     * 
     * @param evacuationPoint 撤离点信息
     * @return 结果
     */
    @Override
    public int updateEvacuationPoint(EvacuationPoint evacuationPoint)
    {
        evacuationPoint.setUpdateTime(DateUtils.getNowDate());
        return evacuationPointMapper.updateEvacuationPoint(evacuationPoint);
    }

    /**
     * 批量删除撤离点
     * 
     * @param ids 需要删除的撤离点 ID
     * @return 结果
     */
    @Override
    public int deleteEvacuationPointByIds(String ids)
    {
        String[] idArr = ids.split(",");
        for (String id : idArr) {
            // 检查是否有救生艇关联
            Long pointId = Long.valueOf(id);
            // TODO: 可以在这里添加检查是否有救生艇关联的逻辑
            evacuationPointMapper.deleteEvacuationPointById(pointId);
        }
        return 1;
    }

    /**
     * 删除撤离点
     * 
     * @param id 撤离点 ID
     * @return 结果
     */
    @Override
    public int deleteEvacuationPointById(Long id)
    {
        return evacuationPointMapper.deleteEvacuationPointById(id);
    }

    /**
     * 检查撤离点名称是否唯一
     *
     * @param evacuationPoint 撤离点信息
     * @return 结果
     */
    @Override
    public boolean checkPointNameUnique(EvacuationPoint evacuationPoint)
    {
        Long id = StringUtils.isNull(evacuationPoint.getId()) ? -1L : evacuationPoint.getId();
        EvacuationPoint info = evacuationPointMapper.checkPointNameUnique(evacuationPoint.getPointName());
        if (StringUtils.isNotNull(info) && info.getId().longValue() != id.longValue())
        {
            return false;
        }
        return true;
    }

}
