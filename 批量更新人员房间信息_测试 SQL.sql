-- ============================================
-- 批量更新人员房间信息 - SQL 测试脚本
-- 
-- 说明：本脚本用于测试批量更新功能的 SQL 语句
-- 数据库：MySQL
-- ============================================

-- 1. 查看当前所有人员的房间分配情况
SELECT 
    p.id,
    p.name,
    p.mts_card_no,
    p.room_id,
    p.bed_id,
    p.status,
    rc.room_no,
    rb.bed_no
FROM person p
LEFT JOIN room_config rc ON p.room_id = rc.id
LEFT JOIN room_bed rb ON p.bed_id = rb.id
WHERE p.deleted = 0
ORDER BY p.id;

-- 2. 测试数据准备 - 插入测试人员（可选）
-- INSERT INTO person (name, mts_card_no, id_card, company, position, status, create_time, update_time, deleted)
-- VALUES 
-- ('测试人员 1', 'MTS001', '110101199001011234', '测试公司', '船员', 'ONBOARD', NOW(), NOW(), 0),
-- ('测试人员 2', 'MTS002', '110101199001011235', '测试公司', '船员', 'ONBOARD', NOW(), NOW(), 0),
-- ('测试人员 3', 'MTS003', '110101199001011236', '测试公司', '船员', 'ONBOARD', NOW(), NOW(), 0);

-- 3. 单条更新测试 - 验证 SQL 语法
UPDATE person 
SET room_id = 101, 
    bed_id = 201, 
    status = 'ONBOARD', 
    update_time = sysdate() 
WHERE id = 1;

-- 4. 批量更新测试 - 方式 1: 使用 CASE WHEN
-- 注意：MyBatis 的 foreach 分隔符使用的是分号 (;)，表示多条独立的 UPDATE 语句
UPDATE person 
SET room_id = CASE id 
                WHEN 1 THEN 101
                WHEN 2 THEN 101
                WHEN 3 THEN 102
              END,
    bed_id = CASE id 
               WHEN 1 THEN 201
               WHEN 2 THEN 202
               WHEN 3 THEN 203
             END,
    status = CASE id 
               WHEN 1 THEN 'ONBOARD'
               WHEN 2 THEN 'ONBOARD'
               WHEN 3 THEN 'ONBOARD'
             END,
    update_time = sysdate()
WHERE id IN (1, 2, 3);

-- 5. 批量更新测试 - 方式 2: 多条 UPDATE 语句（MyBatis 实际生成的方式）
-- MyBatis <foreach collection="list" item="person" separator=";"> 会生成如下 SQL:
UPDATE person SET room_id = 101, bed_id = 201, status = 'ONBOARD', update_time = sysdate() WHERE id = 1;
UPDATE person SET room_id = 101, bed_id = 202, status = 'ONBOARD', update_time = sysdate() WHERE id = 2;
UPDATE person SET room_id = 102, bed_id = 203, status = 'ONBOARD', update_time = sysdate() WHERE id = 3;

-- 6. 只更新房间 ID 的批量操作
UPDATE person 
SET room_id = CASE id 
                WHEN 1 THEN 105
                WHEN 2 THEN 105
                WHEN 3 THEN 106
              END,
    update_time = sysdate()
WHERE id IN (1, 2, 3);

-- 7. 只更新状态的批量操作
UPDATE person 
SET status = CASE id 
               WHEN 1 THEN 'TRANSFER'
               WHEN 2 THEN 'TRANSFER'
               WHEN 3 THEN 'LEFT'
             END,
    update_time = sysdate()
WHERE id IN (1, 2, 3);

-- 8. 验证更新结果
SELECT 
    p.id,
    p.name,
    p.room_id,
    p.bed_id,
    p.status,
    p.update_time,
    rc.room_no,
    rb.bed_no
