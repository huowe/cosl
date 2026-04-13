-- 为 sys_logininfor 表添加 platform_no 字段
ALTER TABLE `sys_logininfor` ADD COLUMN `platform_no` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号' AFTER `info_id`;

-- 为 platform_no 字段添加索引以提升查询性能
ALTER TABLE `sys_logininfor` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 更新现有数据，如果没有平台号可以设置为空或者默认值
-- UPDATE `sys_logininfor` SET `platform_no` = 'DEFAULT' WHERE `platform_no` IS NULL;
