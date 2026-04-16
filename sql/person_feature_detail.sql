-- ----------------------------
-- 人员特征详情表
-- ----------------------------
DROP TABLE IF EXISTS `person_feature_detail`;
CREATE TABLE `person_feature_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `platform_no` varchar(50) DEFAULT NULL COMMENT '钻井平台编号',
  `monitor_id` varchar(100) NOT NULL COMMENT '底库人员id',
  `feature_id` varchar(100) NOT NULL COMMENT '特征id',
  `angle` int(11) DEFAULT NULL COMMENT '拍摄角度',
  `create_time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `device_id` varchar(100) DEFAULT NULL COMMENT '设备id',
  `face_path` longtext COMMENT '人脸图片base64',
  `master_original_image` longtext COMMENT '主控服务器特征预览图base64',
  `original_image` longtext COMMENT '特征预览图base64',
  `preview_image` longtext COMMENT '预览图base64',
  `sequence_count` int(11) DEFAULT NULL COMMENT '序列数量(帧数)',
  `sequence_img_url` longtext COMMENT '步态序列图base64',
  `sequence_video_url` varchar(500) DEFAULT NULL COMMENT '步态序列视频URL',
  `source_identify` varchar(100) DEFAULT NULL COMMENT '视频源ID',
  `source_type` int(11) DEFAULT NULL COMMENT '视频源类型(0:摄像头,1:离线视频)',
  `target_type` int(11) DEFAULT NULL COMMENT '特征类型(1:人体,2:人脸,7:步态等)',
  `video_source_name` varchar(200) DEFAULT NULL COMMENT '来源名称',
  `video_url` varchar(500) DEFAULT NULL COMMENT '视频片段URL',
  `zip_url` varchar(500) DEFAULT NULL COMMENT 'zip压缩URL',
  `record_create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志 0-未删除 1-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_monitor_id` (`monitor_id`),
  KEY `idx_feature_id` (`feature_id`),
  KEY `idx_platform_no` (`platform_no`),
  UNIQUE KEY `uk_monitor_feature` (`monitor_id`, `feature_id`, `deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='人员特征详情表';
