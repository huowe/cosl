# 钻井平台数据隔离功能 - Mapper XML修改进度报告

## 📊 总体进度

**已完成**: 6/16 Mapper XML (37.5%)  
**待完成**: 10/16 Mapper XML (62.5%)

---

## ✅ 已完成的Mapper XML (6个)

### 1. PersonMapper.xml ✅
- 文件路径: `cosl-system/src/main/resources/mapper/system/PersonMapper.xml`
- 状态: **完全完成**
- 修改内容:
  - ✅ resultMap添加platform_no映射
  - ✅ selectVo SQL添加platform_no字段
  - ✅ 查询条件添加平台过滤
  - ✅ insert/update添加platform_no处理
  - ✅ 统计查询添加平台过滤

### 2. RoomConfigMapper.xml ✅
- 文件路径: `cosl-system/src/main/resources/mapper/system/RoomConfigMapper.xml`
- 状态: **完全完成**
- 特殊处理:
  - ✅ checkRoomNoUnique唯一性检查添加平台号
  - ✅ countRoomTotal统计添加平台过滤
  - ✅ countRoomFree空闲房间统计添加平台过滤

### 3. RoomBedMapper.xml ✅
- 文件路径: `cosl-system/src/main/resources/mapper/system/RoomBedMapper.xml`
- 状态: **完全完成**
- 特殊处理:
  - ✅ checkRoomBedUnique唯一性检查添加平台号

### 4. FloorConfigMapper.xml ✅
- 文件路径: `cosl-system/src/main/resources/mapper/system/FloorConfigMapper.xml`
- 状态: **完全完成**
- 特殊处理:
  - ✅ checkFloorNoUnique唯一性检查添加平台号
  - ✅ 软删除(deleted=0)与平台过滤结合

### 5. CameraMapper.xml ✅
- 文件路径: `cosl-system/src/main/resources/mapper/system/CameraMapper.xml`
- 状态: **完全完成**
- 特殊处理:
  - ✅ checkIpUnique唯一性检查添加平台号
  - ✅ countCameraTotal统计添加平台过滤
  - ✅ countCameraOnline在线摄像头统计添加平台过滤

### 6. LifeboatConfigMapper.xml ✅
- 文件路径: `cosl-system/src/main/resources/mapper/system/LifeboatConfigMapper.xml`
- 状态: **完全完成**
- 特殊处理:
  - ✅ checkBoatNoUnique唯一性检查添加平台号
  - ✅ countLifeboatTotal统计添加平台过滤
  - ✅ countLifeboatFree空闲救生艇统计添加平台过滤
  - ✅ 软删除与平台过滤结合

### 7. DrillMapper.xml ✅
- 文件路径: `cosl-system/src/main/resources/mapper/system/DrillMapper.xml`
- 状态: **完全完成**
- 特殊处理:
  - ✅ countDrillThisMonth本月演习次数统计添加平台过滤
  - ✅ countDrillTotal累计演习次数统计添加平台过滤
  - ✅ 包含drill_person关联操作(需单独处理DrillPersonMapper)

---

## ⏳ 待完成的Mapper XML (9个)

### 8. LifeboatSeatMapper.xml ⏳
- 文件路径: `cosl-system/src/main/resources/mapper/system/LifeboatSeatMapper.xml`
- 优先级: **高**
- 需要修改:
  - [ ] resultMap添加platform_no映射
  - [ ] selectVo SQL添加platform_no字段
  - [ ] 查询条件添加平台过滤
  - [ ] insert/update添加platform_no处理
  - [ ] 唯一性检查(如果有)

### 9. LifeboatPersonMapper.xml ⏳
- 文件路径: `cosl-system/src/main/resources/mapper/system/LifeboatPersonMapper.xml`
- 优先级: **高**
- 需要修改:
  - [ ] resultMap添加platform_no映射
  - [ ] selectVo SQL添加platform_no字段
  - [ ] 查询条件添加平台过滤
  - [ ] insert/update添加platform_no处理

