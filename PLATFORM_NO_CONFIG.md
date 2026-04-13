# Platform No 配置说明

## 📋 概述

platform_no（平台编号）支持两种获取方式：
1. **配置文件**：在 `application.yml` 中配置默认值
2. **动态设置**：用户登录时从 Token 或请求头中动态获取

## 🔧 配置方式

### 1. 在 application.yml 中配置

```yaml
ruoyi:
  # 钻井平台编号（默认值，可通过登录时动态设置）
  platformNo: DEFAULT
```

**配置位置**：`cosl-admin/src/main/resources/application.yml`

**可选值**：
- `DEFAULT`：默认平台（开发环境推荐）
- `PLATFORM_A`：A平台
- `PLATFORM_B`：B平台
- 其他自定义平台编号

### 2. 多环境配置

可以在不同环境的配置文件中设置不同的 platformNo：

**application-dev.yml**（开发环境）
```yaml
ruoyi:
  platformNo: DEV_PLATFORM
```

**application-prod.yml**（生产环境）
```yaml
ruoyi:
  platformNo: PROD_PLATFORM
```

## 🚀 工作原理

### 优先级顺序

1. **ThreadLocal 动态设置**（最高优先级）
   - 用户登录时从 Token 解析
   - 通过 `PlatformContext.setPlatformNo()` 设置
   - 适用于已登录用户

2. **配置文件默认值**（降级方案）
   - 从 `application.yml` 读取
   - 通过 `PlatformConfig` 类管理
   - 适用于未登录场景或 ThreadLocal 为空时

3. **硬编码默认值**（兜底方案）
   - 如果以上都失败，返回 `"DEFAULT"`
   - 确保系统不会因配置问题崩溃

### 获取流程

```
调用 PlatformContext.getPlatformNo()
         ↓
检查 ThreadLocal 是否有值
         ↓
    有值 → 返回 ThreadLocal 中的值
         ↓
    无值 → 从 Spring 容器获取 PlatformConfig
         ↓
    成功 → 返回配置文件中的 platformNo
         ↓
    失败 → 返回 "DEFAULT"
```

## 💡 使用示例

### 1. 在代码中获取平台编号

```java
import com.ruoyi.common.utils.PlatformContext;

// 获取当前平台编号
String platformNo = PlatformContext.getPlatformNo();
```

### 2. 在 Service 层设置平台编号

```java
@Service
public class SysUserServiceImpl implements ISysUserService
{
    public int insertUser(SysUser user)
    {
        // 如果用户对象中没有平台编号，从上下文获取
        if (StringUtils.isEmpty(user.getPlatformNo()))
        {
            user.setPlatformNo(PlatformContext.getPlatformNo());
        }
        return userMapper.insertUser(user);
    }
}
```

### 3. 在登录时设置平台编号

```java
// 从 Token 或请求头中解析平台编号
String platformNo = tokenService.getPlatformNoFromToken(token);
PlatformContext.setPlatformNo(platformNo);
```

### 4. 在拦截器中清理平台编号

```java
@Override
public void afterCompletion(HttpServletRequest request, 
                           HttpServletResponse response, 
                           Object handler, Exception ex)
{
    // 请求结束后清理 ThreadLocal，防止内存泄漏
    PlatformContext.clear();
}
```

## 🔍 验证配置

### 1. 查看启动日志

项目启动时会打印平台配置信息：

```
===========================================
钻井平台编号配置: DEFAULT
提示: 可在 application.yml 中修改 ruoyi.platformNo 配置项
提示: 用户登录时会从 Token 中动态获取平台编号
===========================================
```

### 2. 通过 API 测试

```bash
# 查询当前用户的平台编号（需要在登录后）
curl -H "Authorization: Bearer YOUR_TOKEN" \
     http://localhost:6021/cosl/api/user/profile
```

### 3. 数据库验证

