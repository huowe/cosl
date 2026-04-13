package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.system.domain.SysUserRole;

/**
 * 用户与角色关联表 数据层
 * 
 * @author ruoyi
 */
public interface SysUserRoleMapper
{
    /**
     * 通过用户ID查询用户和角色关联
     * 
     * @param userId 用户ID
     * @return 用户和角色关联列表
     */
    public List<SysUserRole> selectUserRoleByUserId(Long userId);

    /**
     * 通过用户ID删除用户和角色关联
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int deleteUserRoleByUserId(Long userId);

    /**
     * 通过用户ID和平台编号删除用户和角色关联
     * 
     * @param userId 用户ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int deleteUserRoleByUserIdWithPlatform(@Param("userId") Long userId, @Param("platformNo") String platformNo);

    /**
     * 批量删除用户和角色关联
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserRole(Long[] ids);

    /**
     * 批量删除用户和角色关联（带平台编号）
     * 
     * @param ids 需要删除的数据ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int deleteUserRoleWithPlatform(@Param("ids") Long[] ids, @Param("platformNo") String platformNo);

    /**
     * 通过角色ID查询角色使用数量
     * 
     * @param roleId 角色ID
     * @return 结果
     */
    public int countUserRoleByRoleId(Long roleId);

    /**
     * 通过角色ID和平台编号查询角色使用数量
     * 
     * @param roleId 角色ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int countUserRoleByRoleIdWithPlatform(@Param("roleId") Long roleId, @Param("platformNo") String platformNo);

    /**
     * 批量新增用户角色信息
     * 
     * @param userRoleList 用户角色列表
     * @return 结果
     */
    public int batchUserRole(List<SysUserRole> userRoleList);

    /**
     * 删除用户和角色关联信息
     * 
     * @param userRole 用户和角色关联信息
     * @return 结果
     */
    public int deleteUserRoleInfo(SysUserRole userRole);

    /**
     * 批量取消授权用户角色
     * 
     * @param roleId 角色ID
     * @param userIds 需要删除的用户数据ID
     * @return 结果
     */
    public int deleteUserRoleInfos(@Param("roleId") Long roleId, @Param("userIds") Long[] userIds);
}
