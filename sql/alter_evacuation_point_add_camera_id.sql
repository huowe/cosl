-- 为 evacuation_point 表添加摄像机ID字段
ALTER TABLE evacuation_point 
ADD COLUMN camera_id VARCHAR(64) DEFAULT NULL COMMENT '摄像机ID' AFTER y_axis;
