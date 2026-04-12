package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.PersonTrack;

/**
 * 人员轨迹 Service 接口
 * 
 * @author ruoyi
 */
public interface IPersonTrackService
{
    /**
     * 查询人员轨迹
     * 
     * @param id 人员轨迹 ID
     * @return 人员轨迹
     */
    public PersonTrack selectPersonTrackById(Long id);

    /**
     * 查询人员轨迹列表
     * 
     * @param personTrack 人员轨迹
     * @return 人员轨迹集合
     */
    public List<PersonTrack> selectPersonTrackList(PersonTrack personTrack);

    /**
     * 新增人员轨迹
     * 
     * @param personTrack 人员轨迹
     * @return 结果
     */
    public int insertPersonTrack(PersonTrack personTrack);

    /**
     * 修改人员轨迹
     * 
     * @param personTrack 人员轨迹
     * @return 结果
     */
    public int updatePersonTrack(PersonTrack personTrack);

    /**
     * 批量删除人员轨迹
     * 
     * @param ids 需要删除的人员轨迹 ID
     * @return 结果
     */
    public int deletePersonTrackByIds(String ids);

    /**
     * 删除人员轨迹
     * 
     * @param id 人员轨迹 ID
     * @return 结果
     */
    public int deletePersonTrackById(Long id);
}
