package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.EvacuationPoint;

/**
 * 撤离点 Mapper 接口
 * 
 * @author ruoyi
 */
public interface EvacuationPointMapper
{
    /**
     * 查询撤离点信息
     * 
     * @param id 撤离点 ID
     * @return 撤离点信息
     */
    public EvacuationPoint selectEvacuationPointById(Long id);

    /**
     * 查询撤离点列表
     * 
     * @param evacuationPoint 撤离点信息
     * @return 撤离点集合
     */
    public List<EvacuationPoint> selectEvacuationPointList(EvacuationPoint evacuationPoint);

    /**
     * 新增撤离点
     * 
     * @param evacuationPoint 撤离点信息
     * @return 结果
     */
    public int insertEvacuationPoint(EvacuationPoint evacuationPoint);

    /**
     * 修改撤离点
     * 
     * @param evacuationPoint 撤离点信息
     * @return 结果
     */
    public int updateEvacuationPoint(EvacuationPoint evacuationPoint);

    /**
     * 删除撤离点
     * 
     * @param id 撤离点 ID
     * @return 结果
     */
    public int deleteEvacuationPointById(Long id);

    /**
     * 批量删除撤离点
     * 
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deleteEvacuationPointByIds(String[] ids);

    /**
     * 检查撤离点名称是否唯一
     *
     * @param pointName 撤离点名称
     * @return 结果
     */
    public EvacuationPoint checkPointNameUnique(String pointName);

}
