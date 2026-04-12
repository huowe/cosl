-- ----------------------------
-- 房间统计数据初始化 SQL
-- ----------------------------

-- 插入测试房间数据
INSERT INTO `room_config` VALUES (1, 'A101', '1', 4, 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_config` VALUES (2, 'A102', '1', 4, 'OCCUPIED', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_config` VALUES (3, 'A103', '1', 2, 'LOCKED', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_config` VALUES (4, 'B201', '2', 6, 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_config` VALUES (5, 'B202', '2', 6, 'OCCUPIED', '', NOW(), '', NOW(), NULL);

-- 插入测试床位数据
-- A101 房间的床位（全空闲）
INSERT INTO `room_bed` VALUES (1, 1, 'A', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (2, 1, 'B', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (3, 1, 'C', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (4, 1, 'D', 'FREE', '', NOW(), '', NOW(), NULL);

-- A102 房间的床位（部分占用）
INSERT INTO `room_bed` VALUES (5, 2, 'A', 'OCCUPIED', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (6, 2, 'B', 'OCCUPIED', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (7, 2, 'C', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (8, 2, 'D', 'LOCKED', '', NOW(), '', NOW(), NULL);

-- A103 房间的床位（锁定）
INSERT INTO `room_bed` VALUES (9, 3, 'A', 'LOCKED', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (10, 3, 'B', 'LOCKED', '', NOW(), '', NOW(), NULL);

-- B201 房间的床位（全空闲）
INSERT INTO `room_bed` VALUES (11, 4, 'A', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (12, 4, 'B', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (13, 4, 'C', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (14, 4, 'D', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (15, 4, 'E', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (16, 4, 'F', 'FREE', '', NOW(), '', NOW(), NULL);

-- B202 房间的床位（部分占用）
INSERT INTO `room_bed` VALUES (17, 5, 'A', 'OCCUPIED', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (18, 5, 'B', 'OCCUPIED', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (19, 5, 'C', 'OCCUPIED', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (20, 5, 'D', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (21, 5, 'E', 'FREE', '', NOW(), '', NOW(), NULL);
INSERT INTO `room_bed` VALUES (22, 5, 'F', 'FREE', '', NOW(), '', NOW(), NULL);

-- ----------------------------
-- 预期统计结果
-- ----------------------------
-- 房间统计:
--   总房间数：5
--   空闲房间：2 (A101, B201)
--   锁定房间：1 (A103)
--   占用房间：2 (A102, B202)
--
-- 床位统计:
--   总床位数：22
--   空闲床位：11 (A101:4, A102:1, B201:6, B202:3)
--   锁定床位：3 (A102:1, A103:2)
--   占用床位：8 (A102:2, B202:3)
-- ----------------------------
