-- ----------------------------
-- Table structure for drill
-- ----------------------------
DROP TABLE IF EXISTS `drill`;
CREATE TABLE `drill`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '演练名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `expected_count` int(11) NULL DEFAULT NULL COMMENT '预期人数',
  `actual_count` int(11) NULL DEFAULT NULL COMMENT '实际人数',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0 代表存在 1 代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name` (`name` ASC) USING BTREE,
  INDEX `idx_status` (`status` ASC) USING BTREE,
  INDEX `idx_create_time` (`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '演练表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drill
-- ----------------------------
INSERT INTO `drill` VALUES (1, '消防演练', '2026-03-15 09:00:00', '2026-03-15 11:00:00', 100, 95, 'completed', NOW(), '', NOW(), 0);
INSERT INTO `drill` VALUES (2, '地震应急演练', '2026-03-20 14:00:00', '2026-03-20 16:00:00', 200, 0, 'planned', NOW(), '', NOW(), 0);
INSERT INTO `drill` VALUES (3, '网络安全演练', '2026-03-25 10:00:00', '2026-03-25 12:00:00', 50, 0, 'planned', NOW(), '', NOW(), 0);
