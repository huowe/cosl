-- ============================================
-- 为系统核心表批量添加 platform_no 字段
-- 执行日期: 2026-04-13
-- 说明: 为钻井平台数据隔离功能添加平台编号字段
-- ============================================

-- 1. sys_oper_log - 操作日志表
ALTER TABLE `sys_oper_log` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `oper_id`;
ALTER TABLE `sys_oper_log` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 2. sys_post - 岗位信息表
ALTER TABLE `sys_post` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `post_id`;
ALTER TABLE `sys_post` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 3. sys_role - 角色信息表
ALTER TABLE `sys_role` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `role_id`;
ALTER TABLE `sys_role` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 4. sys_user - 用户信息表
ALTER TABLE `sys_user` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `user_id`;
ALTER TABLE `sys_user` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 5. sys_user_online - 在线用户记录表
ALTER TABLE `sys_user_online` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `session_id`;
ALTER TABLE `sys_user_online` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 6. sys_role_dept - 角色部门关联表
ALTER TABLE `sys_role_dept` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `dept_id`;
ALTER TABLE `sys_role_dept` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 7. sys_role_menu - 角色菜单关联表
ALTER TABLE `sys_role_menu` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `menu_id`;
ALTER TABLE `sys_role_menu` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 8. sys_user_post - 用户岗位关联表
ALTER TABLE `sys_user_post` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `post_id`;
ALTER TABLE `sys_user_post` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 9. sys_user_role - 用户角色关联表
ALTER TABLE `sys_user_role` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `role_id`;
ALTER TABLE `sys_user_role` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 注意: 所有核心表和关联表都已添加 platform_no 字段

-- ============================================
-- 可选: 更新现有数据(根据需要取消注释)
-- ============================================
-- UPDATE `sys_oper_log` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;
-- UPDATE `sys_post` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;
-- UPDATE `sys_role` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;
-- UPDATE `sys_user` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;
-- UPDATE `sys_user_online` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;
-- UPDATE `sys_role_dept` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;
-- UPDATE `sys_role_menu` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;
-- UPDATE `sys_user_post` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;
-- UPDATE `sys_user_role` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;

-- ============================================
-- 验证 SQL - 检查字段是否添加成功
-- ============================================
-- SELECT COLUMN_NAME, COLUMN_TYPE, COLUMN_COMMENT 
-- FROM INFORMATION_SCHEMA.COLUMNS 
-- WHERE TABLE_SCHEMA = DATABASE() 
--   AND TABLE_NAME IN ('sys_oper_log', 'sys_post', 'sys_role', 'sys_user', 'sys_user_online', 'sys_role_dept', 'sys_role_menu', 'sys_user_post', 'sys_user_role')
--   AND COLUMN_NAME = 'platform_no';
