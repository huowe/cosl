package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.system.domain.SysRoleDept;

/**
 * 角色与部门关联表 数据层
 * 
 * @author ruoyi
 */
public interface SysRoleDeptMapper
{
    /**
     * 通过角色ID删除角色和部门关联
     * 
     * @param roleId 角色ID
     * @return 结果
     */
    public int deleteRoleDeptByRoleId(Long roleId);

    /**
     * 通过角色ID和平台编号删除角色和部门关联
     * 
     * @param roleId 角色ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int deleteRoleDeptByRoleIdWithPlatform(@Param("roleId") Long roleId, @Param("platformNo") String platformNo);

    /**
     * 批量删除角色部门关联信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRoleDept(Long[] ids);

    /**
     * 批量删除角色部门关联信息（带平台编号）
     * 
     * @param ids 需要删除的数据ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int deleteRoleDeptWithPlatform(@Param("ids") Long[] ids, @Param("platformNo") String platformNo);

    /**
     * 查询部门使用数量
     * 
     * @param deptId 部门ID
     * @return 结果
     */
    public int selectCountRoleDeptByDeptId(Long deptId);

    /**
     * 根据部门ID和平台编号查询使用数量
     * 
     * @param deptId 部门ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int selectCountRoleDeptByDeptIdWithPlatform(@Param("deptId") Long deptId, @Param("platformNo") String platformNo);

    /**
     * 批量新增角色部门信息
     * 
     * @param roleDeptList 角色部门列表
     * @return 结果
     */
    public int batchRoleDept(List<SysRoleDept> roleDeptList);
}
