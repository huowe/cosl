package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.mapper.PersonTrackMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.core.domain.entity.PersonTrack;
import com.ruoyi.system.service.IPersonTrackService;

/**
 * 人员轨迹 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class PersonTrackServiceImpl implements IPersonTrackService
{
    @Autowired
    private PersonTrackMapper personTrackMapper;

    /**
     * 查询人员轨迹
     * 
     * @param id 人员轨迹 ID
     * @return 人员轨迹
     */
    @Override
    public PersonTrack selectPersonTrackById(Long id)
    {
        return personTrackMapper.selectPersonTrackById(id);
    }

    /**
     * 查询人员轨迹列表
     * 
     * @param personTrack 人员轨迹
     * @return 人员轨迹
     */
    @Override
    public List<PersonTrack> selectPersonTrackList(PersonTrack personTrack)
    {
        return personTrackMapper.selectPersonTrackList(personTrack);
    }

    /**
     * 新增人员轨迹
     * 
     * @param personTrack 人员轨迹
     * @return 结果
     */
    @Override
    public int insertPersonTrack(PersonTrack personTrack)
    {
        return personTrackMapper.insertPersonTrack(personTrack);
    }

    /**
     * 修改人员轨迹
     * 
     * @param personTrack 人员轨迹
     * @return 结果
     */
    @Override
    public int updatePersonTrack(PersonTrack personTrack)
    {
        return personTrackMapper.updatePersonTrack(personTrack);
    }

    /**
     * 批量删除人员轨迹
     * 
     * @param ids 需要删除的人员轨迹 ID
     * @return 结果
     */
    @Override
    public int deletePersonTrackByIds(String ids)
    {
        Long[] personTrackIds = Convert.toLongArray(ids);
        for (Long personTrackId : personTrackIds)
        {
            personTrackMapper.deletePersonTrackById(personTrackId);
        }
        return personTrackIds.length;
    }

    /**
     * 删除人员轨迹
     * 
     * @param id 人员轨迹 ID
     * @return 结果
     */
    @Override
    public int deletePersonTrackById(Long id)
    {
        return personTrackMapper.deletePersonTrackById(id);
    }
}
