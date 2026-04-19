-- 修改 person 表的 gait_feature_confirmed 字段类型
-- 从 tinyint(1) 改为 varchar(20)

ALTER TABLE `person` 
MODIFY COLUMN `gait_feature_confirmed` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'notcollected' COMMENT '步态特征确认状态 notcollected-未采集 confirmed-已确认 notbound-未绑定';

-- 更新现有数据
-- 将原来的 0 改为 'notcollected'
UPDATE `person` SET `gait_feature_confirmed` = 'notcollected' WHERE `gait_feature_confirmed` = '0' OR `gait_feature_confirmed` IS NULL;

-- 将原来的 1 改为 'confirmed'
UPDATE `person` SET `gait_feature_confirmed` = 'confirmed' WHERE `gait_feature_confirmed` = '1';

SELECT 'gait_feature_confirmed 字段类型修改完成！' AS message;
