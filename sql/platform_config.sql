-- ----------------------------
-- 钻井平台数据隔离功能 - 数据库迁移脚本
-- Date: 2026-04-12
-- Description: 添加钻井平台配置表和所有业务表的platform_no字段
-- ----------------------------

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 1. 创建钻井平台配置表
-- ----------------------------
DROP TABLE IF EXISTS `platform_config`;
CREATE TABLE `platform_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '钻井平台编号',
  `platform_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '钻井平台名称',
  `platform_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '平台类型（SEMI_SUB:半潜式，JACK_UP:自升式，DRILL_SHIP:钻井船）',
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '作业位置',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'ACTIVE' COMMENT '状态（ACTIVE:启用，INACTIVE:停用）',
  `sort_order` int(11) DEFAULT 0 COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT 0 COMMENT '删除标志（0存在 1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_platform_no`(`platform_no`) USING BTREE COMMENT '平台编号唯一索引',
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_sort_order`(`sort_order`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='钻井平台配置表';

-- ----------------------------
-- 2. 插入示例平台数据
-- ----------------------------
INSERT INTO `platform_config` VALUES 
(1, 'PLATFORM-A01', '海洋石油A01号', 'SEMI_SUB', '南海东部海域', 'ACTIVE', 1, '半潜式钻井平台', 'admin', NOW(), 'admin', NOW(), 0),
(2, 'PLATFORM-B02', '海洋石油B02号', 'JACK_UP', '渤海湾海域', 'ACTIVE', 2, '自升式钻井平台', 'admin', NOW(), 'admin', NOW(), 0),
(3, 'PLATFORM-C03', '深海探索者号', 'DRILL_SHIP', '南海西部海域', 'ACTIVE', 3, '深水钻井船', 'admin', NOW(), 'admin', NOW(), 0);

-- ----------------------------
-- 3. 为所有业务表添加 platform_no 字段
-- ----------------------------

-- 人员表
ALTER TABLE `person` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `person` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 房间配置表
ALTER TABLE `room_config` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `room_config` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 房间床位表
ALTER TABLE `room_bed` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `room_bed` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 楼层配置表
ALTER TABLE `floor_config` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `floor_config` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 摄像头表
ALTER TABLE `camera` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `camera` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 救生艇配置表
ALTER TABLE `lifeboat_config` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `lifeboat_config` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 救生艇座位表
ALTER TABLE `lifeboat_seat` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `lifeboat_seat` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 救生艇人员关联表
ALTER TABLE `lifeboat_person` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `lifeboat_person` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 撤离点表
ALTER TABLE `evacuation_point` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `evacuation_point` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 演练表
ALTER TABLE `drill` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `drill` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 演练人员关联表
ALTER TABLE `drill_person` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `drill_person` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 撤离事件表
ALTER TABLE `evacuation` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `evacuation` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 撤离记录表
ALTER TABLE `evacuation_record` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `evacuation_record` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 人员轨迹表
ALTER TABLE `person_track` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `person_track` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 人员人脸表
ALTER TABLE `person_face` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `person_face` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- 人员步态表
ALTER TABLE `person_gait` ADD COLUMN `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '钻井平台编号' AFTER `id`;
ALTER TABLE `person_gait` ADD INDEX `idx_platform_no`(`platform_no`) USING BTREE;

-- ----------------------------
-- 4. 更新现有数据的 platform_no（设置为默认平台）
-- ----------------------------
UPDATE `person` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `room_config` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `room_bed` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `floor_config` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `camera` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `lifeboat_config` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `lifeboat_seat` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `lifeboat_person` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `evacuation_point` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `drill` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `drill_person` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `evacuation` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `evacuation_record` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `person_track` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `person_face` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;
UPDATE `person_gait` SET `platform_no` = 'PLATFORM-A01' WHERE `platform_no` IS NULL;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- 完成提示
-- ----------------------------
SELECT '钻井平台数据隔离功能数据库迁移完成！' AS message;
