-- ----------------------------
-- Table structure for person_gait
-- ----------------------------
DROP TABLE IF EXISTS `person_gait`;
CREATE TABLE `person_gait` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `person_id` bigint(20) DEFAULT NULL COMMENT '人员 ID',
  `camera_id` bigint(20) DEFAULT NULL COMMENT '摄像头 ID',
  `gait_image_url` varchar(255) DEFAULT NULL COMMENT '步态图片 URL',
  `silhouette_url` varchar(255) DEFAULT NULL COMMENT '剪影 URL',
  `capture_time` datetime DEFAULT NULL COMMENT '抓拍时间',
  PRIMARY KEY (`id`),
  KEY `idx_person_time` (`person_id`,`capture_time`) USING BTREE,
  KEY `idx_time` (`capture_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='人员步态表';

-- ----------------------------
-- Records of person_gait
-- ----------------------------
INSERT INTO `person_gait` VALUES ('1', '1001', '1', '/profile/upload/2026/03/13/gait_001.jpg', '/profile/upload/2026/03/13/silhouette_001.jpg', NOW());
INSERT INTO `person_gait` VALUES ('2', '1002', '2', '/profile/upload/2026/03/13/gait_002.jpg', '/profile/upload/2026/03/13/silhouette_002.jpg', NOW());
INSERT INTO `person_gait` VALUES ('3', '1003', '1', '/profile/upload/2026/03/13/gait_003.jpg', '/profile/upload/2026/03/13/silhouette_003.jpg', NOW());
INSERT INTO `person_gait` VALUES ('4', '1001', '3', '/profile/upload/2026/03/13/gait_004.jpg', '/profile/upload/2026/03/13/silhouette_004.jpg', NOW());
INSERT INTO `person_gait` VALUES ('5', '1002', '2', '/profile/upload/2026/03/13/gait_005.jpg', '/profile/upload/2026/03/13/silhouette_005.jpg', NOW());
