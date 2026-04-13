package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.system.domain.SysUserPost;

/**
 * 用户与岗位关联表 数据层
 * 
 * @author ruoyi
 */
public interface SysUserPostMapper
{
    /**
     * 通过用户ID删除用户和岗位关联
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int deleteUserPostByUserId(Long userId);
    
    /**
     * 通过用户ID和平台编号删除用户和岗位关联
     * 
     * @param userId 用户ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int deleteUserPostByUserIdWithPlatform(@Param("userId") Long userId, @Param("platformNo") String platformNo);
    
    /**
     * 通过岗位ID查询岗位使用数量
     * 
     * @param postId 岗位ID
     * @return 结果
     */
    public int countUserPostById(Long postId);
    
    /**
     * 通过岗位ID和平台编号查询岗位使用数量
     * 
     * @param postId 岗位ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int countUserPostByIdWithPlatform(@Param("postId") Long postId, @Param("platformNo") String platformNo);
    
    /**
     * 批量删除用户和岗位关联
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserPost(Long[] ids);

    /**
     * 批量删除用户和岗位关联（带平台编号）
     * 
     * @param ids 需要删除的数据ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int deleteUserPostWithPlatform(@Param("ids") Long[] ids, @Param("platformNo") String platformNo);

    /**
     * 批量新增用户岗位信息
     * 
     * @param userPostList 用户岗位列表
     * @return 结果
     */
    public int batchUserPost(List<SysUserPost> userPostList);
}
