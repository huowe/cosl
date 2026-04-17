/*
 Navicat Premium Data Transfer

 Source Server         : cosl
 Source Server Type    : MySQL
 Source Server Version : 80045
 Source Host           : localhost:3406
 Source Schema         : cosl

 Target Server Type    : MySQL
 Target Server Version : 80045
 File Encoding         : 65001

 Date: 17/04/2026 15:59:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for camera
-- ----------------------------
DROP TABLE IF EXISTS `camera`;
CREATE TABLE `camera`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `floor` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `x_axis` double(10, 2) NULL DEFAULT NULL,
  `y_axis` double(10, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `latitude` decimal(10, 4) NULL DEFAULT NULL,
  `longitude` decimal(10, 4) NULL DEFAULT NULL,
  `stream_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `camera_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `camera_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `camera_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `is_enable` bit(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_ip`(`ip`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of camera
-- ----------------------------
INSERT INTO `camera` VALUES (3, 'PLATFORM-A01', 'Camera 3', '192.168.1.186', '1', 'online', 11.50, 22.30, 'Entrance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `camera` VALUES (5, 'PLATFORM-A01', 'Camera 3', '192.168.1.16', '1', 'online', 11.50, 22.30, 'Entrance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `camera` VALUES (15, 'PLATFORM-A01', 'cosl-beijing-test1', '192.168.110.159', '1', 'online', 13.50, 26.30, 'Entrance', 45.9826, 113.3857, 'rtsp://192.168.110.159:1351/310', 'cosl-beijing-test', 'cosl-beijing-test', '1392125988', '69def6b07455ad498a370b13', NULL, NULL);
INSERT INTO `camera` VALUES (26, 'PLATFORM-A01', NULL, '192.168.1.64', NULL, 'DETECTING', 0.00, 0.00, NULL, 39.9138, 116.1125, 'rtsp://admin:Aaa13579@192.168.1.64:554', NULL, NULL, '638290461', '69b3d45c3f725c3952a6518a', NULL, NULL);
INSERT INTO `camera` VALUES (27, 'PLATFORM-A01', NULL, '192.168.1.12', NULL, 'DETECTING', 0.00, 0.00, NULL, 39.9753, 116.3428, 'rtsp://admin:Aaa13579@192.168.1.12:554', NULL, NULL, '687327101', '69b3d45c3f725c3952a6518a', NULL, NULL);
INSERT INTO `camera` VALUES (28, 'PLATFORM-A01', NULL, '192.168.1.13', NULL, 'DETECTING', 0.00, 0.00, NULL, 39.9751, 116.3429, 'rtsp://admin:Aaa13579@192.168.1.13:554', NULL, NULL, '409517055', '69b3d45c3f725c3952a6518a', NULL, NULL);
INSERT INTO `camera` VALUES (29, 'PLATFORM-A01', NULL, '192.168.1.15', NULL, 'DETECTING', 0.00, 0.00, NULL, 39.9748, 116.3429, 'rtsp://admin:Aaa13579@192.168.1.64:554', NULL, NULL, '318894075', '69b3d45c3f725c3952a6518a', NULL, NULL);
INSERT INTO `camera` VALUES (30, 'PLATFORM-A01', NULL, '192.168.110.160', NULL, 'STOP', 0.00, 0.00, NULL, 39.9826, 116.3857, 'rtsp://192.168.110.160:1351/310', NULL, NULL, '769746676', '69def6b07455ad498a370b13', NULL, NULL);
INSERT INTO `camera` VALUES (31, 'PLATFORM-A01', NULL, '192.168.110.163', NULL, 'STOP', 0.00, 0.00, NULL, 45.9826, 113.3857, 'rtsp://192.168.110.163:1351/310', NULL, NULL, '158424046', '69def6b07455ad498a370b13', NULL, NULL);
INSERT INTO `camera` VALUES (32, 'PLATFORM-A01', NULL, '192.168.110.165', NULL, 'STOP', 0.00, 0.00, NULL, 45.9826, 113.3857, 'rtsp://192.168.110.165:1351/310', NULL, NULL, '1760502649', '69def6b07455ad498a370b13', NULL, NULL);
INSERT INTO `camera` VALUES (33, 'PLATFORM-A01', NULL, '192.168.110.168', NULL, 'STOP', 0.00, 0.00, NULL, 45.9826, 113.3857, 'rtsp://192.168.110.168:1351/310', NULL, NULL, '2001223084', '69def6b07455ad498a370b13', NULL, NULL);
INSERT INTO `camera` VALUES (34, 'PLATFORM-A01', NULL, '192.168.110.169', NULL, 'STOP', 0.00, 0.00, NULL, 45.9826, 113.3857, 'rtsp://192.168.110.169:1351/310', NULL, NULL, '434860110', '69def6b07455ad498a370b13', NULL, NULL);

-- ----------------------------
-- Table structure for drill
-- ----------------------------
DROP TABLE IF EXISTS `drill`;
CREATE TABLE `drill`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `expected_count` int(0) NULL DEFAULT NULL,
  `actual_count` int(0) NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drill
-- ----------------------------
INSERT INTO `drill` VALUES (1, 'PLATFORM-A01', '春季消防演习', '2026-03-22 21:21:19', '2026-03-22 21:22:12', 50, 48, 'COMPLETED', '2026-03-11 23:03:13', 0);

-- ----------------------------
-- Table structure for drill_person
-- ----------------------------
DROP TABLE IF EXISTS `drill_person`;
CREATE TABLE `drill_person`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `drill_id` bigint(0) NOT NULL COMMENT '演练 ID',
  `person_id` bigint(0) NOT NULL COMMENT '人员 ID',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '签到状态（PRESENT:已签到，ABSENT:缺席）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_drill_person`(`drill_id`, `person_id`) USING BTREE COMMENT '演练 - 人员唯一索引',
  INDEX `idx_drill_id`(`drill_id`) USING BTREE,
  INDEX `idx_person_id`(`person_id`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '演练人员关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drill_person
-- ----------------------------
INSERT INTO `drill_person` VALUES (1, 'PLATFORM-A01', 1, 1, '已签到', NULL, '2026-03-22 21:38:30');

-- ----------------------------
-- Table structure for evacuation_point
-- ----------------------------
DROP TABLE IF EXISTS `evacuation_point`;
CREATE TABLE `evacuation_point`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `point_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '撤离点名称',
  `floor` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '楼层',
  `x_axis` decimal(10, 2) NULL DEFAULT NULL COMMENT '地图坐标X',
  `y_axis` decimal(10, 2) NULL DEFAULT NULL COMMENT '地图坐标Y',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evacuation_point
-- ----------------------------
INSERT INTO `evacuation_point` VALUES (1, 'PLATFORM-A01', '撤离点11', '1', 11.50, 22.30, NULL, '2026-04-01 22:12:26', '2026-04-01 22:26:04', 1);
INSERT INTO `evacuation_point` VALUES (2, 'PLATFORM-A01', '撤离点B', '1', 36.00, 8.00, NULL, '2026-04-01 22:13:15', '2026-04-01 22:13:15', 1);
INSERT INTO `evacuation_point` VALUES (3, 'PLATFORM-A01', '撤离点c', '1', 45.00, 78.00, NULL, '2026-04-01 22:15:32', '2026-04-01 22:15:32', 0);
INSERT INTO `evacuation_point` VALUES (4, 'PLATFORM-A01', '撤离点c', '1', 55.00, 69.00, NULL, '2026-04-01 22:15:32', '2026-04-01 22:15:32', 0);
INSERT INTO `evacuation_point` VALUES (5, 'PLATFORM-A01', '撤离点D', '1', 11.50, 22.30, NULL, '2026-04-01 22:24:53', '2026-04-01 22:24:53', 0);

-- ----------------------------
-- Table structure for floor_config
-- ----------------------------
DROP TABLE IF EXISTS `floor_config`;
CREATE TABLE `floor_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `floor_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '楼层编号',
  `floor_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '楼层名称',
  `sort_order` int(0) NULL DEFAULT 0 COMMENT '排序',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'ACTIVE' COMMENT '状态 ACTIVE/INACTIVE',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(0) NULL DEFAULT 0 COMMENT '删除标志 0-存在 1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_floor_no`(`floor_no`) USING BTREE COMMENT '楼层编号唯一索引',
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '楼层配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of floor_config
-- ----------------------------
INSERT INTO `floor_config` VALUES (1, 'PLATFORM-A01', '1', 'L1', 1, 'ACTIVE', NULL, 'admin', '2026-04-05 13:38:17', 'admin', '2026-04-05 13:38:17', 0);
INSERT INTO `floor_config` VALUES (2, 'PLATFORM-A01', '2', 'L2', 2, 'ACTIVE', NULL, 'admin', '2026-04-05 13:38:17', 'admin', '2026-04-05 13:38:17', 0);
INSERT INTO `floor_config` VALUES (3, 'PLATFORM-A01', '3', 'L3', 3, 'ACTIVE', NULL, 'admin', '2026-04-05 13:38:17', 'admin', '2026-04-05 13:38:17', 0);
INSERT INTO `floor_config` VALUES (4, 'PLATFORM-A01', '4', 'L4', 4, 'ACTIVE', NULL, 'admin', '2026-04-05 13:38:17', 'admin', '2026-04-05 13:38:17', 0);
INSERT INTO `floor_config` VALUES (5, 'PLATFORM-A01', '5', 'L5', 5, 'STOP', NULL, 'admin', '2026-04-05 14:18:47', 'admin', '2026-04-05 14:21:00', 1);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int(0) NULL DEFAULT 1 COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for lifeboat_config
-- ----------------------------
DROP TABLE IF EXISTS `lifeboat_config`;
CREATE TABLE `lifeboat_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `boat_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '救生艇编号',
  `boat_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '救生艇名称',
  `max_capacity` int(0) NOT NULL COMMENT '最大容量',
  `evacuation_point_id` bigint(0) NULL DEFAULT NULL COMMENT '所属撤离点',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'ACTIVE' COMMENT '状态 ACTIVE/INACTIVE',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_boat_no`(`boat_no`) USING BTREE,
  INDEX `idx_point`(`evacuation_point_id`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lifeboat_config
-- ----------------------------
INSERT INTO `lifeboat_config` VALUES (1, 'PLATFORM-A01', NULL, '救生艇A2', 40, 1, 'ACTIVE', NULL, '2026-04-01 22:02:02', '2026-04-01 22:03:27', 1);
INSERT INTO `lifeboat_config` VALUES (2, 'PLATFORM-A01', NULL, '救生艇A1', 40, 1, 'ACTIVE', NULL, '2026-04-01 22:04:29', '2026-04-01 22:04:29', 1);
INSERT INTO `lifeboat_config` VALUES (3, 'PLATFORM-A01', NULL, '救生艇A2', 40, 1, 'ACTIVE', NULL, '2026-04-01 22:04:37', '2026-04-05 15:06:15', 0);

-- ----------------------------
-- Table structure for lifeboat_person
-- ----------------------------
DROP TABLE IF EXISTS `lifeboat_person`;
CREATE TABLE `lifeboat_person`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `person_id` bigint(0) NOT NULL,
  `lifeboat_id` bigint(0) NOT NULL,
  `seat_id` bigint(0) NULL DEFAULT NULL COMMENT '座位ID',
  `assign_time` datetime(0) NULL DEFAULT NULL COMMENT '分配时间',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_person`(`person_id`) USING BTREE,
  INDEX `idx_boat`(`lifeboat_id`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lifeboat_person
-- ----------------------------

-- ----------------------------
-- Table structure for lifeboat_seat
-- ----------------------------
DROP TABLE IF EXISTS `lifeboat_seat`;
CREATE TABLE `lifeboat_seat`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `lifeboat_id` bigint(0) NOT NULL,
  `seat_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '座位号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'FREE' COMMENT 'FREE/OCCUPIED/LOCKED',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_boat_seat`(`lifeboat_id`, `seat_no`) USING BTREE,
  INDEX `idx_boat`(`lifeboat_id`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lifeboat_seat
-- ----------------------------

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mts_card_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_card` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `position` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `certificate_expire_date` date NULL DEFAULT NULL,
  `onboard_date` datetime(0) NULL DEFAULT NULL,
  `leave_date` datetime(0) NULL DEFAULT NULL,
  `room_id` bigint(0) NULL DEFAULT NULL,
  `bed_id` bigint(0) NULL DEFAULT NULL,
  `lifeboat_id` bigint(0) NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'ONBOARD/TRANSFER/LEFT',
  `blacklist_flag` tinyint(0) NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `deleted` tinyint(0) NULL DEFAULT 0,
  `monitor_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '底库人员id',
  `image` longblob NULL COMMENT '证件照',
  `collect_start_time` datetime(0) NULL DEFAULT NULL COMMENT '采集开始时间',
  `collect_end_time` datetime(0) NULL DEFAULT NULL COMMENT '采集结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mts_card_no`(`mts_card_no`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_onboard_date`(`onboard_date`) USING BTREE,
  INDEX `idx_certificate_expire`(`certificate_expire_date`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (1, 'PLATFORM-A01', '张鱼', 'MTS1234567894', '110101179001011234', 'XX海洋工程有限公司', '轮机长', '2025-12-31', '2023-06-01 08:00:00', NULL, 101, 202, 5, 'ONBOARD', 0, '2026-03-07 13:22:28', '2026-04-05 15:08:37', 0, NULL, NULL, NULL, NULL);
INSERT INTO `person` VALUES (2, 'PLATFORM-A01', '电饭锅', 'MTS1453456789', '110105199001011234', 'XX海洋工程有限公司', '轮机长', '2025-12-31', '2023-06-01 08:00:00', NULL, 101, 202, 5, 'ONBOARD', 0, '2026-03-07 13:53:16', '2026-04-02 22:53:02', 0, NULL, NULL, NULL, NULL);
INSERT INTO `person` VALUES (3, 'PLATFORM-A01', '金银花', 'MTS5566522245', '1234567890', 'XX海杨工程有限公司', '船长', '2026-04-25', '2026-04-01 08:00:00', NULL, 102, 101, 1, 'ONBOARD', 0, '2026-04-05 13:28:47', '2026-04-05 13:28:50', 0, NULL, NULL, NULL, NULL);
INSERT INTO `person` VALUES (4, NULL, '蔡文姬', 'MTS333456789', '110101189001011234', 'XX海洋工程有限公司', '新岗位', '2025-12-31', '2023-06-01 08:00:00', NULL, 101, 203, 5, 'ONBOARD', 0, '2026-04-15 15:29:52', '2026-04-15 15:29:52', 0, NULL, NULL, NULL, NULL);
INSERT INTO `person` VALUES (5, NULL, '李白', 'MTS3334567892', '110101189001010234', 'XX海洋工程有限公司', '新岗位', '2025-12-31', '2023-06-01 08:00:00', NULL, 101, 203, 5, 'ONBOARD', 0, '2026-04-15 16:10:26', '2026-04-15 16:10:26', 0, NULL, NULL, NULL, NULL);
INSERT INTO `person` VALUES (8, 'PLATFORM-A01', '李白1', 'MTS3394567892', '110101089001010234', 'XX海洋工程有限公司', '新岗位', '2025-12-31', '2023-06-01 08:00:00', NULL, 101, 203, 5, 'ONBOARD', 0, '2026-04-15 16:47:43', '2026-04-15 16:47:43', 0, '69df4f72b3efc17c8d04bab6', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for person_face
-- ----------------------------
DROP TABLE IF EXISTS `person_face`;
CREATE TABLE `person_face`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `person_id` bigint(0) NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `feature_data` blob NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_person`(`person_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person_face
-- ----------------------------

-- ----------------------------
-- Table structure for person_feature_detail
-- ----------------------------
DROP TABLE IF EXISTS `person_feature_detail`;
CREATE TABLE `person_feature_detail`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '钻井平台编号',
  `monitor_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '底库人员id',
  `feature_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '特征id',
  `angle` int(0) NULL DEFAULT NULL COMMENT '拍摄角度',
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建时间',
  `device_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备id',
  `face_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '人脸图片base64',
  `master_original_image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '主控服务器特征预览图base64',
  `original_image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '特征预览图base64',
  `preview_image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '预览图base64',
  `sequence_count` int(0) NULL DEFAULT NULL COMMENT '序列数量(帧数)',
  `sequence_img_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '步态序列图base64',
  `sequence_video_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '步态序列视频',
  `source_identify` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频源ID',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '视频源类型(0:摄像头,1:离线视频)',
  `target_type` int(0) NULL DEFAULT NULL COMMENT '特征类型(1:人体,2:人脸,7:步态等)',
  `video_source_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源名称',
  `video_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频片段',
  `zip_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'zip压缩',
  `record_create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志 0-未删除 1-已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_monitor_feature`(`monitor_id`, `feature_id`, `deleted`) USING BTREE,
  INDEX `idx_monitor_id`(`monitor_id`) USING BTREE,
  INDEX `idx_feature_id`(`feature_id`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '人员特征详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person_feature_detail
-- ----------------------------
INSERT INTO `person_feature_detail` VALUES (1, 'PLATFORM-A01', '69df4f72b3efc17c8d04bab6', '963714320825323905____3__967768409__1776247041__', -1, '2026-04-15 17:59:22', '967768409', 'http://192.168.1.49:82/gait-boot/v1/file/feature/monitor/f2db6fa320234ee388fd1298e6b50e6e/963714320825323905_face.png?p=monitor,f2db6fa320234ee388fd1298e6b50e6e,0,5859&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825323905&typ=0', NULL, 'http://192.168.1.49:82/gait-boot/v1/file/feature/monitor/69df617ab3efc17c8d04babc/785811d2db8f448186973fb344be5f42.jpg?p=monitor,69df617ab3efc17c8d04babc&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825323905&typ=0', '', 0, '', NULL, '967768409', 3, 2, '785811d2db8f448186973fb344be5f42.jpg', '', '', '2026-04-16 15:54:16', 0);

-- ----------------------------
-- Table structure for person_gait
-- ----------------------------
DROP TABLE IF EXISTS `person_gait`;
CREATE TABLE `person_gait`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `person_id` bigint(0) NULL DEFAULT NULL,
  `camera_id` bigint(0) NULL DEFAULT NULL,
  `gait_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `silhouette_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `capture_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_person_time`(`person_id`, `capture_time`) USING BTREE,
  INDEX `idx_time`(`capture_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person_gait
-- ----------------------------

-- ----------------------------
-- Table structure for person_track
-- ----------------------------
DROP TABLE IF EXISTS `person_track`;
CREATE TABLE `person_track`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `person_id` bigint(0) NULL DEFAULT NULL,
  `camera_id` bigint(0) NULL DEFAULT NULL,
  `capture_time` datetime(0) NULL DEFAULT NULL,
  `x_axis` decimal(10, 2) NULL DEFAULT NULL,
  `y_axis` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_person_time`(`person_id`, `capture_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person_track
-- ----------------------------
INSERT INTO `person_track` VALUES (1, 1, 5, '2025-03-11 10:30:00', 12.34, 56.78);

-- ----------------------------
-- Table structure for platform_config
-- ----------------------------
DROP TABLE IF EXISTS `platform_config`;
CREATE TABLE `platform_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '钻井平台编号',
  `platform_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '钻井平台名称',
  `platform_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '平台类型（SEMI_SUB:半潜式，JACK_UP:自升式，DRILL_SHIP:钻井船）',
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '作业位置',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'ACTIVE' COMMENT '状态（ACTIVE:启用，INACTIVE:停用）',
  `sort_order` int(0) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0存在 1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_platform_no`(`platform_no`) USING BTREE COMMENT '平台编号唯一索引',
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '钻井平台配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of platform_config
-- ----------------------------
INSERT INTO `platform_config` VALUES (1, 'PLATFORM-A01', '海洋石油A01号', 'SEMI_SUB', '南海东部海域', 'ACTIVE', 1, '半潜式钻井平台', 'admin', '2026-04-12 21:59:09', 'admin', '2026-04-12 21:59:09', 0);
INSERT INTO `platform_config` VALUES (2, 'PLATFORM-B02', '海洋石油B02号', 'JACK_UP', '渤海湾海域', 'ACTIVE', 2, '自升式钻井平台', 'admin', '2026-04-12 21:59:09', 'admin', '2026-04-12 21:59:09', 0);
INSERT INTO `platform_config` VALUES (3, 'PLATFORM-C03', '深海探索者号', 'DRILL_SHIP', '南海西部海域', 'ACTIVE', 3, '深水钻井船', 'admin', '2026-04-12 21:59:09', 'admin', '2026-04-12 21:59:09', 0);

-- ----------------------------
-- Table structure for room_bed
-- ----------------------------
DROP TABLE IF EXISTS `room_bed`;
CREATE TABLE `room_bed`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `room_id` bigint(0) NULL DEFAULT NULL,
  `bed_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'FREE/OCCUPIED/LOCKED',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_room_bed`(`room_id`, `bed_no`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_bed
-- ----------------------------
INSERT INTO `room_bed` VALUES (1, 'PLATFORM-A01', 2, 'B', 'LOCKED');
INSERT INTO `room_bed` VALUES (2, 'PLATFORM-A01', 2, 'A', 'LOCKED');

-- ----------------------------
-- Table structure for room_config
-- ----------------------------
DROP TABLE IF EXISTS `room_config`;
CREATE TABLE `room_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  `room_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `floor` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `total_beds` int(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `room_no`(`room_no`) USING BTREE,
  INDEX `idx_platform_no`(`platform_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_config
-- ----------------------------
INSERT INTO `room_config` VALUES (2, 'PLATFORM-A01', 'A101', '1', 4, 'OCCUPIED');
INSERT INTO `room_config` VALUES (3, 'PLATFORM-A01', 'A102', '1', 4, NULL);
INSERT INTO `room_config` VALUES (6, 'PLATFORM-A01', 'A202', '2', 4, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-03-05 22:17:42', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '性别男', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '性别女', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '性别未知', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '显示菜单', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '隐藏菜单', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '正常状态', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '停用状态', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '正常状态', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '停用状态', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '默认分组', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '系统分组', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '系统默认是', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '系统默认否', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '通知', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '公告', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '正常状态', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '关闭状态', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '其他操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '新增操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '修改操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '删除操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '授权操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '导出操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '导入操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '强退操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '生成操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '清空操作', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '正常状态', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '停用状态', 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (100, 1, 'cameraGroupId', '69def6b07455ad498a370b13', 'yuanjian_config', NULL, NULL, 'Y', '0', 'system', '2026-04-17 14:44:59', '', NULL, NULL, 'PLATFORM-A01');
INSERT INTO `sys_dict_data` VALUES (101, 2, 'repId', '69b8ce2fb3efc11bd7a6ea74', 'yuanjian_config', NULL, NULL, 'Y', '0', 'system', '2026-04-17 14:45:00', '', NULL, NULL, 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '用户性别列表', 'PLATFORM-A01');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '菜单状态列表', 'PLATFORM-A01');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '系统开关列表', 'PLATFORM-A01');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '任务状态列表', 'PLATFORM-A01');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '任务分组列表', 'PLATFORM-A01');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '系统是否列表', 'PLATFORM-A01');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '通知类型列表', 'PLATFORM-A01');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '通知状态列表', 'PLATFORM-A01');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '操作类型列表', 'PLATFORM-A01');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-03-05 22:17:42', '', NULL, '登录状态列表', 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-03-05 22:17:42', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-03-05 22:17:42', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-03-05 22:17:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '1', '验证码错误', '2026-03-05 22:33:53', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '1', '验证码错误', '2026-03-05 22:37:19', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '1', '验证码错误', '2026-03-05 22:38:08', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '1', '验证码错误', '2026-03-05 22:52:08', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '1', '验证码错误', '2026-03-05 22:52:50', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '1', '验证码错误', '2026-03-05 22:53:19', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-05 22:55:35', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-06 21:36:29', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-06 21:36:48', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-06 21:37:39', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-06 21:37:54', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-06 22:06:24', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 10:53:02', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:12:14', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:19:09', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:22:07', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:36:55', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:37:56', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:39:12', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:40:11', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:41:56', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:45:17', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 11:55:17', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 12:02:11', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 12:15:02', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 12:24:12', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 12:28:57', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 12:46:16', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 12:46:18', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 13:21:11', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 13:22:28', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 13:25:56', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 13:30:51', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 13:35:02', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 13:36:47', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 13:44:53', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 13:53:15', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 14:39:02', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 14:43:09', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 14:53:18', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-07 14:57:02', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-09 21:12:01', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-09 21:19:26', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-09 21:22:43', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-09 21:24:42', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-09 21:41:42', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-09 22:07:24', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-10 22:33:19', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-10 22:36:38', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-10 22:43:05', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-10 22:53:16', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-10 22:54:22', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-10 22:58:18', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-11 22:12:45', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-11 22:14:51', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-11 23:02:54', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-11 23:15:32', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-15 12:00:22', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-16 22:41:51', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '退出成功', '2026-03-16 22:42:15', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-16 22:42:39', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '退出成功', '2026-03-16 22:42:50', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '退出成功', '2026-03-16 22:43:08', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-16 22:47:44', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-16 22:52:26', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-16 23:08:31', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-16 23:22:32', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-16 23:26:05', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-22 19:53:16', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-22 20:53:50', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-22 21:18:07', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-22 21:21:14', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-22 21:31:32', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-22 21:33:57', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-22 21:35:53', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-22 21:37:28', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-22 21:38:30', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-30 21:54:46', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-30 22:07:29', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-30 22:32:13', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-30 22:36:55', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-30 22:38:19', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-31 21:25:45', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-31 21:34:10', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-03-31 21:43:51', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-01 22:00:06', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-01 22:07:46', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-01 22:23:32', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-02 21:08:58', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-02 21:14:21', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-02 22:42:50', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-02 22:52:57', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-04 19:55:00', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 13:08:09', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 13:12:33', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 13:20:06', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 13:25:54', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 13:39:20', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 13:41:08', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 14:57:01', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 15:01:19', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 15:04:00', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-05 15:08:09', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-09 23:24:47', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-13 14:30:09', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-13 14:46:03', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-13 14:50:06', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-13 18:08:33', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-13 18:09:00', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-13 18:12:24', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-14 14:38:20', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-14 14:41:01', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-14 14:54:40', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-14 14:56:21', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-14 15:46:45', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 10:15:50', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 10:21:30', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 11:10:27', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 11:12:05', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 11:16:12', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 12:30:51', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 13:48:53', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 13:57:13', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 13:58:37', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 14:03:58', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 14:45:26', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 14:49:27', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 14:52:14', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 15:10:24', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 15:11:31', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 15:14:56', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 15:19:53', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 15:25:22', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 15:57:48', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 16:00:06', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 16:06:48', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 16:29:52', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 16:41:41', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 16:47:16', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 17:26:41', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 17:40:39', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 17:57:09', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-15 18:06:02', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-16 15:36:13', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-16 15:53:55', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-16 18:39:42', 'PLATFORM-A01');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Apifox 1.0.0', '', '0', '登录成功', '2026-04-17 10:42:43', 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2026-03-05 22:17:41', '', NULL, '系统管理目录', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2026-03-05 22:17:41', '', NULL, '系统监控目录', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2026-03-05 22:17:41', '', NULL, '系统工具目录', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2026-03-05 22:17:41', '', NULL, '若依官网地址', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2026-03-05 22:17:41', '', NULL, '用户管理菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2026-03-05 22:17:41', '', NULL, '角色管理菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2026-03-05 22:17:41', '', NULL, '菜单管理菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2026-03-05 22:17:41', '', NULL, '部门管理菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2026-03-05 22:17:41', '', NULL, '岗位管理菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2026-03-05 22:17:41', '', NULL, '字典管理菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2026-03-05 22:17:41', '', NULL, '参数设置菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2026-03-05 22:17:41', '', NULL, '通知公告菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2026-03-05 22:17:41', '', NULL, '日志管理菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2026-03-05 22:17:41', '', NULL, '在线用户菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2026-03-05 22:17:41', '', NULL, '定时任务菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2026-03-05 22:17:41', '', NULL, '数据监控菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2026-03-05 22:17:41', '', NULL, '服务监控菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2026-03-05 22:17:41', '', NULL, '缓存监控菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2026-03-05 22:17:41', '', NULL, '表单构建菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2026-03-05 22:17:41', '', NULL, '代码生成菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2026-03-05 22:17:41', '', NULL, '系统接口菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2026-03-05 22:17:41', '', NULL, '操作日志菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2026-03-05 22:17:41', '', NULL, '登录日志菜单', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2026-03-05 22:17:42', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2026-03-05 22:17:42', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '若依开源框架介绍', '1', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE9A1B9E79BAEE4BB8BE7BB8D3C2F7370616E3E3C2F703E3C703E3C666F6E7420636F6C6F723D2223333333333333223E52756F5969E5BC80E6BA90E9A1B9E79BAEE698AFE4B8BAE4BC81E4B89AE794A8E688B7E5AE9AE588B6E79A84E5908EE58FB0E8849AE6898BE69EB6E6A186E69EB6EFBC8CE4B8BAE4BC81E4B89AE68993E980A0E79A84E4B880E7AB99E5BC8FE8A7A3E586B3E696B9E6A188EFBC8CE9998DE4BD8EE4BC81E4B89AE5BC80E58F91E68890E69CACEFBC8CE68F90E58D87E5BC80E58F91E69588E78E87E38082E4B8BBE8A681E58C85E68BACE794A8E688B7E7AEA1E79086E38081E8A792E889B2E7AEA1E79086E38081E983A8E997A8E7AEA1E79086E38081E88F9CE58D95E7AEA1E79086E38081E58F82E695B0E7AEA1E79086E38081E5AD97E585B8E7AEA1E79086E380813C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE5B297E4BD8DE7AEA1E790863C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E5AE9AE697B6E4BBBBE58AA13C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE380813C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE69C8DE58AA1E79B91E68EA7E38081E799BBE5BD95E697A5E5BF97E38081E6938DE4BD9CE697A5E5BF97E38081E4BBA3E7A081E7949FE68890E7AD89E58A9FE883BDE38082E585B6E4B8ADEFBC8CE8BF98E694AFE68C81E5A49AE695B0E68DAEE6BA90E38081E695B0E68DAEE69D83E99990E38081E59BBDE99985E58C96E380815265646973E7BC93E5AD98E38081446F636B6572E983A8E7BDB2E38081E6BB91E58AA8E9AA8CE8AF81E7A081E38081E7ACACE4B889E696B9E8AEA4E8AF81E799BBE5BD95E38081E58886E5B883E5BC8FE4BA8BE58AA1E380813C2F7370616E3E3C666F6E7420636F6C6F723D2223333333333333223EE58886E5B883E5BC8FE69687E4BBB6E5AD98E582A83C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E58886E5BA93E58886E8A1A8E5A484E79086E7AD89E68A80E69CAFE789B9E782B9E380823C2F7370616E3E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F666F727564612E67697465652E636F6D2F696D616765732F313730353033303538333937373430313635312F35656435646236615F313135313030342E706E6722207374796C653D2277696474683A20363470783B223E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE5AE98E7BD91E58F8AE6BC94E7A4BA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE5AE98E7BD91E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F72756F79692E7669703C2F613E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E3C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE69687E6A1A3E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F646F632E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F646F632E72756F79692E7669703C2F613E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E4B88DE58886E7A6BBE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F64656D6F2E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F64656D6F2E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E58886E7A6BBE78988E69CACE38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F7675652E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F7675652E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E5BEAEE69C8DE58AA1E78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F636C6F75642E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F636C6F75642E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E7A7BBE58AA8E7ABAFE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F68352E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F68352E72756F79692E7669703C2F613E3C2F703E3C703E3C6272207374796C653D22636F6C6F723A207267622834382C2034392C203531293B20666F6E742D66616D696C793A202671756F743B48656C766574696361204E6575652671756F743B2C2048656C7665746963612C20417269616C2C2073616E732D73657269663B20666F6E742D73697A653A20313270783B223E3C2F703E, '0', 'admin', '2026-03-05 22:17:42', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 306 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/cosl/tool/gen/genCode/person', '127.0.0.1', '内网IP', '\"person\" ', '{\"msg\":\"【系统预设】不允许生成文件覆盖到本地\",\"code\":500}', 0, NULL, '2026-03-06 22:02:41', 48, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/cosl/tool/gen/genCode/person', '127.0.0.1', '内网IP', '\"person\" ', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.generator.service.impl.GenTableServiceImpl.setSubTable(GenTableServiceImpl.java:487)\r\n	at com.ruoyi.generator.service.impl.GenTableServiceImpl.generatorCode(GenTableServiceImpl.java:261)\r\n	at com.ruoyi.generator.service.impl.GenTableServiceImpl$$FastClassBySpringCGLIB$$49da1c7c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy.invokeMethod(CglibAopProxy.java:386)\r\n	at org.springframework.aop.framework.CglibAopProxy.access$000(CglibAopProxy.java:85)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:703)\r\n	at com.ruoyi.generator.service.impl.GenTableServiceImpl$$EnhancerBySpringCGLIB$$ed45ea3b.generatorCode(<generated>)\r\n	at com.ruoyi.generator.controller.GenController.genCode(GenController.java:267)\r\n	at com.ruoyi.generator.controller.GenController$$FastClassBySpringCGLIB$$cf110d34.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.spri', '2026-03-06 22:06:26', 59, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 1, 'com.ruoyi.web.controller.system.SysAccountController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/add', '127.0.0.1', '内网IP', '{\"userName\":[\"测试\"],\"phonenumber\":[\"13666663333\"],\"loginName\":[\"test\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 11:04:14', 152, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (103, '用户管理', 1, 'com.ruoyi.web.controller.system.SysAccountController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/add', '127.0.0.1', '内网IP', '{\"userName\":[\"凯航\"],\"phonenumber\":[\"13899995555\"],\"loginName\":[\"kaihang\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 11:08:19', 31, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 1, 'com.ruoyi.web.controller.system.SysAccountController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/add', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"dept\":{\"params\":{}},\"loginName\":\"wukong\",\"params\":{},\"phonenumber\":\"13788888888\",\"pwdUpdateDate\":1772853178416,\"roleIds\":[2],\"salt\":\"63d176\",\"userId\":102,\"userName\":\"孙悟空\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 11:12:58', 8036, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (105, '用户管理', 2, 'com.ruoyi.web.controller.system.SysAccountController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/update', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"loginName\":\"wuse\",\"params\":{},\"phonenumber\":\"13712347896\",\"roleIds\":[2],\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"李悟空\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 12:02:15', 177, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 1, 'com.ruoyi.web.controller.system.SysAccountController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/add', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"loginName\":\"wukong\",\"params\":{},\"phonenumber\":\"13788888888\",\"roleIds\":[2],\"userName\":\"孙悟空\"} ', '{\"msg\":\"新增用户\'wukong\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2026-03-07 12:04:56', 8, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (107, '用户管理', 1, 'com.ruoyi.web.controller.system.SysAccountController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/add', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"loginName\":\"wukong\",\"params\":{},\"phonenumber\":\"13788888888\",\"roleIds\":[2],\"userName\":\"让人悟空\"} ', '{\"msg\":\"新增用户\'wukong\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2026-03-07 12:05:03', 8, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (108, '用户管理', 1, 'com.ruoyi.web.controller.system.SysAccountController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/add', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"dept\":{\"params\":{}},\"loginName\":\"wykong\",\"params\":{},\"phonenumber\":\"13788888888\",\"pwdUpdateDate\":1772856310275,\"roleIds\":[2],\"salt\":\"bf560e\",\"userId\":103,\"userName\":\"让人悟空\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 12:05:10', 64, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (109, '用户管理', 1, 'com.ruoyi.web.controller.system.SysAccountController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/add', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"loginName\":\"fdgs\",\"params\":{},\"phonenumber\":\"13788888888\",\"roleIds\":[2],\"userName\":\"风格\"} ', '{\"msg\":\"新增用户\'fdgs\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2026-03-07 12:05:31', 15, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (110, '用户管理', 1, 'com.ruoyi.web.controller.system.SysAccountController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/add', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"dept\":{\"params\":{}},\"loginName\":\"fdgs\",\"params\":{},\"phonenumber\":\"13767888888\",\"pwdUpdateDate\":1772856337307,\"roleIds\":[2],\"salt\":\"7839a5\",\"userId\":104,\"userName\":\"风格\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 12:05:37', 43, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (111, '用户管理', 3, 'com.ruoyi.web.controller.system.SysAccountController.remove()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/delete', '127.0.0.1', '内网IP', '{\"ids\":[\"103,104\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 12:15:03', 96, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (112, '用户管理', 2, 'com.ruoyi.web.controller.system.SysAccountController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"params\":{}} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-07 12:23:35', 41, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 2, 'com.ruoyi.web.controller.system.SysAccountController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"params\":{},\"status\":\"1\",\"userId\":102} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 12:24:12', 89, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (114, '重置密码', 2, 'com.ruoyi.web.controller.system.SysAccountController.resetPwdSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"params\":{},\"salt\":\"fc7bb9\"} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-07 12:28:01', 7, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (115, '重置密码', 2, 'com.ruoyi.web.controller.system.SysAccountController.resetPwdSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"params\":{},\"salt\":\"aa7dca\"} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-07 12:28:36', 9926, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (116, '重置密码', 2, 'com.ruoyi.web.controller.system.SysAccountController.resetPwdSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"loginName\":\"wukong\",\"params\":{},\"salt\":\"e0b4d5\",\"userId\":102} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 12:29:04', 3733, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (117, '修改个人密码', 2, 'com.ruoyi.web.controller.system.SysAccountController.changePassword()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/change-password', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"loginName\":\"wukong\",\"params\":{},\"salt\":\"6f6f06\",\"userId\":102} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 12:46:52', 93, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 5, 'com.ruoyi.web.controller.system.SysAccountController.export()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"params\":{\"dataScope\":\"\"}} ', '{\"msg\":\"02fe90d3-f784-4cbb-a5a9-c1aa535cd30f_用户数据.xlsx\",\"code\":0}', 0, NULL, '2026-03-07 12:48:16', 772, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 5, 'com.ruoyi.web.controller.system.SysAccountController.export()', 'POST', 1, 'admin', '研发部门', '/cosl/api/account/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"dept\":{\"params\":{}},\"params\":{\"dataScope\":\"\"}} ', '{\"msg\":\"ee82fc05-c3c1-47f6-982a-85354585041c_用户数据.xlsx\",\"code\":0}', 0, NULL, '2026-03-07 12:54:32', 323638, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (120, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":202,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"idCard\":\"110101199001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS123456789\",\"name\":\"张三\",\"onboardDate\":1685577600000,\"position\":\"轮机长\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createBy\' in \'class com.ruoyi.common.core.domain.entity.Person\'', '2026-03-07 13:21:14', 103, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (121, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":202,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"id\":1,\"idCard\":\"110101199001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS123456789\",\"name\":\"张三\",\"onboardDate\":1685577600000,\"position\":\"轮机长\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 13:22:28', 102, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (122, '人员管理', 2, 'com.ruoyi.web.controller.system.PersonController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/edit', '127.0.0.1', '内网IP', '{} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-07 13:43:59', 95, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (123, '人员管理', 2, 'com.ruoyi.web.controller.system.PersonController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/edit', '127.0.0.1', '内网IP', '{\"bedId\":202,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"idCard\":\"110101199001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS123456789\",\"name\":\"张yu\",\"onboardDate\":1685577600000,\"position\":\"轮机长\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"修改人员\'张yu\'失败，MTS 卡号已存在\",\"code\":500}', 0, NULL, '2026-03-07 13:45:00', 78, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (124, '人员管理', 2, 'com.ruoyi.web.controller.system.PersonController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/edit', '127.0.0.1', '内网IP', '{\"bedId\":202,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"idCard\":\"110101179001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS1234567894\",\"name\":\"张yu\",\"onboardDate\":1685577600000,\"position\":\"轮机长\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-07 13:45:12', 19, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (125, '人员管理', 2, 'com.ruoyi.web.controller.system.PersonController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/edit', '127.0.0.1', '内网IP', '{\"bedId\":202,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"id\":1,\"idCard\":\"110101179001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS1234567894\",\"name\":\"张yu\",\"onboardDate\":1685577600000,\"position\":\"轮机长\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 13:45:50', 35, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (126, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":202,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"id\":2,\"idCard\":\"110105199001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS1453456789\",\"name\":\"电饭锅\",\"onboardDate\":1685577600000,\"position\":\"轮机长\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 13:53:16', 108, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (127, '人员管理', 3, 'com.ruoyi.web.controller.system.PersonController.remove()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 13:54:33', 16, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (128, '房间配置管理', 1, 'com.ruoyi.web.controller.system.RoomConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1\",\"params\":{}} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\emar\\cosl\\cosl-system\\target\\classes\\mapper\\system\\RoomConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.RoomConfigMapper.insertRoomConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into room_config          ( floor,                          create_by,             create_time,                          update_time )           values ( ?,                          ?,             sysdate(),                          sysdate() )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2026-03-07 14:39:17', 178, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (129, '房间配置管理', 1, 'com.ruoyi.web.controller.system.RoomConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1\",\"id\":1,\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 14:43:10', 90, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (130, '房间配置管理', 1, 'com.ruoyi.web.controller.system.RoomConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1\",\"id\":2,\"params\":{},\"roomNo\":\"A101\",\"totalBeds\":4} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 14:43:39', 27, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (131, '房间配置管理', 1, 'com.ruoyi.web.controller.system.RoomConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1\",\"id\":3,\"params\":{},\"roomNo\":\"A102\",\"totalBeds\":4} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 14:43:53', 26, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (132, '房间配置管理', 1, 'com.ruoyi.web.controller.system.RoomConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"3\",\"id\":4,\"params\":{},\"roomNo\":\"A302\",\"totalBeds\":4} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 14:44:00', 29, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (133, '房间配置管理', 1, 'com.ruoyi.web.controller.system.RoomConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"2\",\"id\":5,\"params\":{},\"roomNo\":\"A202\",\"totalBeds\":4} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 14:44:06', 27, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (134, '房间配置管理', 2, 'com.ruoyi.web.controller.system.RoomConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":1,\"params\":{},\"roomNo\":\"A101\",\"status\":\"\"} ', '{\"msg\":\"修改房间\'A101\'失败，房间号已存在\",\"code\":500}', 0, NULL, '2026-03-07 14:58:38', 157, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (135, '房间配置管理', 2, 'com.ruoyi.web.controller.system.RoomConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":1,\"params\":{},\"status\":\"\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-07 14:58:48', 12, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (136, '房间配置管理', 2, 'com.ruoyi.web.controller.system.RoomConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":1,\"params\":{},\"status\":\"空闲\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-07 14:59:17', 11, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (137, '房间配置管理', 2, 'com.ruoyi.web.controller.system.RoomConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":2,\"params\":{},\"status\":\"空闲\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 15:00:16', 46, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (138, '房间配置管理', 2, 'com.ruoyi.web.controller.system.RoomConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":2,\"params\":{},\"status\":\"空闲\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-07 15:01:14', 11, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (139, '房间配置管理', 3, 'com.ruoyi.web.controller.system.RoomConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomConfig/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4,5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-09 19:33:00', 8934, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (140, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"params\":{},\"status\":\"FREE\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'roomId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-09 21:12:05', 71, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (141, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"bedNo\":\"A\",\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'roomId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-09 21:13:14', 2, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (142, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"bedNo\":\"A\",\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'roomId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-09 21:14:39', 1, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (143, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"bedNo\":\"A\",\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'roomId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-09 21:15:11', 14944, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (144, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"bedNo\":\"A\",\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'roomId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-09 21:15:44', 21129, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (145, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"bedNo\":\"A\",\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'roomId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-09 21:19:27', 78, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (146, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"bedNo\":\"A\",\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'roomId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-09 21:21:28', 101664, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (147, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"bedNo\":\"A\",\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'roomId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-09 21:22:48', 4035, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (148, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"bedNo\":\"A\",\"createBy\":\"admin\",\"id\":1,\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-09 21:24:48', 4894, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (149, '房间床位管理', 2, 'com.ruoyi.web.controller.system.RoomBedController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/edit', '127.0.0.1', '内网IP', '{\"bedNo\":\"B\",\"params\":{},\"roomId\":2,\"status\":\"FREE\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-09 21:26:07', 10, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (150, '房间床位管理', 2, 'com.ruoyi.web.controller.system.RoomBedController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/edit', '127.0.0.1', '内网IP', '{\"bedNo\":\"B\",\"id\":1,\"params\":{},\"roomId\":2,\"status\":\"FREE\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-09 21:26:41', 26, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (151, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"bedNo\":\"B\",\"id\":1,\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', '{\"msg\":\"新增床位失败，该房间已存在相同床位号\",\"code\":500}', 0, NULL, '2026-03-09 21:27:20', 7, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (152, '房间床位管理', 2, 'com.ruoyi.web.controller.system.RoomBedController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/edit', '127.0.0.1', '内网IP', '{\"bedNo\":\"B\",\"id\":1,\"params\":{},\"roomId\":2,\"status\":\"FREE\"} ', '{\"msg\":\"修改床位失败，该房间已存在相同床位号\",\"code\":500}', 0, NULL, '2026-03-09 21:29:07', 13, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (153, '床位状态管理', 2, 'com.ruoyi.web.controller.system.RoomBedController.batchChangeStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/batchChangeStatus', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"],\"status\":[\"LOCKED\"]}', '{\"msg\":\"更新成功\",\"code\":0}', 0, NULL, '2026-03-09 21:42:47', 71, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (154, '房间配置管理', 1, 'com.ruoyi.web.controller.system.RoomConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/room/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"2\",\"id\":6,\"params\":{},\"roomNo\":\"A202\",\"totalBeds\":4} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-09 22:07:24', 93, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (155, '房间配置管理', 2, 'com.ruoyi.web.controller.system.RoomConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/room/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":2,\"params\":{},\"status\":\"空闲\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-09 22:08:14', 12, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (156, '房间配置管理', 3, 'com.ruoyi.web.controller.system.RoomConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/cosl/api/room/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4,5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-09 22:08:53', 12, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (157, '床位状态管理', 2, 'com.ruoyi.web.controller.system.RoomBedController.batchChangeStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/batchChangeStatus', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"],\"status\":[\"LOCKED\"]}', '{\"msg\":\"更新成功\",\"code\":0}', 0, NULL, '2026-03-09 22:10:00', 13, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (158, '房间床位管理', 2, 'com.ruoyi.web.controller.system.RoomBedController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/edit', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"],\"status\":[\"LOCKED\"]}', '{\"msg\":\"修改床位失败，该房间已存在相同床位号\",\"code\":500}', 0, NULL, '2026-03-09 22:10:24', 9, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (159, '房间床位管理', 1, 'com.ruoyi.web.controller.system.RoomBedController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"id\":2,\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-10 22:33:23', 119, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (160, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1F\",\"ip\":\"192.168.1.10\",\"name\":\"Camera 1\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\emar\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( name,             ip,             floor,             status,                                       create_by,             create_time,                          update_time,             remark )           values ( ?,             ?,             ?,             ?,                                       ?,             sysdate(),                          sysdate(),             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2026-03-10 22:34:48', 92, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (161, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1F\",\"id\":1,\"ip\":\"192.168.1.10\",\"name\":\"Camera 1\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-10 22:36:38', 131, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (162, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1F\",\"id\":2,\"ip\":\"192.168.1.11\",\"name\":\"Camera 2\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-10 22:37:11', 20, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (163, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"ip\":\"192.168.1.11\",\"name\":\"Camera 2\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\"} ', '{\"msg\":\"新增摄像头\'Camera 2\'失败，IP 地址已存在\",\"code\":500}', 0, NULL, '2026-03-10 22:37:53', 8, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (164, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1\",\"id\":3,\"ip\":\"192.168.1.12\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-10 22:39:53', 109660, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (165, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1\",\"ip\":\"192.168.1.12\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.1.12\' for key \'camera.uk_ip\'\r\n### The error may exist in file [D:\\emar\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( name,             ip,             floor,             status,                                        remark )           values ( ?,             ?,             ?,             ?,                                        ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.1.12\' for key \'camera.uk_ip\'\n; Duplicate entry \'192.168.1.12\' for key \'camera.uk_ip\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.1.12\' for key \'camera.uk_ip\'', '2026-03-10 22:39:53', 12639, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (166, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"ip\":\"192.168.1.12\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"新增摄像头\'Camera 3\'失败，IP 地址已存在\",\"code\":500}', 0, NULL, '2026-03-10 22:43:06', 85, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (167, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"floor\":\"1\",\"id\":5,\"ip\":\"192.168.1.16\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-10 22:43:27', 15990, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (168, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":1,\"ip\":\"192.168.1.186\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"updateBy\":\"admin\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-10 22:45:37', 19, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (169, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"ip\":\"192.168.1.186\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"新增摄像头\'Camera 3\'失败，IP 地址已存在\",\"code\":500}', 0, NULL, '2026-03-10 22:46:38', 15, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (170, '摄像头管理', 3, 'com.ruoyi.web.controller.system.CameraController.remove()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-10 23:04:26', 84, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (171, '人员轨迹管理', 1, 'com.ruoyi.web.controller.system.PersonTrackController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/personTrack/add', '127.0.0.1', '内网IP', '{\"params\":{}} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\emar\\cosl\\cosl-system\\target\\classes\\mapper\\system\\PersonTrackMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PersonTrackMapper.insertPersonTrack-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into person_track\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2026-03-11 22:12:50', 154, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (172, '人员轨迹管理', 1, 'com.ruoyi.web.controller.system.PersonTrackController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/personTrack/add', '127.0.0.1', '内网IP', '{\"params\":{}} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\emar\\cosl\\cosl-system\\target\\classes\\mapper\\system\\PersonTrackMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PersonTrackMapper.insertPersonTrack-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into person_track\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2026-03-11 22:14:52', 112, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (173, '人员轨迹管理', 1, 'com.ruoyi.web.controller.system.PersonTrackController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/personTrack/add', '127.0.0.1', '内网IP', '{\"cameraId\":5,\"captureTime\":1741660200000,\"id\":1,\"params\":{},\"personId\":1,\"xAxis\":12.34,\"yAxis\":56.78} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-11 22:15:40', 17, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (174, '新增演练', 1, 'com.ruoyi.web.controller.system.DrillController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/add', '127.0.0.1', '内网IP', '{\"actualCount\":48,\"createBy\":\"admin\",\"createTime\":1741674600000,\"endTime\":1742439600000,\"expectedCount\":50,\"id\":1,\"name\":\"春季消防演习\",\"params\":{},\"startTime\":1742432400000,\"status\":\"已完成\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-11 23:03:13', 87, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (175, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/edit', '127.0.0.1', '内网IP', '{\"actualCount\":48,\"createTime\":1741674600000,\"endTime\":1742439600000,\"expectedCount\":50,\"name\":\"春季消防演习\",\"params\":{},\"startTime\":1742432400000,\"status\":\"已完成\",\"updateBy\":\"admin\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_time\' in \'field list\'\r\n### The error may exist in file [D:\\emar\\cosl\\cosl-system\\target\\classes\\mapper\\system\\DrillMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.DrillMapper.updateDrill-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update drill          SET name = ?,             start_time = ?,             end_time = ?,             expected_count = ?,             actual_count = ?,             status = ?,      update_time = sysdate()          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_time\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'update_time\' in \'field list\'', '2026-03-11 23:04:09', 45, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (176, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/edit', '127.0.0.1', '内网IP', '{\"actualCount\":48,\"createTime\":1741674600000,\"endTime\":1742439600000,\"expectedCount\":50,\"name\":\"春季消防演习\",\"params\":{},\"startTime\":1742432400000,\"status\":\"已完成\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-11 23:15:33', 78, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (177, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/edit', '127.0.0.1', '内网IP', '{\"actualCount\":48,\"createTime\":1741674600000,\"endTime\":1742439600000,\"expectedCount\":50,\"id\":1,\"name\":\"春季消防演习\",\"params\":{},\"startTime\":1742432400000,\"status\":\"已完成\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-11 23:15:55', 6, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (178, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.updatePosition()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/updatePosition', '127.0.0.1', '内网IP', '{\"id\":3,\"params\":{},\"xAxis\":19.0,\"yAxis\":20.0} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-22 20:53:58', 96, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (179, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.clearPosition()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/clearPosition', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-22 20:54:51', 20, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (180, '演练管理', 3, 'com.ruoyi.web.controller.system.DrillController.remove()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2,3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-22 20:58:46', 25, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (181, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.startDrill()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/startDrill', '127.0.0.1', '内网IP', '{\"id\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-22 21:21:19', 95, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (182, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.endDrill()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/endDrill', '127.0.0.1', '内网IP', '{\"id\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-22 21:22:12', 24, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (183, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'drillId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-22 21:25:29', 4, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (184, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'drillId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-22 21:26:48', 7229, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (185, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'drillId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-22 21:27:53', 3977, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (186, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'drillId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-22 21:31:03', 123284, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (187, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'drillId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-03-22 21:31:36', 2894, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (188, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-22 21:34:00', 2851, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (189, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-22 21:35:54', 75, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (190, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-22 21:36:34', 18381, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (191, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-03-22 21:37:32', 3692, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (192, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.togglePersonnelStatus()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/togglePersonnelStatus', '127.0.0.1', '内网IP', '{\"drillId\":[\"1\"],\"personId\":[\"1\"],\"status\":[\"已签到\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-22 21:38:30', 80, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (193, '演练管理', 2, 'com.ruoyi.web.controller.system.DrillController.drillDetail()', 'POST', 1, 'admin', '研发部门', '/cosl/api/drill/detail', '127.0.0.1', '内网IP', '{\"id\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"actualCount\":48,\"createTime\":1773241393000,\"endTime\":1774185732000,\"expectedCount\":50,\"id\":1,\"name\":\"春季消防演习\",\"params\":{},\"startTime\":1774185679000,\"status\":\"COMPLETED\"}}', 0, NULL, '2026-03-30 21:55:16', 109, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (194, '房间管理', 2, 'com.ruoyi.web.controller.system.RoomConfigController.toggleLock()', 'POST', 1, 'admin', '研发部门', '/cosl/api/room/toggleLock', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"status\":[\"OCCUPIED\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-31 21:36:34', 137, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (195, '房间管理', 2, 'com.ruoyi.web.controller.system.RoomConfigController.batchLock()', 'POST', 1, 'admin', '研发部门', '/cosl/api/room/batchLock', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"],\"status\":[\"OCCUPIED\"]}', '{\"msg\":\"成功0个房间\",\"code\":0}', 0, NULL, '2026-03-31 21:37:35', 8, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (196, '床位状态管理', 2, 'com.ruoyi.web.controller.system.RoomBedController.toggleLock()', 'POST', 1, 'admin', '研发部门', '/cosl/api/roomBed/toggleLock', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"],\"status\":[\"LOCKED\"]}', '{\"msg\":\"更新成功\",\"code\":0}', 0, NULL, '2026-03-31 21:43:52', 146, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (197, '救生艇管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addLifeboatConfig()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/add', '127.0.0.1', '内网IP', '{\"boatName\":\"救生艇A1\",\"createBy\":\"admin\",\"createTime\":1775052096490,\"deleted\":0,\"evacuationPointId\":1,\"maxCapacity\":40,\"params\":{},\"updateTime\":1775052096490} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'boat_no\' doesn\'t have a default value\r\n### The error may exist in file [D:\\emar\\cosl\\cosl-system\\target\\classes\\mapper\\system\\LifeboatConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.LifeboatConfigMapper.insertLifeboatConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lifeboat_config          ( boat_name,             max_capacity,             evacuation_point_id,                                       create_time,             update_time,             deleted )           values ( ?,             ?,             ?,                                       ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'boat_no\' doesn\'t have a default value\n; Field \'boat_no\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'boat_no\' doesn\'t have a default value', '2026-04-01 22:01:36', 3623, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (198, '救生艇管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addLifeboatConfig()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/add', '127.0.0.1', '内网IP', '{\"boatName\":\"救生艇A1\",\"createBy\":\"admin\",\"createTime\":1775052121716,\"deleted\":0,\"evacuationPointId\":1,\"id\":1,\"maxCapacity\":40,\"params\":{},\"updateTime\":1775052121716} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:02:01', 4129, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (199, '救生艇管理', 2, 'com.ruoyi.web.controller.system.LifeboatController.editLifeboatConfig()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/edit', '127.0.0.1', '内网IP', '{\"boatName\":\"救生艇A2\",\"evacuationPointId\":1,\"id\":1,\"maxCapacity\":40,\"params\":{},\"updateBy\":\"admin\",\"updateTime\":1775052206610} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:03:26', 26, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (200, '救生艇管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addLifeboatConfig()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/add', '127.0.0.1', '内网IP', '{\"boatName\":\"救生艇A1\",\"createBy\":\"admin\",\"createTime\":1775052269259,\"deleted\":0,\"evacuationPointId\":1,\"id\":2,\"maxCapacity\":40,\"params\":{},\"updateTime\":1775052269259} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:04:29', 3890, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (201, '救生艇管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addLifeboatConfig()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/add', '127.0.0.1', '内网IP', '{\"boatName\":\"救生艇A6\",\"createBy\":\"admin\",\"createTime\":1775052276903,\"deleted\":0,\"evacuationPointId\":1,\"id\":3,\"maxCapacity\":40,\"params\":{},\"updateTime\":1775052276903} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:04:36', 31, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (202, '救生艇管理', 3, 'com.ruoyi.web.controller.system.LifeboatController.removeLifeboatConfigs()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:05:26', 35, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (203, '救生艇管理', 3, 'com.ruoyi.web.controller.system.LifeboatController.removeLifeboatConfigs()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:07:00', 68867, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (204, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1775052746028,\"deleted\":0,\"floor\":\"1\",\"id\":1,\"params\":{},\"pointName\":\"撤离点A\",\"updateTime\":1775052746028} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:12:26', 146, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (205, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"params\":{},\"pointName\":\"撤离点A\"} ', '{\"msg\":\"新增撤离点\'撤离点A\'失败，撤离点名称已存在\",\"code\":500}', 0, NULL, '2026-04-01 22:13:08', 8, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (206, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1775052795278,\"deleted\":0,\"floor\":\"1\",\"id\":2,\"params\":{},\"pointName\":\"撤离点B\",\"updateTime\":1775052795278} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:13:15', 42, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (207, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"params\":{},\"pointName\":\"撤离点B\"} ', '{\"msg\":\"新增撤离点\'撤离点B\'失败，撤离点名称已存在\",\"code\":500}', 0, NULL, '2026-04-01 22:14:36', 33103, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (208, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1775052931783,\"deleted\":0,\"floor\":\"1\",\"id\":4,\"params\":{},\"pointName\":\"撤离点c\",\"updateTime\":1775052931783} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:15:31', 42843, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (209, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1775052931787,\"deleted\":0,\"floor\":\"1\",\"id\":3,\"params\":{},\"pointName\":\"撤离点c\",\"updateTime\":1775052931787} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:15:31', 1141, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (210, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"params\":{},\"pointName\":\"撤离点c\"} ', '{\"msg\":\"新增撤离点\'撤离点c\'失败，撤离点名称已存在\",\"code\":500}', 0, NULL, '2026-04-01 22:18:02', 147826, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (211, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"params\":{},\"pointName\":\"撤离点c\"} ', '{\"msg\":\"新增撤离点\'撤离点c\'失败，撤离点名称已存在\",\"code\":500}', 0, NULL, '2026-04-01 22:18:02', 746, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (212, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"params\":{},\"pointName\":\"撤离点c\"} ', '{\"msg\":\"新增撤离点\'撤离点c\'失败，撤离点名称已存在\",\"code\":500}', 0, NULL, '2026-04-01 22:22:05', 238217, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (213, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"params\":{},\"pointName\":\"撤离点c\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"新增撤离点\'撤离点c\'失败，撤离点名称已存在\",\"code\":500}', 0, NULL, '2026-04-01 22:24:17', 6511, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (214, '撤离点管理', 1, 'com.ruoyi.web.controller.system.LifeboatController.addEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1775053492781,\"deleted\":0,\"floor\":\"1\",\"id\":5,\"params\":{},\"pointName\":\"撤离点D\",\"updateTime\":1775053492781,\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:24:55', 5811, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (215, '撤离点管理', 2, 'com.ruoyi.web.controller.system.LifeboatController.editEvacuationPoint()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":1,\"params\":{},\"pointName\":\"撤离点11\",\"updateBy\":\"admin\",\"updateTime\":1775053563901,\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:26:03', 30, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (216, '撤离点管理', 3, 'com.ruoyi.web.controller.system.LifeboatController.removeEvacuationPoints()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/evacuationPoint/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-01 22:26:45', 35, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (217, '人员管理', 2, 'com.ruoyi.web.controller.system.PersonController.batchUpdateRoomInfo()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/batchUpdateRoomInfo', '127.0.0.1', '内网IP', '[{\"bedId\":201,\"id\":1,\"roomId\":101},{\"bedId\":202,\"id\":2,\"roomId\":101},{\"bedId\":203,\"id\":3,\"roomId\":102}] ', '{\"msg\":\"\\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update person\\n             SET room_id = 101,\\n                bed_id = 202,\\n    \' at line 9\\r\\n### The error may exist in file [D:\\\\emar\\\\cosl\\\\cosl-system\\\\target\\\\classes\\\\mapper\\\\system\\\\PersonMapper.xml]\\r\\n### The error may involve defaultParameterMap\\r\\n### The error occurred while setting parameters\\r\\n### SQL: update person              SET room_id = ?,                 bed_id = ?,                                                   update_time = sysdate()              where id = ?          ;              update person              SET room_id = ?,                 bed_id = ?,                                                   update_time = sysdate()              where id = ?          ;              update person              SET room_id = ?,                 bed_id = ?,                                                   update_time = sysdate()              where id = ?\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update person\\n             SET room_id = 101,\\n                bed_id = 202,\\n    \' at line 9\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update person\\n             SET room_id = 101,\\n                bed_id = 202,\\n    \' at line 9\",\"code\":500}', 0, NULL, '2026-04-02 22:42:57', 144, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (218, '人员管理', 2, 'com.ruoyi.web.controller.system.PersonController.batchUpdateRoomInfo()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/batchUpdateRoomInfo', '127.0.0.1', '内网IP', '[{\"bedId\":201,\"id\":1,\"roomId\":101},{\"bedId\":202,\"id\":2,\"roomId\":101},{\"bedId\":203,\"id\":3,\"roomId\":102}] ', '{\"msg\":\"\\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update person\\n             SET room_id = 101,\\n                bed_id = 202,\\n    \' at line 9\\r\\n### The error may exist in file [D:\\\\emar\\\\cosl\\\\cosl-system\\\\target\\\\classes\\\\mapper\\\\system\\\\PersonMapper.xml]\\r\\n### The error may involve defaultParameterMap\\r\\n### The error occurred while setting parameters\\r\\n### SQL: update person              SET room_id = ?,                 bed_id = ?,                                                   update_time = sysdate()              where id = ?          ;              update person              SET room_id = ?,                 bed_id = ?,                                                   update_time = sysdate()              where id = ?          ;              update person              SET room_id = ?,                 bed_id = ?,                                                   update_time = sysdate()              where id = ?\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update person\\n             SET room_id = 101,\\n                bed_id = 202,\\n    \' at line 9\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update person\\n             SET room_id = 101,\\n                bed_id = 202,\\n    \' at line 9\",\"code\":500}', 0, NULL, '2026-04-02 22:46:25', 45374, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (219, '人员管理', 2, 'com.ruoyi.web.controller.system.PersonController.batchUpdateRoomInfo()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/batchUpdateRoomInfo', '127.0.0.1', '内网IP', '[{\"bedId\":201,\"id\":1,\"roomId\":101},{\"bedId\":202,\"id\":2,\"roomId\":101},{\"bedId\":203,\"id\":3,\"roomId\":102}] ', '{\"msg\":\"成功更新1条记录\",\"code\":0}', 0, NULL, '2026-04-02 22:53:02', 3444, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (220, '平台数据统计', 0, 'com.ruoyi.web.controller.system.PlatformStatsController.getPlatformStats()', 'GET', 1, 'admin', '研发部门', '/cosl/api/platform/stats', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"cameraStats\":{\"online\":2,\"total\":2},\"drillStats\":{\"thisMonth\":0,\"total\":1},\"lifeboatStats\":{\"free\":0,\"total\":1},\"personStats\":{\"current\":2,\"enter\":0,\"leave\":0,\"total\":2},\"roomStats\":{\"free\":0,\"total\":3}}}', 0, NULL, '2026-04-04 19:55:44', 206, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (221, '证书到期提醒', 0, 'com.ruoyi.web.controller.system.CertificateAlertController.getAlertList()', 'GET', 1, 'admin', '研发部门', '/cosl/api/alert/list', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":[{\"alertTime\":1775365765859,\"content\":\"张yu的安全证书已过期95天\",\"count\":2,\"persons\":[{\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"expiredDays\":95,\"name\":\"张yu\",\"personId\":1,\"position\":\"轮机长\"}],\"title\":\"证件已过期\",\"type\":\"EXPIRED\"}]}', 0, NULL, '2026-04-05 13:09:25', 121, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (222, '证书到期提醒', 0, 'com.ruoyi.web.controller.system.CertificateAlertController.getAlertList()', 'GET', 1, 'admin', '研发部门', '/cosl/api/alert/list', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":[{\"alertTime\":1775365957154,\"content\":\"电饭锅的安全证书已过期95天\",\"count\":2,\"persons\":[{\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"expiredDays\":95,\"name\":\"电饭锅\",\"personId\":2,\"position\":\"轮机长\"}],\"title\":\"证件已过期\",\"type\":\"EXPIRED\"}]}', 0, NULL, '2026-04-05 13:12:37', 3033, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (223, '证书到期提醒', 0, 'com.ruoyi.web.controller.system.CertificateAlertController.getAlertList()', 'GET', 1, 'admin', '研发部门', '/cosl/api/alert/list', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":[{\"alertTime\":1775365998443,\"content\":\"电饭锅的安全证书已过期95天\",\"count\":2,\"persons\":[{\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"expiredDays\":95,\"name\":\"电饭锅\",\"personId\":2,\"position\":\"轮机长\"}],\"title\":\"证件已过期\",\"type\":\"EXPIRED\"}]}', 0, NULL, '2026-04-05 13:19:12', 363394, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (224, '证书到期提醒', 0, 'com.ruoyi.web.controller.system.CertificateAlertController.getAlertList()', 'GET', 1, 'admin', '研发部门', '/cosl/api/alert/list', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":[{\"alertTime\":1775366408639,\"content\":\"电饭锅的安全证书已过期95天\",\"count\":2,\"persons\":[{\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"expiredDays\":95,\"name\":\"电饭锅\",\"personId\":2,\"position\":\"轮机长\"}],\"title\":\"证件已过期\",\"type\":\"EXPIRED\"}]}', 0, NULL, '2026-04-05 13:20:09', 3154, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (225, '证书到期提醒', 0, 'com.ruoyi.web.controller.system.CertificateAlertController.getAlertList()', 'GET', 1, 'admin', '研发部门', '/cosl/api/alert/list', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":[{\"alertTime\":1775366492020,\"content\":\"电饭锅的安全证书已过期95天\",\"count\":2,\"persons\":[{\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"expiredDays\":95,\"name\":\"电饭锅\",\"personId\":2,\"position\":\"轮机长\"}],\"title\":\"证件已过期\",\"type\":\"EXPIRED\"}]}', 0, NULL, '2026-04-05 13:22:10', 38787, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (226, '证书到期提醒', 0, 'com.ruoyi.web.controller.system.CertificateAlertController.getAlertList()', 'GET', 1, 'admin', '研发部门', '/cosl/api/alert/list', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":[{\"alertTime\":1775366756162,\"content\":\"电饭锅的安全证书已过期95天\",\"count\":2,\"persons\":[{\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"expiredDays\":95,\"name\":\"张yu\",\"personId\":1,\"position\":\"轮机长\"},{\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"expiredDays\":95,\"name\":\"电饭锅\",\"personId\":2,\"position\":\"轮机长\"}],\"title\":\"证件已过期\",\"type\":\"EXPIRED\"}]}', 0, NULL, '2026-04-05 13:26:01', 5707, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (227, '证书到期提醒', 0, 'com.ruoyi.web.controller.system.CertificateAlertController.getAlertList()', 'GET', 1, 'admin', '研发部门', '/cosl/api/alert/list', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":[{\"alertTime\":1775366945355,\"content\":\"1人证件将在30天内到期\",\"count\":1,\"description\":\"持续提醒\",\"persons\":[{\"certificateExpireDate\":1777046400000,\"company\":\"XX海杨工程有限公司\",\"expiredDays\":19,\"name\":\"金银花\",\"personId\":3,\"position\":\"船长\"}],\"title\":\"证件即将到期\",\"type\":\"EXPIRING_SOON\"},{\"alertTime\":1775366945377,\"content\":\"电饭锅的安全证书已过期95天\",\"count\":2,\"persons\":[{\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"expiredDays\":95,\"name\":\"张yu\",\"personId\":1,\"position\":\"轮机长\"},{\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"expiredDays\":95,\"name\":\"电饭锅\",\"personId\":2,\"position\":\"轮机长\"}],\"title\":\"证件已过期\",\"type\":\"EXPIRED\"}]}', 0, NULL, '2026-04-05 13:29:05', 46, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (228, '新增楼层配置', 1, 'com.ruoyi.web.controller.system.FloorConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/floor/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1775369926850,\"deleted\":0,\"floorName\":\"L5\",\"floorNo\":\"5\",\"id\":5,\"params\":{},\"sortOrder\":5,\"status\":\"ACTIVE\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-05 14:18:46', 98, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (229, '楼层配置管理', 2, 'com.ruoyi.web.controller.system.FloorConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/floor/edit', '127.0.0.1', '内网IP', '{\"floorName\":\"L5\",\"floorNo\":\"5\",\"id\":5,\"params\":{},\"sortOrder\":5,\"status\":\"STOP\",\"updateBy\":\"admin\",\"updateTime\":1775370060274} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-05 14:21:00', 22, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (230, '楼层配置管理', 3, 'com.ruoyi.web.controller.system.FloorConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/cosl/api/floor/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-05 14:21:58', 58, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (231, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":1,\"ip\":\"192.168.1.186\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"updateBy\":\"admin\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-04-05 14:57:03', 88, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (232, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":1,\"ip\":\"192.168.1.186\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"updateBy\":\"admin\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-04-05 14:59:19', 103008, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (233, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":1,\"ip\":\"192.168.1.186\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"updateBy\":\"admin\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-04-05 15:01:19', 7326, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (234, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":1,\"ip\":\"192.168.1.186\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"updateBy\":\"admin\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-04-05 15:02:35', 49502, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (235, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":3,\"ip\":\"192.168.1.186\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"updateBy\":\"admin\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-05 15:02:43', 5112, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (236, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":3,\"ip\":\"192.168.1.186\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"修改摄像头\'Camera 3\'失败，IP 地址已存在\",\"code\":500}', 0, NULL, '2026-04-05 15:03:00', 14333, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (237, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"floor\":\"1\",\"id\":3,\"ip\":\"192.168.1.186\",\"name\":\"Camera 3\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"updateBy\":\"admin\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-05 15:04:05', 4369, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (238, '救生艇管理', 2, 'com.ruoyi.web.controller.system.LifeboatController.editLifeboatConfig()', 'POST', 1, 'admin', '研发部门', '/cosl/api/lifeboat/edit', '127.0.0.1', '内网IP', '{\"boatName\":\"救生艇A2\",\"evacuationPointId\":1,\"id\":3,\"maxCapacity\":40,\"params\":{},\"updateBy\":\"admin\",\"updateTime\":1775372774836} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-05 15:06:14', 30, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (239, '人员管理', 2, 'com.ruoyi.web.controller.system.PersonController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/edit', '127.0.0.1', '内网IP', '{\"bedId\":202,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"id\":1,\"idCard\":\"110101179001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS1234567894\",\"name\":\"张鱼\",\"onboardDate\":1685577600000,\"position\":\"轮机长\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-05 15:08:37', 115, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (240, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addGroup()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/group/add', '127.0.0.1', '内网IP', '{\"groupName\":\"cosl\",\"params\":{},\"parentId\":\"\"} ', NULL, 1, 'java.util.HashMap cannot be cast to com.alibaba.fastjson.JSONObject', '2026-04-13 14:47:30', 92, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (241, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addGroup()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/group/add', '127.0.0.1', '内网IP', '{\"groupName\":\"cosl\",\"params\":{},\"parentId\":\"\"} ', NULL, 1, 'java.util.HashMap cannot be cast to com.alibaba.fastjson.JSONObject', '2026-04-13 14:48:45', 57357, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (242, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addGroup()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/group/add', '127.0.0.1', '内网IP', '{\"groupName\":\"cosl\",\"params\":{},\"parentId\":\"\"} ', '{\"msg\":\"<!doctype html><html lang=\\\"en\\\"><head><title>HTTP Status 404 – Not Found</title><style type=\\\"text/css\\\">body {font-family:Tahoma,Arial,sans-serif;} h1, h2, h3, b {color:white;background-color:#525D76;} h1 {font-size:22px;} h2 {font-size:16px;} h3 {font-size:14px;} p {font-size:12px;} a {color:black;} .line {height:1px;background-color:#525D76;border:none;}</style></head><body><h1>HTTP Status 404 – Not Found</h1><hr class=\\\"line\\\" /><p><b>Type</b> Status Report</p><p><b>Description</b> The origin server did not find a current representation for the target resource or is not willing to disclose that one exists.</p><hr class=\\\"line\\\" /><h3>Apache Tomcat/9.0.112</h3></body></html>\",\"code\":0}', 0, NULL, '2026-04-13 14:50:31', 23354, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (243, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/post/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"postCode\":\"text\",\"postName\":\"水手\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\SysPostMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysPostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_post(            platform_no,       post_code,       post_name,                         create_by,      create_time    )values(            ?,       ?,       ?,                         ?,      sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2026-04-14 14:56:23', 224, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (244, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/post/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"postCode\":\"text\",\"postId\":11,\"postName\":\"水手\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-14 14:56:51', 34, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (245, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addGroup()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/group/add', '127.0.0.1', '内网IP', '{\"groupName\":\"cosl-beijing-test\",\"params\":{},\"parentId\":\"\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"data\":{\"groupId\":\"69def6b07455ad498a370b13\"},\"success\":true}}', 0, NULL, '2026-04-15 10:23:43', 186, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (246, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"cameraType\":\"GB\",\"createBy\":\"admin\",\"floor\":\"1\",\"id\":6,\"ip\":\"192.168.110.160\",\"latitude\":39.9826,\"longitude\":116.3857,\"name\":\"cosl-beijing-test\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.160:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":11.5,\"yAxis\":22.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 11:11:10', 38246, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (247, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"cameraType\":\"GB\",\"createBy\":\"admin\",\"floor\":\"1\",\"ip\":\"192.168.110.160\",\"latitude\":39.9826,\"longitude\":116.3857,\"name\":\"cosl-beijing-test\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.160:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":11.5,\"yAxis\":22.3} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( platform_no,             name,             ip,             floor,             status,             x_axis,             y_axis,              remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,              ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'\n; Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'', '2026-04-15 11:15:39', 213620, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (248, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"cameraType\":\"GB\",\"createBy\":\"admin\",\"floor\":\"1\",\"ip\":\"192.168.110.160\",\"latitude\":39.9826,\"longitude\":116.3857,\"name\":\"cosl-beijing-test\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.160:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":11.5,\"yAxis\":22.3} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( platform_no,             name,             ip,             floor,             status,             x_axis,             y_axis,              remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,              ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'\n; Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'', '2026-04-15 11:17:15', 60538, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (249, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"cameraType\":\"GB\",\"createBy\":\"admin\",\"floor\":\"1\",\"ip\":\"192.168.110.160\",\"latitude\":39.9826,\"longitude\":116.3857,\"name\":\"cosl-beijing-test\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.160:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":11.5,\"yAxis\":22.3} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( platform_no,             name,             ip,             floor,             status,             x_axis,             y_axis,              remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,              ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'\n; Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.160\' for key \'camera.uk_ip\'', '2026-04-15 13:02:45', 1901703, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (250, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"createBy\":\"admin\",\"floor\":\"1\",\"id\":11,\"ip\":\"192.168.110.163\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.163:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 13:49:18', 10587, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (251, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"createBy\":\"admin\",\"floor\":\"1\",\"ip\":\"192.168.110.163\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.163:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.163\' for key \'camera.uk_ip\'\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( platform_no,             name,             ip,             floor,             status,             x_axis,             y_axis,              remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,              ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.163\' for key \'camera.uk_ip\'\n; Duplicate entry \'192.168.110.163\' for key \'camera.uk_ip\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.163\' for key \'camera.uk_ip\'', '2026-04-15 13:56:09', 326137, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (252, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"createBy\":\"admin\",\"floor\":\"1\",\"ip\":\"192.168.110.165\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.165:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'stream_url\' in \'field list\'\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( platform_no,             name,             ip,             floor,             status,             x_axis,             y_axis,             remark,             latitude,             longitude,             stream_url,             user_name,             user_pwd,                          camera_group_id )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,              ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'stream_url\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'stream_url\' in \'field list\'', '2026-04-15 13:57:23', 575, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (253, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"createBy\":\"admin\",\"floor\":\"1\",\"id\":13,\"ip\":\"192.168.110.168\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.168:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 13:58:39', 673, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (254, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"createBy\":\"admin\",\"floor\":\"1\",\"id\":14,\"ip\":\"192.168.110.169\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.169:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 14:00:46', 77808, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (255, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/add', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"cameraId\":\"1392125988\",\"createBy\":\"admin\",\"floor\":\"1\",\"id\":15,\"ip\":\"192.168.110.159\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"platformNo\":\"PLATFORM-A01\",\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.159:1351/310\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 14:03:58', 847, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (256, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"floor\":\"1\",\"id\":15,\"ip\":\"192.168.110.159\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.159:1351/310\",\"updateBy\":\"admin\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 14:06:01', 54101, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (257, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"floor\":\"1\",\"id\":15,\"ip\":\"192.168.110.159\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.159:1351/310\",\"updateBy\":\"admin\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 14:06:35', 18292, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (258, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"floor\":\"1\",\"id\":15,\"ip\":\"192.168.110.159\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.159:1351/310\",\"updateBy\":\"admin\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 14:07:34', 54120, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (259, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"cameraId\":\"1392125988\",\"floor\":\"1\",\"id\":15,\"ip\":\"192.168.110.159\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.159:1351/310\",\"updateBy\":\"admin\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 14:08:39', 24575, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (260, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.editSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/edit', '127.0.0.1', '内网IP', '{\"cameraGroupId\":\"69def6b07455ad498a370b13\",\"cameraId\":\"1392125988\",\"floor\":\"1\",\"id\":15,\"ip\":\"192.168.110.159\",\"latitude\":45.9826,\"longitude\":113.3857,\"name\":\"cosl-beijing-test1\",\"params\":{},\"remark\":\"Entrance\",\"status\":\"online\",\"streamURL\":\"rtsp://192.168.110.159:1351/310\",\"updateBy\":\"admin\",\"userName\":\"cosl-beijing-test\",\"userPwd\":\"cosl-beijing-test\",\"xAxis\":13.5,\"yAxis\":26.3} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 14:21:13', 734353, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (261, '摄像头管理', 2, 'com.ruoyi.web.controller.system.CameraController.cameraSetup()', 'POST', 1, 'admin', '研发部门', '/cosl/api/camera/openapi/setup', '127.0.0.1', '内网IP', '{\"cameraIds\":[\"1392125988\"],\"isEnable\":true} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"success\":true}}', 0, NULL, '2026-04-15 14:49:33', 441, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (262, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.syncCamera()', 'GET', 1, 'admin', '研发部门', '/cosl/api/camera/sync', '127.0.0.1', '内网IP', '', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.web.controller.system.CameraController.syncCamera(CameraController.java:151)\r\n	at com.ruoyi.web.controller.system.CameraController$$FastClassBySpringCGLIB$$d8fe6607.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at o', '2026-04-15 15:12:06', 19674, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (263, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.syncCamera()', 'GET', 1, 'admin', '研发部门', '/cosl/api/camera/sync', '127.0.0.1', '内网IP', '', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.web.controller.system.CameraController.syncCamera(CameraController.java:151)\r\n	at com.ruoyi.web.controller.system.CameraController$$FastClassBySpringCGLIB$$d8fe6607.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at o', '2026-04-15 15:12:58', 35306, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (264, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.syncCamera()', 'GET', 1, 'admin', '研发部门', '/cosl/api/camera/sync', '127.0.0.1', '内网IP', '', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.159\' for key \'camera.uk_ip\'\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( platform_no,                          ip,                          status,             x_axis,             y_axis,                          latitude,             longitude,             stream_url,                                       camera_id,             camera_group_id )           values ( ?,                          ?,                          ?,             ?,             ?,                           ?,             ?,             ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.159\' for key \'camera.uk_ip\'\n; Duplicate entry \'192.168.110.159\' for key \'camera.uk_ip\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.159\' for key \'camera.uk_ip\'', '2026-04-15 15:15:17', 20606, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (265, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.syncCamera()', 'GET', 1, 'admin', '研发部门', '/cosl/api/camera/sync', '127.0.0.1', '内网IP', '', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.159\' for key \'camera.uk_ip\'\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( platform_no,                          ip,                          status,             x_axis,             y_axis,                          latitude,             longitude,             stream_url,                                       camera_id,             camera_group_id )           values ( ?,                          ?,                          ?,             ?,             ?,                           ?,             ?,             ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.159\' for key \'camera.uk_ip\'\n; Duplicate entry \'192.168.110.159\' for key \'camera.uk_ip\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.110.159\' for key \'camera.uk_ip\'', '2026-04-15 15:18:15', 114957, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (266, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.syncCamera()', 'GET', 1, 'admin', '研发部门', '/cosl/api/camera/sync', '127.0.0.1', '内网IP', '', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.1.64\' for key \'camera.uk_ip\'\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\CameraMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CameraMapper.insertCamera-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into camera          ( platform_no,                          ip,                          status,             x_axis,             y_axis,                          latitude,             longitude,             stream_url,                                       camera_id,             camera_group_id )           values ( ?,                          ?,                          ?,             ?,             ?,                           ?,             ?,             ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.1.64\' for key \'camera.uk_ip\'\n; Duplicate entry \'192.168.1.64\' for key \'camera.uk_ip\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'192.168.1.64\' for key \'camera.uk_ip\'', '2026-04-15 15:19:07', 30883, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (267, '摄像头管理', 1, 'com.ruoyi.web.controller.system.CameraController.syncCamera()', 'GET', 1, 'admin', '研发部门', '/cosl/api/camera/sync', '127.0.0.1', '内网IP', '', '{\"msg\":\"同步成功\",\"code\":0}', 0, NULL, '2026-04-15 15:20:03', 10625, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (268, '新增底库', 1, 'com.ruoyi.web.controller.system.PersonController.repositoryAdd()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/repository/add', '127.0.0.1', '内网IP', '{\"desc\":\"cosl-beijing-测试底库\",\"repName\":\"cosl-beijing-底库\",\"repParentId\":\"1000000000000000000\"} ', '{\"msg\":\"{\\\"code\\\":\\\"SUCCESS\\\",\\\"msg\\\":\\\"请求成功\\\",\\\"success\\\":true,\\\"data\\\":{\\\"repId\\\":\\\"2044315642150150144\\\",\\\"repositoryId\\\":\\\"69df3cedb3efc17c8d04bab4\\\"}}\",\"code\":0}', 0, NULL, '2026-04-15 15:23:24', 164, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (269, '新增底库', 1, 'com.ruoyi.web.controller.system.PersonController.repositoryAdd()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/repository/add', '127.0.0.1', '内网IP', '{\"desc\":\"cosl-beijing-测试底库1\",\"repName\":\"cosl-beijing-底库1\",\"repParentId\":\"1000000000000000000\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"data\":{\"repositoryId\":\"69df3d66b3efc17c8d04bab5\",\"repId\":\"2044316151137329152\"},\"success\":true}}', 0, NULL, '2026-04-15 15:25:25', 400, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (270, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":203,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"id\":4,\"idCard\":\"110101189001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS333456789\",\"name\":\"蔡文姬\",\"onboardDate\":1685577600000,\"position\":\"新岗位\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 15:29:52', 123055, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (271, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":203,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"idCard\":\"110101189001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS333456789\",\"name\":\"蔡文姬\",\"onboardDate\":1685577600000,\"position\":\"新岗位\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.system.service.impl.PersonServiceImpl.checkMtsCardNoUnique(PersonServiceImpl.java:121)\r\n	at com.ruoyi.web.controller.system.PersonController.addSave(PersonController.java:104)\r\n	at com.ruoyi.web.controller.system.PersonController$$FastClassBySpringCGLIB$$a1dbc237.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.sprin', '2026-04-15 15:58:11', 20417, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (272, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":203,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"idCard\":\"110101189001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS333456789\",\"name\":\"蔡文姬\",\"onboardDate\":1685577600000,\"position\":\"新岗位\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.system.service.impl.PersonServiceImpl.checkMtsCardNoUnique(PersonServiceImpl.java:121)\r\n	at com.ruoyi.web.controller.system.PersonController.addSave(PersonController.java:104)\r\n	at com.ruoyi.web.controller.system.PersonController$$FastClassBySpringCGLIB$$a1dbc237.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.sprin', '2026-04-15 16:00:06', 6272, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (273, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":203,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"idCard\":\"110101189001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS333456789\",\"name\":\"蔡文姬\",\"onboardDate\":1685577600000,\"position\":\"新岗位\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.system.service.impl.PersonServiceImpl.checkMtsCardNoUnique(PersonServiceImpl.java:121)\r\n	at com.ruoyi.web.controller.system.PersonController.addSave(PersonController.java:104)\r\n	at com.ruoyi.web.controller.system.PersonController$$FastClassBySpringCGLIB$$a1dbc237.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.sprin', '2026-04-15 16:05:18', 284087, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (274, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":203,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"idCard\":\"110101189001011234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS333456789\",\"name\":\"蔡文姬\",\"onboardDate\":1685577600000,\"position\":\"新岗位\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"新增人员\'蔡文姬\'失败，MTS 卡号已存在\",\"code\":500}', 0, NULL, '2026-04-15 16:06:46', 33933, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (275, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":203,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"id\":5,\"idCard\":\"110101189001010234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS3334567892\",\"name\":\"李白\",\"onboardDate\":1685577600000,\"position\":\"新岗位\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 16:10:26', 197079, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (276, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":203,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"idCard\":\"110101189001010234\",\"lifeboatId\":5,\"mtsCardNo\":\"MTS3334567892\",\"name\":\"李白\",\"onboardDate\":1685577600000,\"platformNo\":\"PLATFORM-A01\",\"position\":\"新岗位\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'MTS3334567892\' for key \'person.mts_card_no\'\r\n### The error may exist in file [D:\\emar\\git_work\\cosl\\cosl-system\\target\\classes\\mapper\\system\\PersonMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PersonMapper.insertPerson-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into person          ( platform_no,             name,             mts_card_no,             id_card,             company,             position,             certificate_expire_date,             onboard_date,                          room_id,             bed_id,             lifeboat_id,             status,             blacklist_flag,              create_time,              update_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ?,              sysdate(),              sysdate() )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'MTS3334567892\' for key \'person.mts_card_no\'\n; Duplicate entry \'MTS3334567892\' for key \'person.mts_card_no\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'MTS3334567892\' for key \'person.mts_card_no\'', '2026-04-15 16:29:52', 95590, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (277, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":203,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"id\":7,\"idCard\":\"110101089001010234\",\"lifeboatId\":5,\"monitorId\":\"69df4f72b3efc17c8d04bab6\",\"mtsCardNo\":\"MTS3394567892\",\"name\":\"李白1\",\"onboardDate\":1685577600000,\"platformNo\":\"PLATFORM-A01\",\"position\":\"新岗位\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 16:45:29', 227414, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (278, '人员管理', 1, 'com.ruoyi.web.controller.system.PersonController.addSave()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/add', '127.0.0.1', '内网IP', '{\"bedId\":203,\"blacklistFlag\":0,\"certificateExpireDate\":1767110400000,\"company\":\"XX海洋工程有限公司\",\"createTime\":1685586600000,\"deleted\":0,\"id\":8,\"idCard\":\"110101089001010234\",\"lifeboatId\":5,\"monitorId\":\"69df4f72b3efc17c8d04bab6\",\"mtsCardNo\":\"MTS3394567892\",\"name\":\"李白1\",\"onboardDate\":1685577600000,\"platformNo\":\"PLATFORM-A01\",\"position\":\"新岗位\",\"roomId\":101,\"status\":\"ONBOARD\",\"updateTime\":1685586600000} ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-15 16:47:43', 37447, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (279, '上传图片同步解析', 1, 'com.ruoyi.web.controller.system.PersonController.imageAnalysis()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/imageAnalysis', '127.0.0.1', '内网IP', '{\"imageBase64\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAscAAASJCAIAAAC7FiZfAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAgAElEQVR4nOy9W5skuZEldo4ZPDKrq7qHHDY5MzujfdCnlX6VnvXpf2sftJwl2d1VlRkRDjM9GACHXyPy0kVyRuj6siM8/ALHxXDs2AX8P/+v/1vFT8n++fc//tf/8vv//X/7X//bf/s/fvfb36XhkaJgwry4AyBp5/PPP//0l3//85//x09//vNPP3/+8nS+jM/n8Zp9vOJ8OecxX8c8juN4vV7HnMdsZu4+juPlcsk5X2sZxxGAdyWeQfJ0On38+OnTx+8/fvz44cPH0+n0+PjhdDr99tMPHz58R/Djdx9JPj4+DsMAQFXNxpxz9myWr5drPOjp6Wk8Pz8/P5/P569PX56+fjk/n79+/Xo+ny+X53y95uuYs8MxXi9mOedsZtlGu445X81HG0uVzbJ7jodkeDYzitnobu5uZgCchAsAd5qzNp6BDjgAQOBCEpBoVxEBQAIAqe6wDACO7O7mbm4Gd581VLRV+9B1k9cPhp1Sbr9RCMIBpziZUjo9PHz48PHx43cfvvvu06cf0ml4fHx8fHgY0qCqKSURUVWS0QLxN+eccx7H0cY8juPz8/Pz8/PT09PlfD4/l764Xq85X1u7tZqTjM/xYfVSTlh/BIimnRoE5v2t2ogSEZIYNI7HV3eXWtpp8VlQ+m9xH8wPLj/LXqvPTnuXsrjhYiTsPVSwW42DGu795IDD4QAYA6CMSXd3g8NtWfop377uPaJ/KQXj3u1BAMx9tExSvE0HZ+2sQf23P3z813/54d/+8Jvf/vDwYcDjgEF9UH980A+DPuhwSnwc9KRMSqUDxiRQjoLL8/X85fnr56frOQvl4TQ8PpweHh9ESRG6mNMdebTsNtp4yXk0WBZz5uzny/j1+fL5y9NPP/3yx3//0+ev58uYDW5mTnHoiDQasyOb5zzmbDnneIWuQdjkQ/nqBEAnWCZy96NTjHRS4BLSBhBADJ6RM+jO0ZiB7DTADYZUhY+T2nc6sT+g90cFyZg8tafMzBwWohJO+IZAi1lfZp9ITNL4mpKqlnkaAqefs23us5Y6pzFdJhLySlRUGTeJM9sN44iuJkgvfzZHZt8U62m4ltLlONCWiM2rbtYhWrgctzIQ1rfaq1v72tqwP97/3RMvi0tSdNXDST59//3vf/9P//Iv/+UffviHdDoRgi25ExWLFfX5+fn569cvv3z++vXr8/Pz5ZrP5/FyzdcRl/NlHHPO+Xodx3GMz4En6oISK0qOn6NRmrhpL6mq33347uPH7z99+vT4+N3j4+Pj44fHx8evHz9//+n77z99TzBGTEAKESlL0erd50N/Y4VYnLx3/KBN31y4s8zvXzAfBzv33Kmz+04X0+H9L601OC/SlXaOiJhZ/GpmIgLxmLQBQfI49letn775efFKd7/+f7ryKw/Ro+eaO2LB6A4ulo0eUvT4o18S1jef9bKjyujZnenwDnYTvYDkOI6X8/VyHa/j8JA0O8TB0a7iSqdbICNTDCoCAwwjXXAlLufx6eny9evl+fkKR1J9fDg9Po5pSCmpcqAIXHJ2B8w1Z1zNcsY45vN1fHq6fP7y/MvnLz//8uXr8/V6ze4wwLy0j5kF/sjm2TwUMIs3YUH5q3nhgISSQjj7KRFwaqebotnMPRQed5qbgZbdZsBlJhwI2Ztoe6Ky/CScOjk0AbPopg000WsFdXb3CgYJd1PVGDwNefTrZWgIPRYRYUoWIiilNI5jSoGfBMgBJtoj+hF4z1RaiKD1Jf2avfkTSXCpTb30/t2Fy8rvzambr7O+w+at1tVLIjIMw/fff/fp4/d/+Kd/+sff/u7x8QNJTEraurhqEjkNw6noHTmHwGABIzFkLOc8joWPiBOv18v5/Hw+XwJJLMRKr3xE/XLOAUuu1+', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"系统异常\",\"code\":\"SYSTEM_001\",\"success\":false}}', 0, NULL, '2026-04-15 16:52:47', 72447, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (280, '上传图片同步解析', 1, 'com.ruoyi.web.controller.system.PersonController.imageAnalysis()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/imageAnalysis', '127.0.0.1', '内网IP', '{\"imageBase64\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAscAAASJCAIAAAC7FiZfAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAgAElEQVR4nOy9W5skuZEldo4ZPDKrq7qHHDY5MzujfdCnlX6VnvXpf2sftJwl2d1VlRkRDjM9GACHXyPy0kVyRuj6siM8/ALHxXDs2AX8P/+v/1vFT8n++fc//tf/8vv//X/7X//bf/s/fvfb36XhkaJgwry4AyBp5/PPP//0l3//85//x09//vNPP3/+8nS+jM/n8Zp9vOJ8OecxX8c8juN4vV7HnMdsZu4+juPlcsk5X2sZxxGAdyWeQfJ0On38+OnTx+8/fvz44cPH0+n0+PjhdDr99tMPHz58R/Djdx9JPj4+DsMAQFXNxpxz9myWr5drPOjp6Wk8Pz8/P5/P569PX56+fjk/n79+/Xo+ny+X53y95uuYs8MxXi9mOedsZtlGu445X81HG0uVzbJ7jodkeDYzitnobu5uZgCchAsAd5qzNp6BDjgAQOBCEpBoVxEBQAIAqe6wDACO7O7mbm4Gd581VLRV+9B1k9cPhp1Sbr9RCMIBpziZUjo9PHz48PHx43cfvvvu06cf0ml4fHx8fHgY0qCqKSURUVWS0QLxN+eccx7H0cY8juPz8/Pz8/PT09PlfD4/l764Xq85X1u7tZqTjM/xYfVSTlh/BIimnRoE5v2t2ogSEZIYNI7HV3eXWtpp8VlQ+m9xH8wPLj/LXqvPTnuXsrjhYiTsPVSwW42DGu795IDD4QAYA6CMSXd3g8NtWfop377uPaJ/KQXj3u1BAMx9tExSvE0HZ+2sQf23P3z813/54d/+8Jvf/vDwYcDjgEF9UH980A+DPuhwSnwc9KRMSqUDxiRQjoLL8/X85fnr56frOQvl4TQ8PpweHh9ESRG6mNMdebTsNtp4yXk0WBZz5uzny/j1+fL5y9NPP/3yx3//0+ev58uYDW5mTnHoiDQasyOb5zzmbDnneIWuQdjkQ/nqBEAnWCZy96NTjHRS4BLSBhBADJ6RM+jO0ZiB7DTADYZUhY+T2nc6sT+g90cFyZg8tafMzBwWohJO+IZAi1lfZp9ITNL4mpKqlnkaAqefs23us5Y6pzFdJhLySlRUGTeJM9sN44iuJkgvfzZHZt8U62m4ltLlONCWiM2rbtYhWrgctzIQ1rfaq1v72tqwP97/3RMvi0tSdNXDST59//3vf/9P//Iv/+UffviHdDoRgi25ExWLFfX5+fn569cvv3z++vXr8/Pz5ZrP5/FyzdcRl/NlHHPO+Xodx3GMz4En6oISK0qOn6NRmrhpL6mq33347uPH7z99+vT4+N3j4+Pj44fHx8evHz9//+n77z99TzBGTEAKESlL0erd50N/Y4VYnLx3/KBN31y4s8zvXzAfBzv33Kmz+04X0+H9L601OC/SlXaOiJhZ/GpmIgLxmLQBQfI49letn775efFKd7/+f7ryKw/Ro+eaO2LB6A4ulo0eUvT4o18S1jef9bKjyujZnenwDnYTvYDkOI6X8/VyHa/j8JA0O8TB0a7iSqdbICNTDCoCAwwjXXAlLufx6eny9evl+fkKR1J9fDg9Po5pSCmpcqAIXHJ2B8w1Z1zNcsY45vN1fHq6fP7y/MvnLz//8uXr8/V6ze4wwLy0j5kF/sjm2TwUMIs3YUH5q3nhgISSQjj7KRFwaqebotnMPRQed5qbgZbdZsBlJhwI2Ztoe6Ky/CScOjk0AbPopg000WsFdXb3CgYJd1PVGDwNefTrZWgIPRYRYUoWIiilNI5jSoGfBMgBJtoj+hF4z1RaiKD1Jf2avfkTSXCpTb30/t2Fy8rvzambr7O+w+at1tVLIjIMw/fff/fp4/d/+Kd/+sff/u7x8QNJTEraurhqEjkNw6noHTmHwGABIzFkLOc8joWPiBOv18v5/Hw+XwJJLMRKr3xE/XLOAUuu1+', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"系统异常\",\"code\":\"SYSTEM_001\",\"success\":false}}', 0, NULL, '2026-04-15 16:55:32', 96439, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (281, '上传图片同步解析', 1, 'com.ruoyi.web.controller.system.PersonController.imageAnalysis()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/imageAnalysis', '127.0.0.1', '内网IP', '{\"imageBase64\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAscAAASJCAIAAAC7FiZfAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAgAElEQVR4nOy9W5skuZEldo4ZPDKrq7qHHDY5MzujfdCnlX6VnvXpf2sftJwl2d1VlRkRDjM9GACHXyPy0kVyRuj6siM8/ALHxXDs2AX8P/+v/1vFT8n++fc//tf/8vv//X/7X//bf/s/fvfb36XhkaJgwry4AyBp5/PPP//0l3//85//x09//vNPP3/+8nS+jM/n8Zp9vOJ8OecxX8c8juN4vV7HnMdsZu4+juPlcsk5X2sZxxGAdyWeQfJ0On38+OnTx+8/fvz44cPH0+n0+PjhdDr99tMPHz58R/Djdx9JPj4+DsMAQFXNxpxz9myWr5drPOjp6Wk8Pz8/P5/P569PX56+fjk/n79+/Xo+ny+X53y95uuYs8MxXi9mOedsZtlGu445X81HG0uVzbJ7jodkeDYzitnobu5uZgCchAsAd5qzNp6BDjgAQOBCEpBoVxEBQAIAqe6wDACO7O7mbm4Gd581VLRV+9B1k9cPhp1Sbr9RCMIBpziZUjo9PHz48PHx43cfvvvu06cf0ml4fHx8fHgY0qCqKSURUVWS0QLxN+eccx7H0cY8juPz8/Pz8/PT09PlfD4/l764Xq85X1u7tZqTjM/xYfVSTlh/BIimnRoE5v2t2ogSEZIYNI7HV3eXWtpp8VlQ+m9xH8wPLj/LXqvPTnuXsrjhYiTsPVSwW42DGu795IDD4QAYA6CMSXd3g8NtWfop377uPaJ/KQXj3u1BAMx9tExSvE0HZ+2sQf23P3z813/54d/+8Jvf/vDwYcDjgEF9UH980A+DPuhwSnwc9KRMSqUDxiRQjoLL8/X85fnr56frOQvl4TQ8PpweHh9ESRG6mNMdebTsNtp4yXk0WBZz5uzny/j1+fL5y9NPP/3yx3//0+ev58uYDW5mTnHoiDQasyOb5zzmbDnneIWuQdjkQ/nqBEAnWCZy96NTjHRS4BLSBhBADJ6RM+jO0ZiB7DTADYZUhY+T2nc6sT+g90cFyZg8tafMzBwWohJO+IZAi1lfZp9ITNL4mpKqlnkaAqefs23us5Y6pzFdJhLySlRUGTeJM9sN44iuJkgvfzZHZt8U62m4ltLlONCWiM2rbtYhWrgctzIQ1rfaq1v72tqwP97/3RMvi0tSdNXDST59//3vf/9P//Iv/+UffviHdDoRgi25ExWLFfX5+fn569cvv3z++vXr8/Pz5ZrP5/FyzdcRl/NlHHPO+Xodx3GMz4En6oISK0qOn6NRmrhpL6mq33347uPH7z99+vT4+N3j4+Pj44fHx8evHz9//+n77z99TzBGTEAKESlL0erd50N/Y4VYnLx3/KBN31y4s8zvXzAfBzv33Kmz+04X0+H9L601OC/SlXaOiJhZ/GpmIgLxmLQBQfI49letn775efFKd7/+f7ryKw/Ro+eaO2LB6A4ulo0eUvT4o18S1jef9bKjyujZnenwDnYTvYDkOI6X8/VyHa/j8JA0O8TB0a7iSqdbICNTDCoCAwwjXXAlLufx6eny9evl+fkKR1J9fDg9Po5pSCmpcqAIXHJ2B8w1Z1zNcsY45vN1fHq6fP7y/MvnLz//8uXr8/V6ze4wwLy0j5kF/sjm2TwUMIs3YUH5q3nhgISSQjj7KRFwaqebotnMPRQed5qbgZbdZsBlJhwI2Ztoe6Ky/CScOjk0AbPopg000WsFdXb3CgYJd1PVGDwNefTrZWgIPRYRYUoWIiilNI5jSoGfBMgBJtoj+hF4z1RaiKD1Jf2avfkTSXCpTb30/t2Fy8rvzambr7O+w+at1tVLIjIMw/fff/fp4/d/+Kd/+sff/u7x8QNJTEraurhqEjkNw6noHTmHwGABIzFkLOc8joWPiBOv18v5/Hw+XwJJLMRKr3xE/XLOAUuu1+', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"系统异常\",\"code\":\"SYSTEM_001\",\"success\":false}}', 0, NULL, '2026-04-15 17:12:33', 24273, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (282, '上传图片同步解析', 1, 'com.ruoyi.web.controller.system.PersonController.imageAnalysis()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/imageAnalysis', '127.0.0.1', '内网IP', '{\"imageBase64\":\"\",\"url\":\"https://material.yixintui.com/ai_design/aic_cover_img/20260129/jichuang-54a19581-c7aa-4af6.jpg\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"文件读取失败\",\"code\":\"OVA_002\",\"success\":false}}', 0, NULL, '2026-04-15 17:25:33', 589848, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (283, '上传图片同步解析', 1, 'com.ruoyi.web.controller.system.PersonController.imageAnalysis()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/imageAnalysis', '127.0.0.1', '内网IP', '{\"imageBase64\":\"iVBORw0KGgoAAAANSUhEUgAAAscAAASJCAIAAAC7FiZfAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAgAElEQVR4nOy9W5skuZEldo4ZPDKrq7qHHDY5MzujfdCnlX6VnvXpf2sftJwl2d1VlRkRDjM9GACHXyPy0kVyRuj6siM8/ALHxXDs2AX8P/+v/1vFT8n++fc//tf/8vv//X/7X//bf/s/fvfb36XhkaJgwry4AyBp5/PPP//0l3//85//x09//vNPP3/+8nS+jM/n8Zp9vOJ8OecxX8c8juN4vV7HnMdsZu4+juPlcsk5X2sZxxGAdyWeQfJ0On38+OnTx+8/fvz44cPH0+n0+PjhdDr99tMPHz58R/Djdx9JPj4+DsMAQFXNxpxz9myWr5drPOjp6Wk8Pz8/P5/P569PX56+fjk/n79+/Xo+ny+X53y95uuYs8MxXi9mOedsZtlGu445X81HG0uVzbJ7jodkeDYzitnobu5uZgCchAsAd5qzNp6BDjgAQOBCEpBoVxEBQAIAqe6wDACO7O7mbm4Gd581VLRV+9B1k9cPhp1Sbr9RCMIBpziZUjo9PHz48PHx43cfvvvu06cf0ml4fHx8fHgY0qCqKSURUVWS0QLxN+eccx7H0cY8juPz8/Pz8/PT09PlfD4/l764Xq85X1u7tZqTjM/xYfVSTlh/BIimnRoE5v2t2ogSEZIYNI7HV3eXWtpp8VlQ+m9xH8wPLj/LXqvPTnuXsrjhYiTsPVSwW42DGu795IDD4QAYA6CMSXd3g8NtWfop377uPaJ/KQXj3u1BAMx9tExSvE0HZ+2sQf23P3z813/54d/+8Jvf/vDwYcDjgEF9UH980A+DPuhwSnwc9KRMSqUDxiRQjoLL8/X85fnr56frOQvl4TQ8PpweHh9ESRG6mNMdebTsNtp4yXk0WBZz5uzny/j1+fL5y9NPP/3yx3//0+ev58uYDW5mTnHoiDQasyOb5zzmbDnneIWuQdjkQ/nqBEAnWCZy96NTjHRS4BLSBhBADJ6RM+jO0ZiB7DTADYZUhY+T2nc6sT+g90cFyZg8tafMzBwWohJO+IZAi1lfZp9ITNL4mpKqlnkaAqefs23us5Y6pzFdJhLySlRUGTeJM9sN44iuJkgvfzZHZt8U62m4ltLlONCWiM2rbtYhWrgctzIQ1rfaq1v72tqwP97/3RMvi0tSdNXDST59//3vf/9P//Iv/+UffviHdDoRgi25ExWLFfX5+fn569cvv3z++vXr8/Pz5ZrP5/FyzdcRl/NlHHPO+Xodx3GMz4En6oISK0qOn6NRmrhpL6mq33347uPH7z99+vT4+N3j4+Pj44fHx8evHz9//+n77z99TzBGTEAKESlL0erd50N/Y4VYnLx3/KBN31y4s8zvXzAfBzv33Kmz+04X0+H9L601OC/SlXaOiJhZ/GpmIgLxmLQBQfI49letn775efFKd7/+f7ryKw/Ro+eaO2LB6A4ulo0eUvT4o18S1jef9bKjyujZnenwDnYTvYDkOI6X8/VyHa/j8JA0O8TB0a7iSqdbICNTDCoCAwwjXXAlLufx6eny9evl+fkKR1J9fDg9Po5pSCmpcqAIXHJ2B8w1Z1zNcsY45vN1fHq6fP7y/MvnLz//8uXr8/V6ze4wwLy0j5kF/sjm2TwUMIs3YUH5q3nhgISSQjj7KRFwaqebotnMPRQed5qbgZbdZsBlJhwI2Ztoe6Ky/CScOjk0AbPopg000WsFdXb3CgYJd1PVGDwNefTrZWgIPRYRYUoWIiilNI5jSoGfBMgBJtoj+hF4z1RaiKD1Jf2avfkTSXCpTb30/t2Fy8rvzambr7O+w+at1tVLIjIMw/fff/fp4/d/+Kd/+sff/u7x8QNJTEraurhqEjkNw6noHTmHwGABIzFkLOc8joWPiBOv18v5/Hw+XwJJLMRKr3xE/XLOAUuu1+sw5IAnoQe3zw2OkEVPWvfB', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"data\":[{\"keyframes\":false,\"privateOriginalPreviewImage\":\"\",\"sequenceImgUrl\":\"\",\"gender\":0,\"isGBHistory\":0,\"privateOriginalFacePath\":\"imagemultiple/963714320825322881_face/963714320825322881_face.png?p=imagemultiple,321420967-69df5995b3efc17d1bc60e5a,0,6987\",\"mainVideoSourceId\":\"321420967\",\"deviceId\":\"321420967\",\"privateOriginalImagesPath\":\"\",\"privateOriginalOriginalImage\":\"/image/005394d6e8c65d1d4ccef3cc74a38ca3/609bd0decf98422e8f2989347e9c4c42.jpg\",\"videoUrl\":\"\",\"downloadPath\":\"\",\"angle\":-1,\"hasBike\":false,\"totalFrame\":0,\"startTime\":\"2026-04-15 17:25:41\",\"originalImage\":\"/gait-boot/v1/file/feature/image/005394d6e8c65d1d4ccef3cc74a38ca3/609bd0decf98422e8f2989347e9c4c42.jpg?rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825322881&casid=&typ=0\",\"featureId\":\"963714320825322881____3__321420967__1776245141__\",\"reidRect\":[],\"faceSize\":0,\"zipUrl\":\"\",\"sourceIdentify\":\"321420967\",\"privateOriginalVideoSourceName\":\"/image/005394d6e8c65d1d4ccef3cc74a38ca3/609bd0decf98422e8f2989347e9c4c42.jpg\",\"targetType\":2,\"version\":8,\"mainImage\":\"/gait-boot/v1/file/feature/imagemultiple/963714320825322881_face/963714320825322881_face.png?p=imagemultiple,321420967-69df5995b3efc17d1bc60e5a,0,6987&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825322881&casid=&typ=0\",\"sequenceCount\":0,\"dayNight\":0,\"sourceType\":3,\"regionId\":\"38b3eff8baf56627478ec76a704e9b52\",\"createTime\":\"2026-04-15 17:25:41\",\"videoSourceName\":\"609bd0decf98422e8f2989347e9c4c42.jpg\",\"realTargetType\":2,\"originalGender\":0,\"facePath\":\"/gait-boot/v1/file/feature/imagemultiple/963714320825322881_face/963714320825322881_face.png?p=imagemultiple,321420967-69df5995b3efc17d1bc60e5a,0,6987&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825322881&casid=&typ=0\",\"faceRect\":[295,308,423,473],\"nodeId\":\"69a58c93b3efc17a5c231d8f\",\"previewImage\":\"\"}],\"success\":true}}', 0, NULL, '2026-04-15 17:27:36', 51057, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (284, '上传图片同步解析', 1, 'com.ruoyi.web.controller.system.PersonController.imageAnalysis()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/imageAnalysis', '127.0.0.1', '内网IP', '{\"imageBase64\":\"iVBORw0KGgoAAAANSUhEUgAAAscAAASJCAIAAAC7FiZfAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAgAElEQVR4nOy9W5skuZEldo4ZPDKrq7qHHDY5MzujfdCnlX6VnvXpf2sftJwl2d1VlRkRDjM9GACHXyPy0kVyRuj6siM8/ALHxXDs2AX8P/+v/1vFT8n++fc//tf/8vv//X/7X//bf/s/fvfb36XhkaJgwry4AyBp5/PPP//0l3//85//x09//vNPP3/+8nS+jM/n8Zp9vOJ8OecxX8c8juN4vV7HnMdsZu4+juPlcsk5X2sZxxGAdyWeQfJ0On38+OnTx+8/fvz44cPH0+n0+PjhdDr99tMPHz58R/Djdx9JPj4+DsMAQFXNxpxz9myWr5drPOjp6Wk8Pz8/P5/P569PX56+fjk/n79+/Xo+ny+X53y95uuYs8MxXi9mOedsZtlGu445X81HG0uVzbJ7jodkeDYzitnobu5uZgCchAsAd5qzNp6BDjgAQOBCEpBoVxEBQAIAqe6wDACO7O7mbm4Gd581VLRV+9B1k9cPhp1Sbr9RCMIBpziZUjo9PHz48PHx43cfvvvu06cf0ml4fHx8fHgY0qCqKSURUVWS0QLxN+eccx7H0cY8juPz8/Pz8/PT09PlfD4/l764Xq85X1u7tZqTjM/xYfVSTlh/BIimnRoE5v2t2ogSEZIYNI7HV3eXWtpp8VlQ+m9xH8wPLj/LXqvPTnuXsrjhYiTsPVSwW42DGu795IDD4QAYA6CMSXd3g8NtWfop377uPaJ/KQXj3u1BAMx9tExSvE0HZ+2sQf23P3z813/54d/+8Jvf/vDwYcDjgEF9UH980A+DPuhwSnwc9KRMSqUDxiRQjoLL8/X85fnr56frOQvl4TQ8PpweHh9ESRG6mNMdebTsNtp4yXk0WBZz5uzny/j1+fL5y9NPP/3yx3//0+ev58uYDW5mTnHoiDQasyOb5zzmbDnneIWuQdjkQ/nqBEAnWCZy96NTjHRS4BLSBhBADJ6RM+jO0ZiB7DTADYZUhY+T2nc6sT+g90cFyZg8tafMzBwWohJO+IZAi1lfZp9ITNL4mpKqlnkaAqefs23us5Y6pzFdJhLySlRUGTeJM9sN44iuJkgvfzZHZt8U62m4ltLlONCWiM2rbtYhWrgctzIQ1rfaq1v72tqwP97/3RMvi0tSdNXDST59//3vf/9P//Iv/+UffviHdDoRgi25ExWLFfX5+fn569cvv3z++vXr8/Pz5ZrP5/FyzdcRl/NlHHPO+Xodx3GMz4En6oISK0qOn6NRmrhpL6mq33347uPH7z99+vT4+N3j4+Pj44fHx8evHz9//+n77z99TzBGTEAKESlL0erd50N/Y4VYnLx3/KBN31y4s8zvXzAfBzv33Kmz+04X0+H9L601OC/SlXaOiJhZ/GpmIgLxmLQBQfI49letn775efFKd7/+f7ryKw/Ro+eaO2LB6A4ulo0eUvT4o18S1jef9bKjyujZnenwDnYTvYDkOI6X8/VyHa/j8JA0O8TB0a7iSqdbICNTDCoCAwwjXXAlLufx6eny9evl+fkKR1J9fDg9Po5pSCmpcqAIXHJ2B8w1Z1zNcsY45vN1fHq6fP7y/MvnLz//8uXr8/V6ze4wwLy0j5kF/sjm2TwUMIs3YUH5q3nhgISSQjj7KRFwaqebotnMPRQed5qbgZbdZsBlJhwI2Ztoe6Ky/CScOjk0AbPopg000WsFdXb3CgYJd1PVGDwNefTrZWgIPRYRYUoWIiilNI5jSoGfBMgBJtoj+hF4z1RaiKD1Jf2avfkTSXCpTb30/t2Fy8rvzambr7O+w+at1tVLIjIMw/fff/fp4/d/+Kd/+sff/u7x8QNJTEraurhqEjkNw6noHTmHwGABIzFkLOc8joWPiBOv18v5/Hw+XwJJLMRKr3xE/XLOAUuu1+sw5IAnoQe3zw2OkEVPWvfB', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"data\":[{\"keyframes\":false,\"privateOriginalPreviewImage\":\"\",\"sequenceImgUrl\":\"\",\"gender\":0,\"isGBHistory\":0,\"privateOriginalFacePath\":\"imagemultiple/963714320825322881_face/963714320825322881_face.png?p=imagemultiple,321420967-69df5995b3efc17d1bc60e5a,0,6987\",\"mainVideoSourceId\":\"321420967\",\"deviceId\":\"321420967\",\"privateOriginalImagesPath\":\"\",\"privateOriginalOriginalImage\":\"/image/005394d6e8c65d1d4ccef3cc74a38ca3/609bd0decf98422e8f2989347e9c4c42.jpg\",\"videoUrl\":\"\",\"downloadPath\":\"\",\"angle\":-1,\"hasBike\":false,\"totalFrame\":0,\"startTime\":\"2026-04-15 17:25:41\",\"originalImage\":\"/gait-boot/v1/file/feature/image/005394d6e8c65d1d4ccef3cc74a38ca3/609bd0decf98422e8f2989347e9c4c42.jpg?rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825322881&casid=&typ=0\",\"featureId\":\"963714320825322881____3__321420967__1776245141__\",\"reidRect\":[],\"faceSize\":0,\"zipUrl\":\"\",\"sourceIdentify\":\"321420967\",\"privateOriginalVideoSourceName\":\"/image/005394d6e8c65d1d4ccef3cc74a38ca3/609bd0decf98422e8f2989347e9c4c42.jpg\",\"targetType\":2,\"version\":8,\"mainImage\":\"/gait-boot/v1/file/feature/imagemultiple/963714320825322881_face/963714320825322881_face.png?p=imagemultiple,321420967-69df5995b3efc17d1bc60e5a,0,6987&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825322881&casid=&typ=0\",\"sequenceCount\":0,\"dayNight\":0,\"sourceType\":3,\"regionId\":\"38b3eff8baf56627478ec76a704e9b52\",\"createTime\":\"2026-04-15 17:25:41\",\"videoSourceName\":\"609bd0decf98422e8f2989347e9c4c42.jpg\",\"realTargetType\":2,\"originalGender\":0,\"facePath\":\"/gait-boot/v1/file/feature/imagemultiple/963714320825322881_face/963714320825322881_face.png?p=imagemultiple,321420967-69df5995b3efc17d1bc60e5a,0,6987&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825322881&casid=&typ=0\",\"faceRect\":[295,308,423,473],\"nodeId\":\"69a58c93b3efc17a5c231d8f\",\"previewImage\":\"\"}],\"success\":true}}', 0, NULL, '2026-04-15 17:33:51', 12423, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (285, '绑定底库人员特征', 1, 'com.ruoyi.web.controller.system.PersonController.monitorBindFeature()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/monitorBindFeature', '127.0.0.1', '内网IP', '{\"featureIds\":[\"963714320825322881____3__321420967__1776245141__\"],\"gaitIDs\":[],\"monitorId\":\"69df4f72b3efc17c8d04bab6\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"success\":true}}', 0, NULL, '2026-04-15 17:40:54', 5177, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (286, '上传图片同步解析', 1, 'com.ruoyi.web.controller.system.PersonController.imageAnalysis()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/imageAnalysis', '127.0.0.1', '内网IP', '{\"imageBase64\":\"iVBORw0KGgoAAAANSUhEUgAAA2YAAAKFCAIAAAAoEG0xAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAgAElEQVR4nNS8d5Bcx30u2umEyXFnNucILNLuImeAAQABUiSYJUqyAq3gJzmpVE/3vvtsle3ytWzXtSVZokSRChQpkgAYkROJnBbYnHPe2cn5hO5+f5zZBahkWnbVfbdrazDYPXPO6Z7Tv9/X3/f9GuYVVAAAOOeAA845AIBxBgCAAECIwEebTnUAAIIIodyfIIQQwaX34A9tGCGEMYIwm0mrioIgR4AjBDFGBCNVyXCqCQRhAiRCMIKEEEIIxpgQAQLAAeMccM4YY5xxADiEAHAOIYAQAg4gZ5BzyBjg7N7rSpKcSCQcdntZeVk8FuecM84Y1xnQOefGsACEOSecSRxIHGDGwPT0jKIqD+y5//GnD+pc7RvoI4T8ru5DyBEAGHIMAUEAQogx4pxSqjKuAUBtNpPFYq6prTl79uJffuOfq0psxQVuBDBGGEKoKEo0GrFYLF5vHge8pLhYVTXOKeQccB0yChj9g4f9D26cM+NpMV7/3WYMzr0f4Sz3QYhgbugg4IAzABhgHHIAAOAQAAgAMl4xFiVJQojMBULTs8Gp6blITNMop5xDBO0Oh81mLSwpmZiYyChZjzcPIwgRJAAM9g7uqGuA4bjf6TbbbVcGuuV8f4zpUSUTjcQAgAAAiBAAUKM0GY+787ylZaUmsxlBmEqmBgb67XZ7fV1dOpUeGh7WNJ1yYHe544k0Y9zldmezWUop1XVN0wCEXo/XZreVlZZ2dHQkEkmPx+Nw2KPRKGM0Mj9dVrMMQjg1Nc0YtVptkiytbVnb3d0VDIVS0RDExOsv0HU9MDlidfsFQaiqqkYIdXS0E0JWrlhRUlama7Ttdrvd4WxqXjc1OWW1WYPBYH9f/+rVK0VJ7uzsNJlMHTcvHXz2c6UlJXfu3JmcmpybnCwuLV3d3Nze3p5IJIuKCh0O5+pVqxLJ5Gs/+1lFba3b7UWIrFrddPXa9VAw+MCDe3t6ewILCwKBkcDc/oNPT01PXT1/3uHzaZRWVVU1Nja+d/hQPJnkEFXV1DzzzDPnz5/vHxhYvny51Wp1e9yBQOAXL71U07BM1TRVVRoalg10dRaWlm7bsTOVSh4/fjwajRbk53u83oWF4NzcrNlsbm5qbmpuMsmmt157dWpuPqUoVpttx47tnR2dgdmZzVu22l3OwHxAUdWbN28+tOfBqpraZDI5NT194cMPVzQ2FhQVDg0Nq6qKIRwbHy8pLc5mMkPd7bLT3rRm9bLly81m8+TUlKooIyPDCGOMcCwWE0WhpamZU310ZNhiNg0PDOzctbOoqOinL79cUlq6f//+3p6e7p4eSRQZZ02rVkLArl29arWaEddLSoodDkcoGBobG8WYpNNpu93u8XiSySSCEABAmc4YBRAhBAkmnHNd1zVN4xxIokgwlk0mjCDTKdV1SZIwRJFQWFXVdCat6zrGmDPOOdN0yhmFEAoiETCCEDBOqa4jhCCEHHAEkRFYAAAYE4QQRBAhCCECEFDKKdUZYwAAhBAhBCEkSZKqqolEghCiaRqlFCGEEKKUYoQRRksxFiGUi4QcAAAJETAi6UzGJJsAQDrjDEAiillVE0SpsLAwGo0FAkGXy51RshxCygAAMBKJqJrmdrvzvHndvb1l5eXPPvtsOBz5/ve/L4lifkFhOBQuLCyamZ11ux27dj1gsVhv3brV3t6ZzmSefebZcDj09ltv65q6fuPGlpa1c3OzR989jAX5kU8czC/IRwi/99778Vhs9Zo1c/PzwYVgX293bV1tQUGRoihtbW2ZTKawsJAIwpbNW86cOWOz27761a9Go9HXXnttamrKJJvC4bDT5crLyyssKFjTtEYSpUgk8vbbb8/Nzm7fuTPP6z36zqs2h/9PvvZnqqp++OGHHR0dwWDQarOVFBcXFRVdvny5rr7+', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"data\":[{\"keyframes\":false,\"privateOriginalPreviewImage\":\"\",\"sequenceImgUrl\":\"\",\"gender\":0,\"isGBHistory\":0,\"privateOriginalFacePath\":\"imagemultiple/963714320825323905_face/963714320825323905_face.png?p=imagemultiple,967768409-69df6101b3efc17d1bc60e5b,0,5859\",\"mainVideoSourceId\":\"967768409\",\"deviceId\":\"967768409\",\"privateOriginalImagesPath\":\"\",\"privateOriginalOriginalImage\":\"/image/ba3b3c5bbcad1afa0030f097876c04d6/785811d2db8f448186973fb344be5f42.jpg\",\"videoUrl\":\"\",\"downloadPath\":\"\",\"angle\":-1,\"hasBike\":false,\"totalFrame\":0,\"startTime\":\"2026-04-15 17:57:21\",\"originalImage\":\"/gait-boot/v1/file/feature/image/ba3b3c5bbcad1afa0030f097876c04d6/785811d2db8f448186973fb344be5f42.jpg?rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825323905&casid=&typ=0\",\"featureId\":\"963714320825323905____3__967768409__1776247041__\",\"reidRect\":[],\"faceSize\":0,\"zipUrl\":\"\",\"sourceIdentify\":\"967768409\",\"privateOriginalVideoSourceName\":\"/image/ba3b3c5bbcad1afa0030f097876c04d6/785811d2db8f448186973fb344be5f42.jpg\",\"targetType\":2,\"version\":8,\"mainImage\":\"/gait-boot/v1/file/feature/imagemultiple/963714320825323905_face/963714320825323905_face.png?p=imagemultiple,967768409-69df6101b3efc17d1bc60e5b,0,5859&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825323905&casid=&typ=0\",\"sequenceCount\":0,\"dayNight\":0,\"sourceType\":3,\"regionId\":\"38b3eff8baf56627478ec76a704e9b52\",\"createTime\":\"2026-04-15 17:57:21\",\"videoSourceName\":\"785811d2db8f448186973fb344be5f42.jpg\",\"realTargetType\":2,\"originalGender\":0,\"facePath\":\"/gait-boot/v1/file/feature/imagemultiple/963714320825323905_face/963714320825323905_face.png?p=imagemultiple,967768409-69df6101b3efc17d1bc60e5b,0,5859&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320825323905&casid=&typ=0\",\"faceRect\":[425,95,547,232],\"nodeId\":\"69a58c93b3efc17a5c231d8f\",\"previewImage\":\"\"}],\"success\":true}}', 0, NULL, '2026-04-15 17:57:33', 23338, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (287, '绑定底库人员特征', 1, 'com.ruoyi.web.controller.system.PersonController.monitorBindFeature()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/monitorBindFeature', '127.0.0.1', '内网IP', '{\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"monitorId\":\"69df4f72b3efc17c8d04bab6\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"success\":true}}', 0, NULL, '2026-04-15 17:59:21', 1170, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (288, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2023-04-15 18:00:00\",\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"ignoreFeatureIds\":[\"\"],\"isMonitor\":false,\"page\":1,\"size\":20,\"sourceIds\":[\"10\"],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:08:08', 503, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (289, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2023-04-15 18:00:00\",\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"ignoreFeatureIds\":[\"\"],\"isMonitor\":false,\"page\":1,\"size\":20,\"sourceIds\":[],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:08:50', 559, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (290, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2023-04-15 18:00\",\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"ignoreFeatureIds\":[\"\"],\"isMonitor\":false,\"page\":1,\"size\":20,\"sourceIds\":[],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:09:29', 121, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (291, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2023-04-15 18:00\",\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"ignoreFeatureIds\":[\"\"],\"isMonitor\":false,\"page\":1,\"size\":20,\"sourceIds\":[],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:11:02', 72811, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (292, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2026-04-15 18:00\",\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"ignoreFeatureIds\":[\"\"],\"isMonitor\":false,\"page\":1,\"size\":20,\"sourceIds\":[],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:11:13', 4073, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (293, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2026-04-15 18:00\",\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"ignoreFeatureIds\":[\"\"],\"isMonitor\":false,\"page\":1,\"size\":20,\"sourceIds\":[],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:12:59', 86860, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (294, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2026-04-15 18:00\",\"faceThd\":0.75,\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"ignoreFeatureIds\":[\"\"],\"isMonitor\":true,\"page\":1,\"reidThd\":0.75,\"size\":20,\"sourceIds\":[\"10\"],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:16:21', 3423, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (295, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2026-04-15 18:00\",\"faceThd\":0.75,\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"ignoreFeatureIds\":[\"\"],\"isMonitor\":true,\"page\":1,\"reidThd\":0.75,\"size\":20,\"sourceIds\":[\"10\"],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:17:46', 3433, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (296, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2026-04-15 18:00\",\"faceThd\":0.75,\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"ignoreFeatureIds\":[\"\"],\"isMonitor\":true,\"page\":1,\"reidThd\":0.75,\"size\":20,\"sourceIds\":[\"638290461\"],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:18:17', 136, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (297, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2026-04-15 18:00\",\"faceThd\":0.75,\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"gaitThd\":0.7,\"ignoreFeatureIds\":[\"\"],\"isMonitor\":true,\"page\":1,\"reidThd\":0.75,\"size\":20,\"sourceIds\":[\"638290461\"],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00\",\"topN\":10} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"服务异常 [参数错误！]\",\"code\":\"SERVICE_ERROR\",\"success\":false}}', 0, NULL, '2026-04-15 18:25:46', 140, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (298, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2026-04-15 18:00:00\",\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitThd\":0.7,\"isMonitor\":false,\"page\":1,\"size\":20,\"sourceIds\":[],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00:00\",\"topN\":100} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"data\":{\"gaitCount\":88,\"reidCount\":92,\"page\":{\"records\":[{\"keyframes\":false,\"isGBHistory\":0,\"deviceId\":\"687327101\",\"hasBike\":false,\"totalFrame\":88,\"longitude\":116.34282980975641,\"anglesArr\":[-100],\"zipUrl\":\"http://192.168.1.49:82/gait-boot/v1/file/feature/20260415-multiple/963714320826115073_images/963714320826115073_images.zip?t=mp4&p=20260415-multiple,69df3aeab3efc17d1bc60e56,164457446,164710569&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320826115073&casid=&typ=0\",\"version\":8,\"sequenceCount\":88,\"sourceType\":0,\"gaitSim\":0.0,\"videoSourceName\":\"192.168.1.12\",\"realTargetType\":103,\"originalGender\":1,\"facePath\":\"http://192.168.1.49:82/gait-boot/v1/file/feature/20260415-multiple/963714320826115073_face/963714320826115073_face.png?p=20260415-multiple,69df3aeab3efc17d1bc60e56,164783677,164802874&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320826115073&casid=&typ=0\",\"nodeId\":\"69a58c93b3efc17a5c231d8f\",\"reidSim\":0.0,\"privateOriginalPreviewImage\":\"20260415-multiple/963714320826115073_preview/963714320826115073_preview.png?p=20260415-multiple,69df3aeab3efc17d1bc60e56,164710570,164783676\",\"gender\":1,\"privateOriginalFacePath\":\"20260415-multiple/963714320826115073_face/963714320826115073_face.png?p=20260415-multiple,69df3aeab3efc17d1bc60e56,164783677,164802874\",\"latitude\":39.97525167545353,\"mainVideoSourceId\":\"687327101\",\"sequenceVideoUrl\":\"http://192.168.1.49:82/gait-boot/v1/file/feature/20260415-multiple/963714320826115073_images/all.mp4?t=mp4&p=20260415-multiple,69df3aeab3efc17d1bc60e56,164457446,164710569&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320826115073&casid=&typ=1\",\"privateOriginalImagesPath\":\"20260415-multiple/963714320826115073_images/963714320826115073_images.zip?t=mp4&p=20260415-multiple,69df3aeab3efc17d1bc60e56,164457446,164710569\",\"videoUrl\":\"http://192.168.1.49:82/gait-boot/v1/file/feature/20260415-multi', 0, NULL, '2026-04-15 18:26:10', 201, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (299, '和抓拍比对', 1, 'com.ruoyi.web.controller.system.PersonController.snapComparison()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/snapComparison', '127.0.0.1', '内网IP', '{\"endTime\":\"2026-04-15 18:00:00\",\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitThd\":0.7,\"isMonitor\":false,\"page\":1,\"size\":20,\"sourceIds\":[],\"sourceType\":10,\"startTime\":\"2026-04-15 15:00:00\",\"topN\":100} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"data\":{\"gaitCount\":88,\"reidCount\":92,\"page\":{\"records\":[{\"keyframes\":false,\"isGBHistory\":0,\"deviceId\":\"687327101\",\"hasBike\":false,\"totalFrame\":88,\"longitude\":116.34282980975641,\"anglesArr\":[-100],\"zipUrl\":\"http://192.168.1.49:82/gait-boot/v1/file/feature/20260415-multiple/963714320826115073_images/963714320826115073_images.zip?t=mp4&p=20260415-multiple,69df3aeab3efc17d1bc60e56,164457446,164710569&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320826115073&casid=&typ=0\",\"version\":8,\"sequenceCount\":88,\"sourceType\":0,\"gaitSim\":0.0,\"videoSourceName\":\"192.168.1.12\",\"realTargetType\":103,\"originalGender\":1,\"facePath\":\"http://192.168.1.49:82/gait-boot/v1/file/feature/20260415-multiple/963714320826115073_face/963714320826115073_face.png?p=20260415-multiple,69df3aeab3efc17d1bc60e56,164783677,164802874&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320826115073&casid=&typ=0\",\"nodeId\":\"69a58c93b3efc17a5c231d8f\",\"reidSim\":0.0,\"privateOriginalPreviewImage\":\"20260415-multiple/963714320826115073_preview/963714320826115073_preview.png?p=20260415-multiple,69df3aeab3efc17d1bc60e56,164710570,164783676\",\"gender\":1,\"privateOriginalFacePath\":\"20260415-multiple/963714320826115073_face/963714320826115073_face.png?p=20260415-multiple,69df3aeab3efc17d1bc60e56,164783677,164802874\",\"latitude\":39.97525167545353,\"mainVideoSourceId\":\"687327101\",\"sequenceVideoUrl\":\"http://192.168.1.49:82/gait-boot/v1/file/feature/20260415-multiple/963714320826115073_images/all.mp4?t=mp4&p=20260415-multiple,69df3aeab3efc17d1bc60e56,164457446,164710569&rid=38b3eff8baf56627478ec76a704e9b52&nid=69a58c93b3efc17a5c231d8f&fid=963714320826115073&casid=&typ=1\",\"privateOriginalImagesPath\":\"20260415-multiple/963714320826115073_images/963714320826115073_images.zip?t=mp4&p=20260415-multiple,69df3aeab3efc17d1bc60e56,164457446,164710569\",\"videoUrl\":\"http://192.168.1.49:82/gait-boot/v1/file/feature/20260415-multi', 0, NULL, '2026-04-15 18:26:50', 247, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (300, '绑定底库人员特征', 1, 'com.ruoyi.web.controller.system.PersonController.monitorBindFeature()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/monitorBindFeature', '127.0.0.1', '内网IP', '{\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"monitorId\":\"69df4f72b3efc17c8d04bab6\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"success\":true}}', 0, NULL, '2026-04-16 15:36:20', 619, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (301, '绑定底库人员特征', 1, 'com.ruoyi.web.controller.system.PersonController.monitorBindFeature()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/monitorBindFeature', '127.0.0.1', '内网IP', '{\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"monitorId\":\"69df4f72b3efc17c8d04bab6\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"success\":true}}', 0, NULL, '2026-04-16 15:38:06', 44902, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (302, '绑定底库人员特征', 1, 'com.ruoyi.web.controller.system.PersonController.monitorBindFeature()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/monitorBindFeature', '127.0.0.1', '内网IP', '{\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"monitorId\":\"69df4f72b3efc17c8d04bab6\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"success\":true}}', 0, NULL, '2026-04-16 15:39:12', 63803, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (303, '绑定底库人员特征', 1, 'com.ruoyi.web.controller.system.PersonController.monitorBindFeature()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/monitorBindFeature', '127.0.0.1', '内网IP', '{\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"monitorId\":\"69df4f72b3efc17c8d04bab6\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"success\":true}}', 0, NULL, '2026-04-16 15:51:21', 678952, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (304, '绑定底库人员特征', 1, 'com.ruoyi.web.controller.system.PersonController.monitorBindFeature()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/monitorBindFeature', '127.0.0.1', '内网IP', '{\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"monitorId\":\"69df4f72b3efc17c8d04bab6\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"success\":true}}', 0, NULL, '2026-04-16 15:54:15', 19733, 'PLATFORM-A01');
INSERT INTO `sys_oper_log` VALUES (305, '绑定底库人员特征', 1, 'com.ruoyi.web.controller.system.PersonController.monitorBindFeature()', 'POST', 1, 'admin', '研发部门', '/cosl/api/person/monitorBindFeature', '127.0.0.1', '内网IP', '{\"featureIds\":[\"963714320825323905____3__967768409__1776247041__\"],\"gaitIDs\":[],\"monitorId\":\"69df4f72b3efc17c8d04bab6\"} ', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"msg\":\"请求成功\",\"code\":\"SUCCESS\",\"success\":true}}', 0, NULL, '2026-04-16 18:40:00', 14089, 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NULL DEFAULT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'captain', '船长', 1, '0', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (2, 'chief ', '轮机长', 2, '0', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (3, 'deckhand', '甲板工', 3, '0', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (4, 'machinist', '机工', 4, '0', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (5, 'electrician', '电工', 5, '0', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (6, 'outsourcing', '外协', 6, '0', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (7, 'safety', '安全员', 7, '0', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (8, 'chef', '厨师', 8, '0', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (9, 'doctor', '医务人员', 9, '0', 'admin', '2026-03-05 22:17:41', '', NULL, '', 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (10, 'technician', '技术员', 10, '0', 'admin', '2026-03-05 22:17:41', '', NULL, NULL, 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (11, 'text', '水手', NULL, '0', 'admin', '2026-04-14 14:56:51', '', NULL, NULL, 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (12, NULL, '新岗位', NULL, '0', 'admin', '2026-04-15 15:28:01', '', NULL, NULL, 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (13, NULL, '新岗位', NULL, '0', 'admin', '2026-04-15 16:07:57', '', NULL, NULL, 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (14, NULL, '新岗位', NULL, '0', 'admin', '2026-04-15 16:29:46', '', NULL, NULL, 'PLATFORM-A01');
INSERT INTO `sys_post` VALUES (15, NULL, '新岗位', NULL, '0', 'admin', '2026-04-15 16:30:38', '', NULL, NULL, 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL, '超级管理员', 'PLATFORM-A01');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2026-03-05 22:17:41', '', NULL, '普通角色', 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100, 'PLATFORM-A01');
INSERT INTO `sys_role_dept` VALUES (2, 101, 'PLATFORM-A01');
INSERT INTO `sys_role_dept` VALUES (2, 105, 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 2, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 3, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 4, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 100, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 101, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 102, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 103, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 104, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 105, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 106, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 107, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 108, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 109, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 110, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 111, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 112, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 113, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 114, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 115, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 116, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 500, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 501, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1000, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1001, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1002, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1003, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1004, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1005, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1006, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1007, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1008, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1009, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1010, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1011, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1012, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1013, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1014, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1015, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1016, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1017, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1018, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1019, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1020, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1021, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1022, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1023, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1024, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1025, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1026, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1027, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1028, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1029, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1030, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1031, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1032, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1033, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1034, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1035, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1036, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1037, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1038, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1039, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1040, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1041, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1042, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1043, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1044, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1045, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1046, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1047, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1048, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1049, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1050, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1051, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1052, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1053, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1054, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1055, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1056, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1057, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1058, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1059, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1060, 'PLATFORM-A01');
INSERT INTO `sys_role_menu` VALUES (2, 1061, 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2026-04-17 10:42:44', NULL, 'admin', '2026-03-05 22:17:41', '', NULL, '管理员', 'PLATFORM-A01');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', NULL, NULL, 'admin', '2026-03-05 22:17:41', '', NULL, '测试员', 'PLATFORM-A01');
INSERT INTO `sys_user` VALUES (100, NULL, 'test', '测试', '00', '', '13666663333', '0', '', 'ba3191792f8b5c3d255ddae5f78c1b6e', 'be1d7b', '0', '0', '', NULL, '2026-03-07 11:04:15', 'admin', '2026-03-07 11:04:14', '', NULL, NULL, 'PLATFORM-A01');
INSERT INTO `sys_user` VALUES (101, NULL, 'kaihang', '凯航', '00', '', '13899995555', '0', '', '452d76a1b03d0242da919d993720f9a8', '131523', '0', '0', '', NULL, '2026-03-07 11:08:20', 'admin', '2026-03-07 11:08:19', '', NULL, NULL, 'PLATFORM-A01');
INSERT INTO `sys_user` VALUES (102, NULL, 'wukong', '李悟空', '00', '', '13712347896', '0', '', '60855e0fbfac206ebabc11f5e2dc876a', '6f6f06', '1', '0', '', NULL, '2026-03-07 12:46:52', 'admin', '2026-03-07 11:12:58', 'admin', '2026-03-07 12:46:52', NULL, 'PLATFORM-A01');
INSERT INTO `sys_user` VALUES (103, NULL, 'wykong', '让人悟空', '00', '', '13788888888', '0', '', 'f21ee208d40dc594778541e63ceb1325', 'bf560e', '0', '2', '', NULL, '2026-03-07 12:05:10', 'admin', '2026-03-07 12:05:10', '', NULL, NULL, 'PLATFORM-A01');
INSERT INTO `sys_user` VALUES (104, NULL, 'fdgs', '风格', '00', '', '13767888888', '0', '', '2fd481ba9cf84f946a2b8f735c77e32e', '7839a5', '0', '2', '', NULL, '2026-03-07 12:05:37', 'admin', '2026-03-07 12:05:37', '', NULL, NULL, 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(0) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1, 'PLATFORM-A01');
INSERT INTO `sys_user_post` VALUES (2, 2, 'PLATFORM-A01');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `platform_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '钻井平台编号',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 'PLATFORM-A01');
INSERT INTO `sys_user_role` VALUES (2, 2, 'PLATFORM-A01');
INSERT INTO `sys_user_role` VALUES (100, 2, 'PLATFORM-A01');
INSERT INTO `sys_user_role` VALUES (101, 2, 'PLATFORM-A01');
INSERT INTO `sys_user_role` VALUES (102, 2, 'PLATFORM-A01');

SET FOREIGN_KEY_CHECKS = 1;
