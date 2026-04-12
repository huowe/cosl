-- ----------------------------
-- Table structure for floor_config
-- ----------------------------
DROP TABLE IF EXISTS `floor_config`;
CREATE TABLE `floor_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '楼层配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of floor_config
-- ----------------------------
INSERT INTO `floor_config` VALUES (1, '1', 'L1', 1, 'ACTIVE', NULL, 'admin', NOW(), 'admin', NOW(), 0);
INSERT INTO `floor_config` VALUES (2, '2', 'L2', 2, 'ACTIVE', NULL, 'admin', NOW(), 'admin', NOW(), 0);
INSERT INTO `floor_config` VALUES (3, '3', 'L3', 3, 'ACTIVE', NULL, 'admin', NOW(), 'admin', NOW(), 0);
INSERT INTO `floor_config` VALUES (4, '4', 'L4', 4, 'ACTIVE', NULL, 'admin', NOW(), 'admin', NOW(), 0);