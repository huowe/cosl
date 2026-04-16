-- ----------------------------
-- 修改人员特征详情表字段类型（将图片字段改为longtext存储base64）
-- ----------------------------

-- 修改 face_path 字段
ALTER TABLE `person_feature_detail` MODIFY COLUMN `face_path` longtext COMMENT '人脸图片base64';

-- 修改 master_original_image 字段
ALTER TABLE `person_feature_detail` MODIFY COLUMN `master_original_image` longtext COMMENT '主控服务器特征预览图base64';

-- 修改 original_image 字段
ALTER TABLE `person_feature_detail` MODIFY COLUMN `original_image` longtext COMMENT '特征预览图base64';

-- 修改 preview_image 字段
ALTER TABLE `person_feature_detail` MODIFY COLUMN `preview_image` longtext COMMENT '预览图base64';

-- 修改 sequence_img_url 字段
ALTER TABLE `person_feature_detail` MODIFY COLUMN `sequence_img_url` longtext COMMENT '步态序列图base64';
