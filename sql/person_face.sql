-- ----------------------------
-- Table structure for person_face
-- ----------------------------
DROP TABLE IF EXISTS `person_face`;
CREATE TABLE `person_face` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `person_id` bigint(20) NOT NULL COMMENT '人员 ID',
  `image_url` varchar(255) DEFAULT NULL COMMENT '图片 URL',
  `feature_data` blob COMMENT '特征数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_person` (`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='人员人脸表';

-- ----------------------------
-- Records of person_face
-- ----------------------------
INSERT INTO `person_face` VALUES ('1', '1001', '/profile/upload/2026/03/13/face_001.jpg', 0x1234567890ABCDEF, NOW());
INSERT INTO `person_face` VALUES ('2', '1002', '/profile/upload/2026/03/13/face_002.jpg', 0xFEDCBA0987654321, NOW());
INSERT INTO `person_face` VALUES ('3', '1003', '/profile/upload/2026/03/13/face_003.jpg', 0xABCDEF1234567890, NOW());