### 10. EvacuationPointMapper.xml ⏳
- 文件路径: `cosl-system/src/main/resources/mapper/system/EvacuationPointMapper.xml`
- 优先级: **高**
- 需要修改:
  - [ ] resultMap添加platform_no映射
  - [ ] selectVo SQL添加platform_no字段
  - [ ] 查询条件添加平台过滤
  - [ ] insert/update添加platform_no处理
  - [ ] 统计查询(如果有)

### 11. DrillPersonMapper.xml ⏳
- 注意: DrillPerson的SQL在DrillMapper.xml中,需要检查是否有独立的Mapper文件
- 优先级: **中**
- 需要修改:
  - [ ] 检查是否存在独立Mapper文件
  - [ ] 如果存在,按标准流程修改
  - [ ] 如果不存在,确认DrillMapper.xml中的相关SQL已处理

### 12. EvacuationMapper.xml ⏳
- 文件路径: `cosl-system/src/main/resources/mapper/system/EvacuationMapper.xml`
- 优先级: **高**
- 需要修改:
  - [ ] resultMap添加platform_no映射
  - [ ] selectVo SQL添加platform_no字段
  - [ ] 查询条件添加平台过滤
  - [ ] insert/update添加platform_no处理
  - [ ] 统计查询(如果有)

### 13. PersonTrackMapper.xml ⏳
- 文件路径: `cosl-system/src/main/resources/mapper/system/PersonTrackMapper.xml`
- 优先级: **中**
- 需要修改:
  - [ ] resultMap添加platform_no映射
  - [ ] selectVo SQL添加platform_no字段
  - [ ] 查询条件添加平台过滤
  - [ ] insert/update添加platform_no处理
  - [ ] 轨迹统计查询(如果有)

### 14. PersonFaceMapper.xml ⏳
- 文件路径: `cosl-system/src/main/resources/mapper/system/PersonFaceMapper.xml`
- 优先级: **低**
- 需要修改:
  - [ ] resultMap添加platform_no映射
  - [ ] selectVo SQL添加platform_no字段
  - [ ] 查询条件添加平台过滤
  - [ ] insert/update添加platform_no处理

### 15. PersonGaitMapper.xml ⏳
- 文件路径: `cosl-system/src/main/resources/mapper/system/PersonGaitMapper.xml`
- 优先级: **低**
- 需要修改:
  - [ ] resultMap添加platform_no映射
  - [ ] selectVo SQL添加platform_no字段
  - [ ] 查询条件添加平台过滤
  - [ ] insert/update添加platform_no处理

### 16. EvacuationRecord相关 ⏳
- 说明: EvacuationRecord可能没有独立的Mapper,需要检查
- 优先级: **中**
- 需要确认:
  - [ ] 是否存在EvacuationRecordMapper.xml
  - [ ] 相关SQL在哪里定义
  - [ ] 按实际情况修改

---

## 🔧 修改模板(每个Mapper都需要)

### 步骤1: resultMap添加映射
```xml
<resultMap type="XXX" id="XXXResult">
    <result property="id"    column="id"    />
    <result property="platformNo"    column="platform_no"    />  <!-- 添加这行 -->
    ...其他字段...
</resultMap>
```

### 步骤2: selectVo SQL添加字段
```xml
<sql id="selectXXXVo">
    select id, platform_no, ...其他字段...  <!-- 在id后添加platform_no -->
    from xxx_table
</sql>
```

### 步骤3: 查询where条件添加平台过滤
```xml
<select id="selectXXXList" parameterType="XXX" resultMap="XXXResult">
    <include refid="selectXXXVo"/>
    <where>
        <if test="platformNo != null and platformNo != ''">
            AND platform_no = #{platformNo}
        </if>
        ...其他查询条件...
    </where>
</select>
```

### 步骤4: insert添加platform_no
```xml
<insert id="insertXXX" parameterType="XXX" useGeneratedKeys="true" keyProperty="id">
    insert into xxx_table
    <trim prefix="(" suffix=")" suffixOverrides=",">
        <if test="platformNo != null and platformNo != ''">platform_no,</if>
        ...其他字段...
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides=",">
        <if test="platformNo != null and platformNo != ''">#{platformNo},</if>
        ...其他值...
    </trim>
</insert>
```

