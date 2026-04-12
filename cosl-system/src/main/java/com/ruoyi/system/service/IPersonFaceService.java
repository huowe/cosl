package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.PersonFace;

/**
 * 人员人脸 Service 接口
 * 
 * @author ruoyi
 */
public interface IPersonFaceService 
{
    /**
     * 查询人员人脸信息
     * 
     * @param id 人员人脸 ID
     * @return 人员人脸信息
     */
    public PersonFace selectPersonFaceById(Long id);

    /**
     * 查询人员人脸列表
     * 
     * @param personFace 人员人脸信息
     * @return 人员人脸集合
     */
    public List<PersonFace> selectPersonFaceList(PersonFace personFace);

    /**
     * 新增人员人脸
     * 
     * @param personFace 人员人脸信息
     * @return 结果
     */
    public int insertPersonFace(PersonFace personFace);

    /**
     * 修改人员人脸
     * 
     * @param personFace 人员人脸信息
     * @return 结果
     */
    public int updatePersonFace(PersonFace personFace);

    /**
     * 批量删除人员人脸
     * 
     * @param ids 需要删除的人员人脸 ID
     * @return 结果
     */
    public int deletePersonFaceByIds(String ids);

    /**
     * 删除人员人脸信息
     * 
     * @param id 人员人脸 ID
     * @return 结果
     */
    public int deletePersonFaceById(Long id);
}
