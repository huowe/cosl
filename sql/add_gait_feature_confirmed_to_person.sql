-- ----------------------------
-- 人员表添加步态特征确认字段
-- ----------------------------

-- 添加字段
ALTER TABLE `person` ADD COLUMN `gait_feature_confirmed` tinyint(1) DEFAULT 0 COMMENT '是否已确认步态特征 0-未确认 1-已确认' AFTER `monitor_id`;

-- 添加索引（可选，用于快速查询已确认/未确认的人员）
ALTER TABLE `person` ADD INDEX `idx_gait_confirmed` (`gait_feature_confirmed`);
