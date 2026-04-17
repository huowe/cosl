-- ----------------------------
-- 初始化远见平台配置字典类型
-- ----------------------------

-- 插入字典类型
INSERT INTO `sys_dict_type` (`dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `remark`) 
VALUES ('远见平台配置', 'yuanjian_config', '0', 'admin', NOW(), '存储远见平台的默认配置信息，如cameraGroupId、repId等');

-- 注意：具体的字典数据（cameraGroupId和repId）会在系统启动时自动从API获取并插入