```sql
-- 查看各表的 platform_no 字段
SELECT platform_no, COUNT(*) as count 
FROM sys_user 
GROUP BY platform_no;

SELECT platform_no, COUNT(*) as count 
FROM sys_role 
GROUP BY platform_no;
```

## ⚠️ 注意事项

### 1. 数据一致性

确保以下三个表的 platform_no 保持一致：
- `sys_user`（用户表）
- `sys_role`（角色表）
- `sys_user_role`（用户角色关联表）

### 2. 线程安全

`PlatformContext` 使用 `ThreadLocal` 存储平台编号，确保线程安全。但需要注意：
- 在请求结束时调用 `PlatformContext.clear()` 清理
- 避免在线程池中使用后不清理，导致内存泄漏

### 3. 多租户隔离

不同平台的用户应该：
- 只能访问本平台的数据
- 不能跨平台操作
- 管理员可以查看所有平台数据（需要特殊处理）

### 4. 配置变更

修改 `application.yml` 中的 `platformNo` 后：
- 需要重启应用才能生效
- 只影响新创建的记录
- 不影响已登录用户的 ThreadLocal 值

## 🎯 最佳实践

### 1. 开发环境

```yaml
ruoyi:
  platformNo: DEV_PLATFORM  # 或使用 DEFAULT
```

### 2. 测试环境

为每个测试平台创建独立的配置文件：

```yaml
# application-test-platform-a.yml
ruoyi:
  platformNo: PLATFORM_A
```

### 3. 生产环境

建议通过环境变量或配置中心管理：

```yaml
ruoyi:
  platformNo: ${PLATFORM_NO:PROD_DEFAULT}
```

启动时设置环境变量：
```bash
export PLATFORM_NO=PLATFORM_PROD_01
java -jar cosl-admin.jar
```

### 4. Docker 部署

```dockerfile
ENV PLATFORM_NO=DOCKER_PLATFORM
```

或在 docker-compose.yml 中：
```yaml
environment:
  - PLATFORM_NO=COMPOSE_PLATFORM
```

## 📊 配置优先级总结

| 场景 | 优先级 | 来源 | 说明 |
|------|--------|------|------|
| 已登录用户 | 1 | ThreadLocal | 从 Token 解析，最高优先级 |
| 未登录/ThreadLocal为空 | 2 | application.yml | 配置文件默认值 |
| 配置加载失败 | 3 | 硬编码 | 返回 "DEFAULT" 兜底 |

## 🔗 相关文件

- 配置文件：`cosl-admin/src/main/resources/application.yml`
- 配置类：`cosl-common/src/main/java/com/ruoyi/common/config/PlatformConfig.java`
- 上下文工具：`cosl-common/src/main/java/com/ruoyi/common/utils/PlatformContext.java`
- 初始化器：`cosl-framework/src/main/java/com/ruoyi/framework/config/PlatformConfigInitializer.java`

## ❓ 常见问题

### Q1: 为什么需要配置文件和 ThreadLocal 两种方式？

**A**: 
- 配置文件提供默认值，适用于系统级操作或未登录场景
- ThreadLocal 提供用户级别的动态值，适用于多租户隔离
- 两者结合，既灵活又可靠

### Q2: 如何为不同平台部署独立实例？

**A**: 
1. 复制 application.yml 为 application-platform-a.yml
2. 修改 platformNo 为对应平台编号
3. 启动时指定 profile：`--spring.profiles.active=platform-a`

### Q3: 管理员如何查看所有平台的数据？

**A**: 
在查询时不添加 platform_no 过滤条件，或者设置为 null：
```java
if (!ShiroUtils.isAdmin())
{
    query.setPlatformNo(PlatformContext.getPlatformNo());
}
```

### Q4: 配置修改后不生效怎么办？

**A**: 
1. 确认修改的是正确的配置文件
2. 检查 YAML 格式是否正确（注意缩进）
3. 重启应用
4. 查看启动日志确认配置值