FROM person p
LEFT JOIN room_config rc ON p.room_id = rc.id
LEFT JOIN room_bed rb ON p.bed_id = rb.id
WHERE p.deleted = 0
  AND p.id IN (1, 2, 3)
ORDER BY p.id;

-- 9. 测试回滚（如果需要撤销更新）
-- 注意：实际使用时请在事务中执行，或者手动恢复原值
-- UPDATE person 
-- SET room_id = NULL, 
--     bed_id = NULL, 
--     status = 'ONBOARD', 
--     update_time = sysdate() 
-- WHERE id IN (1, 2, 3);

-- 10. 查看人员的完整房间床位信息
SELECT 
    p.id AS person_id,
    p.name AS person_name,
    p.mts_card_no,
    p.company,
    p.position,
    rc.room_no,
    rc.floor,
    rb.bed_no,
    rb.status AS bed_status,
    p.lifeboat_id,
    p.status AS person_status,
    p.update_time
FROM person p
LEFT JOIN room_config rc ON p.room_id = rc.id
LEFT JOIN room_bed rb ON p.bed_id = rb.id
WHERE p.deleted = 0
ORDER BY rc.room_no, rb.bed_no;

-- 11. 统计每个房间的人数
SELECT 
    rc.room_no,
    rc.floor,
    COUNT(p.id) AS person_count,
    GROUP_CONCAT(p.name ORDER BY p.name SEPARATOR ', ') AS person_names
FROM room_config rc
LEFT JOIN person p ON rc.id = p.room_id AND p.deleted = 0
GROUP BY rc.id, rc.room_no, rc.floor
ORDER BY rc.room_no;

-- 12. 查找未分配房间的人员
SELECT 
    p.id,
    p.name,
    p.mts_card_no,
    p.position,
    p.status
FROM person p
WHERE p.deleted = 0
  AND (p.room_id IS NULL OR p.room_id = 0)
ORDER BY p.name;

-- 13. 查找空闲的床位（未被分配的床位）
SELECT 
    rc.room_no,
    rc.floor,
    rb.bed_no,
    rb.status
FROM room_bed rb
JOIN room_config rc ON rb.room_id = rc.id
WHERE rb.id NOT IN (
    SELECT p.bed_id 
    FROM person p 
    WHERE p.deleted = 0 AND p.bed_id IS NOT NULL
)
ORDER BY rc.room_no, rb.bed_no;

-- ============================================
-- MyBatis 批量更新 SQL 示例（XML 配置）
-- ============================================
/*
在 PersonMapper.xml 中的配置:

<update id="batchUpdateRoomInfo">
    <foreach collection="list" item="person" separator=";">
        update person
        <trim prefix="SET" suffixOverrides=",">
            <if test="person.roomId != null">room_id = #{person.roomId},</if>
            <if test="person.bedId != null">bed_id = #{person.bedId},</if>
            <if test="person.lifeboatId != null">lifeboat_id = #{person.lifeboatId},</if>
            <if test="person.status != null and person.status != ''">status = #{person.status},</if>
            update_time = sysdate()
        </trim>
        where id = #{person.id}
    </foreach>
</update>
*/

-- ============================================
-- 性能测试 - 大批量更新
-- ============================================

-- 14. 模拟批量更新 100 条记录（仅示例，不要随意执行）
-- 可以使用存储过程或脚本生成测试数据
-- DELIMITER $$
-- CREATE PROCEDURE batch_update_test()
-- BEGIN
--     DECLARE i INT DEFAULT 1;
--     WHILE i <= 100 DO
--         UPDATE person 
--         SET room_id = FLOOR(1 + RAND() * 50),
--             bed_id = FLOOR(1 + RAND() * 200),
--             update_time = sysdate()
--         WHERE id = i;
--         SET i = i + 1;
--     END WHILE;
-- END$$
-- DELIMITER ;
-- CALL batch_update_test();
-- DROP PROCEDURE batch_update_test;

-- ============================================
-- 结束
-- ============================================
