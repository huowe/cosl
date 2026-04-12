package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.EvacuationPoint;

/**
 * 撤离点 Service 接口
 * 
 * @author ruoyi
 */
public interface IEvacuationPointService
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
     * 批量删除撤离点
     * 
     * @param ids 需要删除的撤离点 ID
     * @return 结果
     */
    public int deleteEvacuationPointByIds(String ids);

    /**
     * 删除撤离点
     * 
     * @param id 撤离点 ID
     * @return 结果
     */
    public int deleteEvacuationPointById(Long id);

    /**
     * 检查撤离点名称是否唯一
     *
     * @param evacuationPoint 撤离点信息
     * @return 结果
     */
    public boolean checkPointNameUnique(EvacuationPoint evacuationPoint);

}
