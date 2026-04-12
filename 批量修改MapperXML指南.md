# 批量修改Mapper XML添加平台过滤 - 操作指南

## 已完成的工作

✅ 所有16个实体类已添加 `platformNo` 字段及getter/setter方法

## 待完成的Mapper XML修改

需要修改以下Mapper XML文件,按照PersonMapper.xml的模式添加平台过滤:

### 修改清单

1. ✅ PersonMapper.xml (已完成)
2. ⏳ RoomConfigMapper.xml
3. ⏳ RoomBedMapper.xml  
4. ⏳ FloorConfigMapper.xml
5. ⏳ CameraMapper.xml
6. ⏳ LifeboatConfigMapper.xml
7. ⏳ LifeboatSeatMapper.xml
8. ⏳ LifeboatPersonMapper.xml
9. ⏳ EvacuationPointMapper.xml
10. ⏳ DrillMapper.xml
11. ⏳ DrillPersonMapper.xml
12. ⏳ EvacuationMapper.xml
13. ⏳ EvacuationRecord相关查询
14. ⏳ PersonTrackMapper.xml
15. ⏳ PersonFaceMapper.xml
16. ⏳ PersonGaitMapper.xml

## 修改步骤(每个Mapper XML)

### 步骤1: 在resultMap中添加platform_no映射

```xml
<resultMap type="XXX" id="XXXResult">
    <result property="id"    column="id"    />
    <result property="platformNo"    column="platform_no"    />  <!-- 添加这行 -->
    ...
</resultMap>
```

### 步骤2: 在selectVo SQL中添加platform_no字段

```xml
<sql id="selectXXXVo">
    select id, platform_no, ...  <!-- 在id后添加platform_no -->
    from xxx_table
</sql>
```

### 步骤3: 在查询SQL的where条件中添加平台过滤

```xml
<select id="selectXXXList" parameterType="XXX" resultMap="XXXResult">
    <include refid="selectXXXVo"/>
    <where>
        deleted = 0
        <!-- 添加平台过滤 -->
        <if test="platformNo != null and platformNo != ''">
            AND platform_no = #{platformNo}
        </if>
        <!-- 其他查询条件 -->
        ...
    </where>
</select>
```

### 步骤4: 在insert中添加platform_no字段

```xml
<insert id="insertXXX" parameterType="XXX" useGeneratedKeys="true" keyProperty="id">
    insert into xxx_table
    <trim prefix="(" suffix=")" suffixOverrides=",">
        <if test="platformNo != null and platformNo != ''">platform_no,</if>  <!-- 添加这行 -->
        ...
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides=",">
        <if test="platformNo != null and platformNo != ''">#{platformNo},</if>  <!-- 添加这行 -->
        ...
    </trim>
</insert>
```

### 步骤5: 在update中添加platform_no更新

```xml
<update id="updateXXX" parameterType="XXX">
    update xxx_table
    <trim prefix="SET" suffixOverrides=",">
        <if test="platformNo != null and platformNo != ''">platform_no = #{platformNo},</if>  <!-- 添加这行 -->
        ...
    </trim>
    where id = #{id}
</update>
```

### 步骤6: 统计查询也添加平台过滤

```xml
<select id="countXXX" resultType="int">
    select count(*) from xxx_table 
    where deleted = 0
    <if test="platformNo != null and platformNo != ''">
        and platform_no = #{platformNo}
    </if>
</select>
```

## 快速修改命令

可以使用以下sed命令批量查找和替换(需要在Linux/Mac环境下):

```bash
# 备份所有Mapper XML文件
cp src/main/resources/mapper/system/*.xml src/main/resources/mapper/system/*.xml.bak

# 然后手动按照上述步骤修改每个文件
```

## 验证修改

修改完成后,执行以下检查:

1. ✅ 所有查询都添加了平台过滤
2. ✅ 所有insert都支持platform_no字段
3. ✅ 所有update都支持platform_no字段  
4. ✅ 统计查询也添加了平台过滤
5. ✅ resultMap中添加了platform_no映射
6. ✅ selectVo SQL中包含了platform_no字段

## 注意事项

1. **唯一性检查**: 如果表有唯一性检查SQL(如checkRoomNoUnique),也需要添加平台号过滤
2. **批量操作**: 批量插入/更新也需要处理platform_no
3. **关联查询**: 如果有JOIN查询,确保关联表也有平台号过滤
4. **测试**: 修改后务必测试各平台的隔离效果

## 参考模板

完整的修改示例请查看:
- [Person.java](../cosl-common/src/main/java/com/ruoyi/common/core/domain/entity/Person.java)
- [PersonMapper.xml](../cosl-system/src/main/resources/mapper/system/PersonMapper.xml)

---

**提示**: 由于Mapper XML数量较多,建议分批次修改并逐个测试,确保每个模块的平台隔离功能正常工作。
