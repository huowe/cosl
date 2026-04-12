-- ----------------------------
-- 救生艇管理模块表结构
-- Date: 2026-03-31
-- ----------------------------

-- ----------------------------
-- Table structure for evacuation_point
-- ----------------------------
DROP TABLE IF EXISTS `evacuation_point`;
CREATE TABLE `evacuation_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `point_name` varchar(100) NOT NULL COMMENT '撤离点名称',
  `floor` varchar(10) DEFAULT NULL COMMENT '楼层',
  `x_axis` decimal(10,2) DEFAULT NULL COMMENT '地图坐标 X',
  `y_axis` decimal(10,2) DEFAULT NULL COMMENT '地图坐标 Y',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`),
  KEY `idx_point_name` (`point_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='撤离点表';

-- ----------------------------
-- Table structure for lifeboat_config
-- ----------------------------
DROP TABLE IF EXISTS `lifeboat_config`;
CREATE TABLE `lifeboat_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `boat_no` varchar(50) NOT NULL COMMENT '救生艇编号',
  `boat_name` varchar(100) DEFAULT NULL COMMENT '救生艇名称',
  `max_capacity` int(11) NOT NULL COMMENT '最大容量',
  `evacuation_point_id` bigint(20) DEFAULT NULL COMMENT '所属撤离点 ID',
  `status` varchar(20) DEFAULT 'ACTIVE' COMMENT '状态 ACTIVE/INACTIVE',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_boat_no` (`boat_no`) USING BTREE,
  KEY `idx_point` (`evacuation_point_id`) USING BTREE,
  CONSTRAINT `fk_lifeboat_point` FOREIGN KEY (`evacuation_point_id`) REFERENCES `evacuation_point` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='救生艇配置表';

-- ----------------------------
-- Table structure for lifeboat_seat
-- ----------------------------
DROP TABLE IF EXISTS `lifeboat_seat`;
CREATE TABLE `lifeboat_seat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lifeboat_id` bigint(20) NOT NULL COMMENT '救生艇 ID',
  `seat_no` varchar(20) NOT NULL COMMENT '座位号',
  `status` varchar(20) DEFAULT 'FREE' COMMENT 'FREE/OCCUPIED/LOCKED',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_boat_seat` (`lifeboat_id`,`seat_no`) USING BTREE,
  KEY `idx_boat` (`lifeboat_id`) USING BTREE,
  CONSTRAINT `fk_seat_lifeboat` FOREIGN KEY (`lifeboat_id`) REFERENCES `lifeboat_config` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='救生艇座位表';

-- ----------------------------
-- Table structure for lifeboat_person
-- ----------------------------
DROP TABLE IF EXISTS `lifeboat_person`;
CREATE TABLE `lifeboat_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `person_id` bigint(20) NOT NULL COMMENT '人员 ID',
  `lifeboat_id` bigint(20) NOT NULL COMMENT '救生艇 ID',
  `seat_id` bigint(20) DEFAULT NULL COMMENT '座位 ID',
  `assign_time` datetime DEFAULT NULL COMMENT '分配时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_person` (`person_id`) USING BTREE,
  KEY `idx_boat` (`lifeboat_id`) USING BTREE,
  KEY `idx_seat` (`seat_id`) USING BTREE,
  CONSTRAINT `fk_person_lifeboat` FOREIGN KEY (`lifeboat_id`) REFERENCES `lifeboat_config` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_person_seat` FOREIGN KEY (`seat_id`) REFERENCES `lifeboat_seat` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='救生艇人员表';

-- ----------------------------
-- Records of evacuation_point (示例数据)
-- ----------------------------
INSERT INTO `evacuation_point` VALUES 
(1, '一号撤离点', '1 层', 100.00, 200.00, '主甲板撤离点', NOW(), NOW(), 0),
(2, '二号撤离点', '2 层', 150.00, 250.00, '上层甲板撤离点', NOW(), NOW(), 0),
(3, '三号撤离点', '3 层', 180.00, 280.00, '驾驶台附近撤离点', NOW(), NOW(), 0);

-- ----------------------------
-- Records of lifeboat_config (示例数据)
-- ----------------------------
INSERT INTO `lifeboat_config` VALUES 
(1, 'LB-001', '救生艇 1 号', 50, 1, 'ACTIVE', '快速释放型', NOW(), NOW(), 0),
(2, 'LB-002', '救生艇 2 号', 50, 1, 'ACTIVE', '快速释放型', NOW(), NOW(), 0),
(3, 'LB-003', '救生艇 3 号', 30, 2, 'ACTIVE', '备用', NOW(), NOW(), 0),
(4, 'LB-004', '救生艇 4 号', 30, 3, 'INACTIVE', '维修中', NOW(), NOW(), 0);

-- ----------------------------
-- Records of lifeboat_seat (示例数据 - 为救生艇 1 号创建座位)
-- ----------------------------
INSERT INTO `lifeboat_seat` (`lifeboat_id`, `seat_no`, `status`, `create_time`, `update_time`) 
SELECT 1, CONCAT('S-', LPAD(num, 3, '0')), 'FREE', NOW(), NOW()
FROM (
  SELECT @row := @row + 1 AS num 
  FROM (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL 
        SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t1,
       (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL 
        SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t2,
       (SELECT @row := 0) t3
  LIMIT 50
) AS nums;

-- ----------------------------
-- Records of lifeboat_seat (示例数据 - 为救生艇 2 号创建座位)
-- ----------------------------
INSERT INTO `lifeboat_seat` (`lifeboat_id`, `seat_no`, `status`, `create_time`, `update_time`) 
SELECT 2, CONCAT('S-', LPAD(num, 3, '0')), 'FREE', NOW(), NOW()
FROM (
  SELECT @row := @row + 1 AS num 
  FROM (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL 
        SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t1,
       (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL 
        SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t2,
       (SELECT @row := 0) t3
  LIMIT 50
) AS nums;
