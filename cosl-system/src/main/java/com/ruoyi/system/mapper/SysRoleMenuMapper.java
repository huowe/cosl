package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.system.domain.SysRoleMenu;

/**
 * 角色与菜单关联表 数据层
 * 
 * @author ruoyi
 */
public interface SysRoleMenuMapper
{
    /**
     * 通过角色ID删除角色和菜单关联
     * 
     * @param roleId 角色ID
     * @return 结果
     */
    public int deleteRoleMenuByRoleId(Long roleId);

    /**
     * 通过角色ID和平台编号删除角色和菜单关联
     * 
     * @param roleId 角色ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int deleteRoleMenuByRoleIdWithPlatform(@Param("roleId") Long roleId, @Param("platformNo") String platformNo);
    
    /**
     * 批量删除角色菜单关联信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRoleMenu(Long[] ids);

    /**
     * 批量删除角色菜单关联信息（带平台编号）
     * 
     * @param ids 需要删除的数据ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int deleteRoleMenuWithPlatform(@Param("ids") Long[] ids, @Param("platformNo") String platformNo);
    
    /**
     * 查询菜单使用数量
     * 
     * @param menuId 菜单ID
     * @return 结果
     */
    public int selectCountRoleMenuByMenuId(Long menuId);

    /**
     * 根据菜单ID和平台编号查询使用数量
     * 
     * @param menuId 菜单ID
     * @param platformNo 平台编号
     * @return 结果
     */
    public int selectCountRoleMenuByMenuIdWithPlatform(@Param("menuId") Long menuId, @Param("platformNo") String platformNo);
    
    /**
     * 批量新增角色菜单信息
     * 
     * @param roleMenuList 角色菜单列表
     * @return 结果
     */
    public int batchRoleMenu(List<SysRoleMenu> roleMenuList);
}
