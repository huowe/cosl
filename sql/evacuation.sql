-- ----------------------------
-- Table structure for evacuation
-- ----------------------------
DROP TABLE IF EXISTS `evacuation`;
CREATE TABLE `evacuation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '撤离事件名称',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '撤离类型（FIRE:火灾，COLLISION:碰撞，GAS_LEAK:气体泄漏，ABANDON_SHIP:弃船，OTHER:其他）',
  `alarm_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '警报级别（LEVEL1:一级，LEVEL2:二级，LEVEL3:三级）',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `expected_count` int(11) NULL DEFAULT NULL COMMENT '预计撤离人数',
  `actual_count` int(11) NULL DEFAULT NULL COMMENT '实际撤离人数',
  `assembly_point` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集合点位置',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（PLANNED:计划中，ACTIVE:进行中，COMPLETED:已完成，CANCELLED:已取消）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name` (`name` ASC) USING BTREE,
  INDEX `idx_type` (`type` ASC) USING BTREE,
  INDEX `idx_status` (`status` ASC) USING BTREE,
  INDEX `idx_create_time` (`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '紧急撤离事件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evacuation
-- ----------------------------
INSERT INTO `evacuation` VALUES (1, '春季消防演习撤离', 'FIRE', 'LEVEL2', '2026-03-20 09:00:00', '2026-03-20 11:00:00', 100, 98, '主甲板集合点', 'COMPLETED', '年度消防演习', NOW(), '', NOW());
INSERT INTO `evacuation` VALUES (2, '应急弃船演练', 'ABANDON_SHIP', 'LEVEL1', '2026-03-25 14:00:00', NULL, 150, 0, '救生艇甲板', 'PLANNED', '季度弃船演习', NOW(), '', NOW());

-- ----------------------------
-- Table structure for evacuation_record
-- ----------------------------
DROP TABLE IF EXISTS `evacuation_record`;
CREATE TABLE `evacuation_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `evacuation_id` bigint(20) NOT NULL COMMENT '撤离事件 ID',
  `person_id` bigint(20) NOT NULL COMMENT '人员 ID',
  `person_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `lifeboat_id` bigint(20) NULL DEFAULT NULL COMMENT '救生艇 ID',
  `lifeboat_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '救生艇编号',
  `seat_no` int(11) NULL DEFAULT NULL COMMENT '座位号',
  `arrive_time` datetime NULL DEFAULT NULL COMMENT '到达集合点时间',
  `board_time` datetime NULL DEFAULT NULL COMMENT '登艇时间',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（EVACUATED:已撤离，MISSING:失踪，INJURED:受伤）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_evacuation_id` (`evacuation_id` ASC) USING BTREE,
  INDEX `idx_person_id` (`person_id` ASC) USING BTREE,
  INDEX `idx_lifeboat_id` (`lifeboat_id` ASC) USING BTREE,
  INDEX `idx_status` (`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '紧急撤离人员记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evacuation_record
-- ----------------------------
INSERT INTO `evacuation_record` VALUES (1, 1, 1, '张三', 1, 'LB-001', 1, '2026-03-20 09:05:00', '2026-03-20 09:10:00', 'EVACUATED', '按时到达');
INSERT INTO `evacuation_record` VALUES (2, 1, 2, '李四', 1, 'LB-001', 2, '2026-03-20 09:06:00', '2026-03-20 09:11:00', 'EVACUATED', NULL);
INSERT INTO `evacuation_record` VALUES (3, 1, 3, '王五', 2, 'LB-002', 5, '2026-03-20 09:07:00', '2026-03-20 09:12:00', 'EVACUATED', NULL);
