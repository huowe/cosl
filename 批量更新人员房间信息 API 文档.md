# 批量更新人员房间信息 API 文档

## 接口说明

该接口用于批量更新人员的房间、床位等信息，支持一次请求更新多个人员的房间分配情况。

## 接口地址

```
POST /cosl/api/person/batchUpdateRoomInfo
```

## 权限要求

需要 `system:person:edit` 权限

## 请求参数

### 请求方式
- Content-Type: `application/json`
- 请求体格式：JSON 数组

### 参数说明

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 人员 ID |
| roomId | Long | 否 | 房间 ID（不传则不更新） |
| bedId | Long | 否 | 床位 ID（不传则不更新） |
| lifeboatId | Long | 否 | 救生艇 ID（不传则不更新） |
| status | String | 否 | 状态（ONBOARD/TRANSFER/LEFT，不传则不更新） |

## 请求示例

### 示例 1：批量分配房间和床位

```json
[
  {
    "id": 1,
    "roomId": 101,
    "bedId": 201
  },
  {
    "id": 2,
    "roomId": 101,
    "bedId": 202
  },
  {
    "id": 3,
    "roomId": 102,
    "bedId": 203
  }
]
```

### 示例 2：批量更新房间并设置状态

```json
[
  {
    "id": 1,
    "roomId": 101,
    "bedId": 201,
    "status": "ONBOARD"
  },
  {
    "id": 2,
    "roomId": 101,
    "bedId": 202,
    "status": "ONBOARD"
  }
]
```

### 示例 3：只更新部分字段

```json
[
  {
    "id": 1,
    "roomId": 105
  },
  {
    "id": 2,
    "roomId": 105
  },
  {
    "id": 3,
    "roomId": 106
  }
]
```

## 响应示例

### 成功响应

```json
{
  "msg": "成功更新 3 条记录",
  "code": 0
}
```

### 失败响应 - 空数据

```json
{
  "msg": "批量更新数据不能为空",
  "code": 500
}
```

### 失败响应 - 缺少人员 ID

```json
{
  "msg": "人员 ID 不能为空：张三",
  "code": 500
}
```

### 失败响应 - 其他错误

```json
{
  "msg": "错误信息详情",
  "code": 500
}
```

## 使用场景

### 场景 1：新上船人员分配房间

当一批新人员上船时，可以批量为他们分配房间和床位。

### 场景 2：房间调整

当需要对多个人员的房间进行统一调整时，可以使用批量更新功能。

### 场景 3：批量变更状态

当人员集体转船或离船时，可以批量更新状态。

## 注意事项

1. **必须提供人员 ID**：每个人员对象都必须包含有效的 `id` 字段
2. **可选更新字段**：`roomId`、`bedId`、`lifeboatId`、`status` 都是可选的，只提供需要更新的字段即可
3. **事务性**：所有更新操作在同一个事务中执行，如果任何一条记录更新失败，整个操作将回滚
4. **数据验证**：建议在调用此接口前，先验证房间和床位是否存在且可用
5. **权限控制**：需要 `system:person:edit` 权限才能调用此接口

## Java 代码示例

```java
// 构造批量更新数据
List<Person> persons = new ArrayList<>();

Person person1 = new Person();
person1.setId(1L);
person1.setRoomId(101L);
person1.setBedId(201L);
persons.add(person1);

Person person2 = new Person();
person2.setId(2L);
person2.setRoomId(101L);
person2.setBedId(202L);
persons.add(person2);

// 调用接口
AjaxResult result = personController.batchUpdateRoomInfo(persons);
if (result.getCode() == 0) {
    System.out.println("批量更新成功：" + result.getMsg());
} else {
    System.err.println("批量更新失败：" + result.getMsg());
}
```

## JavaScript/Axios 示例

```javascript
// 批量更新人员房间信息
async function batchUpdateRoomInfo(persons) {
  try {
    const response = await axios.post('/cosl/api/person/batchUpdateRoomInfo', persons);
    if (response.data.code === 0) {
      console.log('批量更新成功:', response.data.msg);
      return true;
    } else {
      console.error('批量更新失败:', response.data.msg);
      return false;
    }
  } catch (error) {
    console.error('请求错误:', error.message);
    return false;
  }
}

// 使用示例
const personsToUpdate = [
  { id: 1, roomId: 101, bedId: 201 },
  { id: 2, roomId: 101, bedId: 202 },
  { id: 3, roomId: 102, bedId: 203 }
];

batchUpdateRoomInfo(personsToUpdate).then(success => {
  if (success) {
    alert('房间分配成功！');
  }
});
```

## 相关接口

- **人员列表查询**: `POST /cosl/api/person/list` - 查询人员列表获取人员 ID
- **房间详情查询**: `GET /cosl/api/room/detail` - 查询房间及床位信息
- **单个人员更新**: `POST /cosl/api/person/edit` - 更新单个人员信息

## 数据库影响

执行批量更新后，`person` 表的以下字段会被更新：
- `room_id` - 房间 ID
- `bed_id` - 床位 ID
- `lifeboat_id` - 救生艇 ID
- `status` - 人员状态
- `update_time` - 更新时间（自动设置为当前时间）
