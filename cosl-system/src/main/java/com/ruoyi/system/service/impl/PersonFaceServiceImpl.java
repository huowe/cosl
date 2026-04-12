package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.PersonFace;
import com.ruoyi.system.mapper.PersonFaceMapper;
import com.ruoyi.system.service.IPersonFaceService;

/**
 * 人员人脸 Service 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class PersonFaceServiceImpl implements IPersonFaceService
{
    @Autowired
    private PersonFaceMapper personFaceMapper;

    /**
     * 查询人员人脸信息
     * 
     * @param id 人员人脸 ID
     * @return 人员人脸信息
     */
    @Override
    public PersonFace selectPersonFaceById(Long id)
    {
        return personFaceMapper.selectPersonFaceById(id);
    }

    /**
     * 查询人员人脸列表
     * 
     * @param personFace 人员人脸信息
     * @return 人员人脸集合
     */
    @Override
    public List<PersonFace> selectPersonFaceList(PersonFace personFace)
    {
        return personFaceMapper.selectPersonFaceList(personFace);
    }

    /**
     * 新增人员人脸
     * 
     * @param personFace 人员人脸信息
     * @return 结果
     */
    @Override
    public int insertPersonFace(PersonFace personFace)
    {
        return personFaceMapper.insertPersonFace(personFace);
    }

    /**
     * 修改人员人脸
     * 
     * @param personFace 人员人脸信息
     * @return 结果
     */
    @Override
    public int updatePersonFace(PersonFace personFace)
    {
        return personFaceMapper.updatePersonFace(personFace);
    }

    /**
     * 批量删除人员人脸
     * 
     * @param ids 需要删除的人员人脸 ID
     * @return 结果
     */
    @Override
    public int deletePersonFaceByIds(String ids)
    {
        return personFaceMapper.deletePersonFaceByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除人员人脸信息
     * 
     * @param id 人员人脸 ID
     * @return 结果
     */
    @Override
    public int deletePersonFaceById(Long id)
    {
        return personFaceMapper.deletePersonFaceById(id);
    }
}