### 步骤5: update添加platform_no
```xml
<update id="updateXXX" parameterType="XXX">
    update xxx_table
    <trim prefix="SET" suffixOverrides=",">
        <if test="platformNo != null and platformNo != ''">platform_no = #{platformNo},</if>
        ...其他字段...
    </trim>
    where id = #{id}
</update>
```

### 步骤6: 统计查询添加平台过滤
```xml
<select id="countXXX" resultType="int">
    select count(*) from xxx_table
    <where>
        ...原有条件...
        <if test="platformNo != null and platformNo != ''">
            and platform_no = #{platformNo}
        </if>
    </where>
</select>
```

---

## ⚠️ 注意事项

### 1. 唯一性检查
如果表有唯一性约束检查(如checkRoomNoUnique),必须添加平台号:
```xml
<!-- 错误示例 -->
where room_no = #{roomNo} limit 1

<!-- 正确示例 -->
where room_no = #{roomNo} and platform_no = #{platformNo} limit 1
```

### 2. 软删除
对于使用deleted标志的表,确保平台过滤与软删除条件正确组合:
```xml
<where>
    deleted = 0
    <if test="platformNo != null and platformNo != ''">
        and platform_no = #{platformNo}
    </if>
    ...其他条件...
</where>
```

### 3. 关联查询
如果有JOIN查询,确保关联表也有平台号过滤:
```xml
select a.*, b.* 
from table_a a
left join table_b b on a.id = b.a_id
where a.platform_no = #{platformNo}
  and b.platform_no = #{platformNo}  <!-- 关联表也要过滤 -->
```

### 4. 批量操作
批量插入/更新也需要处理platform_no:
```xml
<insert id="batchInsertXXX">
    insert into xxx_table (platform_no, ...) values
    <foreach collection="list" item="item" separator=",">
        (#{item.platformNo}, ...)
    </foreach>
</insert>
```

---

## 📝 快速验证清单

修改完每个Mapper后,请检查:

- [ ] resultMap中有platform_no映射
- [ ] selectVo SQL包含platform_no字段
- [ ] 所有查询都有平台过滤条件
- [ ] insert语句支持platform_no
- [ ] update语句支持platform_no
- [ ] 统计查询有平台过滤
- [ ] 唯一性检查包含platform_no
- [ ] 软删除与平台过滤正确组合

---

## 🎯 下一步建议

### 方案A: 逐个完成(推荐)
1. 优先完成高优先级的Mapper(LifeboatSeat、LifeboatPerson、EvacuationPoint、Evacuation)
2. 每完成一个就测试验证
3. 确保核心业务模块先可用

### 方案B: 批量完成
1. 按照模板一次性修改所有剩余Mapper
2. 统一测试验证
3. 适合时间充裕的情况

### 方案C: 按需完成
1. 先只完成当前项目需要的模块
2. 其他模块后续根据需求逐步完善
3. 最灵活,但可能导致部分功能暂时不可用

---

## 📞 技术支持

参考已完成的Mapper文件:
- [PersonMapper.xml](./cosl-system/src/main/resources/mapper/system/PersonMapper.xml)
- [RoomConfigMapper.xml](./cosl-system/src/main/resources/mapper/system/RoomConfigMapper.xml)
- [CameraMapper.xml](./cosl-system/src/main/resources/mapper/system/CameraMapper.xml)
- [LifeboatConfigMapper.xml](./cosl-system/src/main/resources/mapper/system/LifeboatConfigMapper.xml)
- [DrillMapper.xml](./cosl-system/src/main/resources/mapper/system/DrillMapper.xml)

详细修改指南请参考:
- [批量修改MapperXML指南.md](./批量修改MapperXML指南.md)

---

**最后更新**: 2026-04-12  
**当前进度**: 6/16 (37.5%)  
**预计完成时间**: 取决于选择的方案
