# 紧急撤离包含全部人员 API 文档

## 功能说明

新建紧急撤离事件时，自动将当前钻井平台下的所有人员添加到撤离记录中，状态设置为"PENDING"（待撤离）。

## API 接口

### 1. 新增紧急撤离（包含全部人员）

**接口地址：** `/api/evacuation/addWithAllPersons`

**请求方式：** `POST`

**权限要求：** `system:evacuation:add`

**请求头：**
```
Content-Type: application/json
```

**请求参数：**

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| name | String | 是 | 撤离事件名称 |
| type | String | 否 | 撤离类型（FIRE:火灾，COLLISION:碰撞，GAS_LEAK:气体泄漏，ABANDON_SHIP:弃船，OTHER:其他） |
| alarmLevel | String | 否 | 警报级别（LEVEL1:一级，LEVEL2:二级，LEVEL3:三级） |
| assemblyPoint | String | 否 | 集合点位置 |
| remark | String | 否 | 备注 |

**注意：** platformNo、createBy、createTime 由系统自动设置，无需传入。

**请求示例：**

```json
{
  "name": "消防演习-2026-04-17",
  "type": "FIRE",
  "alarmLevel": "LEVEL1",
  "assemblyPoint": "主甲板集合点A",
  "remark": "例行消防演习"
}
```

**返回参数：**

| 参数名 | 类型 | 说明 |
|--------|------|------|
| code | Integer | 返回码（200:成功，500:失败） |
| msg | String | 返回消息 |
| data | Object | 返回数据 |

**返回示例：**

成功：
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

失败：
```json
{
  "code": 500,
  "msg": "操作失败",
  "data": null
}
```

## 业务逻辑说明

### 执行流程

1. **创建撤离事件**
   - 插入 evacuation 表
   - 自动设置 platformNo（从当前上下文获取）
   - 自动设置 createBy（当前登录用户）
   - 自动设置 createTime（当前时间）
   - 初始状态默认为 PLANNED（计划中）

2. **查询全部人员**
   - 根据 platformNo 查询当前平台下的所有人员
   - 调用 PersonMapper.selectPersonList() 方法

3. **批量创建撤离记录**
   - 为每个人员创建一条 evacuation_record 记录
   - 设置字段：
     - evacuationId: 刚创建的撤离事件ID
     - personId: 人员ID
     - personName: 人员姓名
     - status: "PENDING"（待撤离状态）

4. **更新预计人数**
   - 统计实际添加的人员数量
   - 更新 evacuation 表的 expected_count 字段

### 事务控制

整个操作使用 `@Transactional` 注解保证事务一致性：
- 如果任何步骤失败，所有操作都会回滚
- 确保数据完整性

## 相关接口

### 2. 开始撤离

**接口地址：** `/api/evacuation/startEvacuation`

**请求方式：** `POST`

**请求参数：**

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 撤离事件ID |

**功能：** 将撤离状态从 PLANNED 改为 ACTIVE，并记录开始时间

### 3. 登记人员撤离

**接口地址：** `/api/evacuation/registerPerson`

**请求方式：** `POST`

**请求参数：**

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| evacuationId | Long | 是 | 撤离事件ID |
| personId | Long | 是 | 人员ID |
| lifeboatId | Long | 否 | 救生艇ID |
| seatNo | Integer | 否 | 座位号 |
| status | String | 否 | 状态（EVACUATED:已撤离，MISSING:失踪，INJURED:受伤） |

### 4. 查询撤离人员记录

**接口地址：** `/api/evacuation/records/{evacuationId}`

**请求方式：** `GET`

**路径参数：**

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| evacuationId | Long | 是 | 撤离事件ID |

**返回：** 该撤离事件下的所有人员记录列表

## 数据库表结构

### evacuation（紧急撤离事件表）

主要字段：
- id: 主键
- platform_no: 钻井平台编号
- name: 撤离事件名称
- type: 撤离类型
- alarm_level: 警报级别
- start_time: 开始时间
- end_time: 结束时间
- expected_count: 预计撤离人数（自动填充）
- actual_count: 实际撤离人数
- assembly_point: 集合点位置
- status: 状态（PLANNED/ACTIVE/COMPLETED/CANCELLED）

### evacuation_record（撤离人员记录表）

主要字段：
- id: 主键
- evacuation_id: 撤离事件ID
- person_id: 人员ID
- person_name: 人员姓名
- lifeboat_id: 救生艇ID
- lifeboat_no: 救生艇编号
- seat_no: 座位号
- arrive_time: 到达集合点时间
- board_time: 登艇时间
- status: 状态（PENDING/EVACUATED/MISSING/INJURED）

## 使用示例

### JavaScript (Axios)

```javascript
// 创建包含全部人员的撤离事件
axios.post('/api/evacuation/addWithAllPersons', {
  name: '紧急撤离演习',
  type: 'FIRE',
  alarmLevel: 'LEVEL1',
  assemblyPoint: '主甲板集合点A',
  remark: '全员参与演习'
})
.then(response => {
  if (response.data.code === 200) {
    console.log('撤离事件创建成功');
    // 可以进一步查询人员记录
    getEvacuationRecords();
  }
})
.catch(error => {
  console.error('创建失败:', error);
});

// 查询人员记录
function getEvacuationRecords() {
  axios.get('/api/evacuation/records/1') // 假设撤离事件ID为1
    .then(response => {
      console.log('人员记录:', response.data.rows);
      console.log('总人数:', response.data.total);
    });
}
```

### Java (RestTemplate)

```java
@RestController
@RequestMapping("/test")
public class TestController {
    
    @Autowired
    private RestTemplate restTemplate;
    
    @PostMapping("/create-evacuation")
    public ResponseEntity<?> createEvacuation() {
        String url = "http://localhost:8080/api/evacuation/addWithAllPersons";
        
        // 构建请求体
        Map<String, Object> request = new HashMap<>();
        request.put("name", "消防演习");
        request.put("type", "FIRE");
        request.put("alarmLevel", "LEVEL1");
        request.put("assemblyPoint", "主甲板集合点A");
        
        // 发送请求
        ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);
        
        return ResponseEntity.ok(response.getBody());
    }
}
```

### cURL

```bash
curl -X POST http://localhost:8080/api/evacuation/addWithAllPersons \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "name": "消防演习-2026-04-17",
    "type": "FIRE",
    "alarmLevel": "LEVEL1",
    "assemblyPoint": "主甲板集合点A",
    "remark": "例行消防演习"
  }'
```

## 注意事项

1. **权限要求**：需要 `system:evacuation:add` 权限
2. **平台隔离**：只会添加当前登录用户所属平台的人员
3. **事务安全**：使用事务保证数据一致性，失败会自动回滚
4. **人员状态**：新添加的人员记录状态为 "PENDING"（待撤离）
5. **预计人数**：系统会自动计算并更新 expected_count 字段
6. **重复创建**：如果多次调用，会创建多个撤离事件，每个都包含全部人员

## 代码位置

- Controller: `cosl-admin/src/main/java/com/ruoyi/web/controller/system/EvacuationController.java`
- Service Interface: `cosl-system/src/main/java/com/ruoyi/system/service/IEvacuationService.java`
- Service Implementation: `cosl-system/src/main/java/com/ruoyi/system/service/impl/EvacuationServiceImpl.java`
- Mapper: `cosl-system/src/main/resources/mapper/system/EvacuationMapper.xml`

## 版本信息

- 创建日期: 2026-04-17
- 版本: v1.0
- 作者: 系统自动生成
