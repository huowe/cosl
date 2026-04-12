# 海上平台管理系统 — 缺失接口完整审计报告

> 审计日期：2026-03-15
> 审计范围：所有页面、弹窗、按钮级别功能

---

## 一、Service 层方法级别分析

### 1. authService


| 方法               | 状态       | 说明                           |
| ---------------- | -------- | ---------------------------- |
| `login`          | ✅ 真实API  | `/cosl/api/auth/login`       |
| `logout`         | ⚠️ 半Mock | 仅清除 localStorage，无后端登出接口     |
| `getCurrentUser` | ❌ Mock   | 从 localStorage 读取或返回硬编码管理员对象 |


### 2. personnelService


| 方法            | 状态      | 说明                             |
| ------------- | ------- | ------------------------------ |
| `getList`     | ✅ 真实API | POST `/cosl/api/person/list`   |
| `create`      | ✅ 真实API | POST `/cosl/api/person/add`    |
| `update`      | ✅ 真实API | POST `/cosl/api/person/edit`   |
| `delete`      | ✅ 真实API | POST `/cosl/api/person/remove` |
| `deleteBatch` | ✅ 真实API | POST `/cosl/api/person/remove` |
| `getById`     | ❌ Mock  | 调用 `mockGetPersonnelById`      |
| `getStats`    | ❌ Mock  | 调用 `mockGetPersonnelStats`     |
| `export`      | ❌ Mock  | 调用 `mockExportPersonnel`       |


### 3. cameraService


| 方法               | 状态      | 说明                                           |
| ---------------- | ------- | -------------------------------------------- |
| `getList`        | ✅ 真实API | POST `/cosl/api/camera/list`                 |
| `getAll`         | ✅ 真实API | POST `/cosl/api/camera/list` (pageSize=1000) |
| `getById`        | ✅ 真实API | GET `/cosl/api/camera/detail`                |
| `create`         | ✅ 真实API | POST `/cosl/api/camera/add`                  |
| `update`         | ✅ 真实API | POST `/cosl/api/camera/edit`                 |
| `delete`         | ✅ 真实API | POST `/cosl/api/camera/remove`               |
| `deleteBatch`    | ✅ 真实API | POST `/cosl/api/camera/remove`               |
| `getStats`       | ❌ Mock  | 调用 `mockGetCameraStats`                      |
| `updatePosition` | ❌ Mock  | 调用 `mockUpdateCameraPosition`                |
| `clearPosition`  | ❌ Mock  | 调用 `mockClearCameraPosition`                 |
| `export`         | ❌ Mock  | 调用 `mockExportCameras`                       |


### 4. accountService


| 方法              | 状态      | 说明                                    |
| --------------- | ------- | ------------------------------------- |
| `getList`       | ✅ 真实API | POST `/cosl/api/account/page`         |
| `getById`       | ✅ 真实API | GET `/cosl/api/account/detail`        |
| `create`        | ✅ 真实API | POST `/cosl/api/account/add`          |
| `update`        | ✅ 真实API | POST `/cosl/api/account/update`       |
| `delete`        | ✅ 真实API | POST `/cosl/api/account/delete`       |
| `deleteBatch`   | ✅ 真实API | POST `/cosl/api/account/delete`       |
| `changeStatus`  | ✅ 真实API | POST `/cosl/api/account/changeStatus` |
| `resetPassword` | ✅ 真实API | POST `/cosl/api/account/resetPwd`     |
| `export`        | ✅ 真实API | POST `/cosl/api/account/export`       |


### 5. roomService


| 方法                     | 状态      | 说明                                         |
| ---------------------- | ------- | ------------------------------------------ |
| `getPage`              | ✅ 真实API | POST `/cosl/api/room/page`                 |
| `getDetail`            | ✅ 真实API | GET `/cosl/api/room/detail`                |
| `create`               | ✅ 真实API | POST `/cosl/api/room/add`                  |
| `update`               | ✅ 真实API | POST `/cosl/api/room/edit`                 |
| `delete`               | ✅ 真实API | POST `/cosl/api/room/remove`               |
| `addBed`               | ✅ 真实API | POST `/cosl/api/roomBed/add`               |
| `editBed`              | ✅ 真实API | POST `/cosl/api/roomBed/edit`              |
| `batchChangeBedStatus` | ✅ 真实API | POST `/cosl/api/roomBed/batchChangeStatus` |


### 6. drillService


| 方法                      | 状态      | 说明                             |
| ----------------------- | ------- | ------------------------------ |
| `getList`               | ✅ 真实API | POST `/cosl/api/drill/list`    |
| `create`                | ✅ 真实API | POST `/cosl/api/drill/add`     |
| `update`                | ✅ 真实API | POST `/cosl/api/drill/edit`    |
| `delete`                | ❌ Mock  | 调用 `mockDeleteDrill`           |
| `deleteBatch`           | ❌ Mock  | 调用 `mockDeleteDrillBatch`      |
| `startDrill`            | ❌ Mock  | 调用 `mockStartDrill`            |
| `getActiveDrill`        | ❌ Mock  | 调用 `mockGetActiveDrill`        |
| `endDrill`              | ❌ Mock  | 调用 `mockEndDrill`              |
| `togglePersonnelStatus` | ❌ Mock  | 调用 `mockTogglePersonnelStatus` |
| `export`                | ❌ Mock  | 调用 `mockExportDrills`          |


### 7. trackService


| 方法                           | 状态          | 说明                               |
| ---------------------------- | ----------- | -------------------------------- |
| `getTrack`                   | ❌ Mock      | 内嵌 mock 数据生成                     |
| `getRealTimePositions`       | ❌ Mock      | 内嵌 mock 数据生成                     |
| `subscribeRealTimePositions` | ❌ Mock/TODO | 空实现，预留 WebSocket                 |
| `addTrackRecord`             | ✅ 真实API     | POST `/cosl/api/personTrack/add` |


### 8. platformService


| 方法                | 状态     | 说明                         |
| ----------------- | ------ | -------------------------- |
| `getLayerConfigs` | ❌ Mock | 直接返回 mock 数据               |
| `getPoints`       | ❌ Mock | 调用 `mockGetPlatformPoints` |
| `getStats`        | ❌ Mock | 调用 `mockGetPlatformStats`  |
| `getAlerts`       | ❌ Mock | 调用 `mockGetAlerts`         |


### 9. 无 Service 文件（页面直接调用 Mock）


| Mock 文件                  | 涉及页面                              |
| ------------------------ | --------------------------------- |
| `@/mocks/evacuation`     | EvacuationPage                    |
| `@/mocks/lifeboat`       | ResourcesLifeboatsPage            |
| `@/mocks/room`           | ResourcesPage, ResourcesRoomsPage |
| `@/mocks/systemLifeboat` | SystemLifeboatsPage               |
| `@/mocks/track`          | TracksPage                        |


---

## 二、逐页面详细审计

### 页面 1: LoginPage ✅


| 功能   | 状态      | 需要的API |
| ---- | ------- | ------ |
| 用户登录 | ✅ 真实API | —      |
| 记住密码 | ✅ 本地    | —      |


### 页面 2: DashboardPage ❌


| 功能                 | 状态       | 需要的API                                   |
| ------------------ | -------- | ---------------------------------------- |
| 平台统计数据 (人员/房间/摄像头) | ❌ Mock   | `GET /api/platform/stats`                |
| 地图摄像头点位            | ❌ Mock   | `GET /api/platform/points?layer={layer}` |
| 告警列表               | ❌ Mock   | `GET /api/platform/alerts`               |
| 搜索人员               | ✅ 真实API  | —                                        |
| 用户退出登录             | ⚠️ 半Mock | `POST /api/auth/logout`                  |


### 页面 3: PersonnelPage ⚠️


| 功能          | 状态        | 需要的API                    |
| ----------- | --------- | ------------------------- |
| 人员列表查询(带筛选) | ✅ 真实API   | —                         |
| 新增人员        | ✅ 真实API   | —                         |
| 编辑人员        | ✅ 真实API   | —                         |
| 删除/批量删除人员   | ✅ 真实API   | —                         |
| 导出 POB      | ❌ Mock    | `POST /api/person/export` |
| 查看人员详情弹窗    | ✅ 使用列表行数据 | —                         |


### 页面 4: PersonnelCollectionPage ❌


| 功能              | 状态                              | 需要的API                             |
| --------------- | ------------------------------- | ---------------------------------- |
| Step1: 刷卡读取人员信息 | ❌ Mock (硬编码mockCardData)        | `POST /api/collection/readCard`    |
| Step1: 可用房间列表   | ❌ Mock (硬编码availableRooms)      | `GET /api/room/available`          |
| Step1: 可用救生艇列表  | ❌ Mock (硬编码availableLifeboats)  | `GET /api/lifeboat/available`      |
| Step2: 人脸采集     | ❌ Mock (setTimeout模拟)           | `POST /api/collection/captureFace` |
| Step3: 步态采集     | ❌ Mock (setTimeout+setInterval) | `POST /api/collection/captureGait` |
| Step4: 综合保存登记   | ❌ Mock (setTimeout模拟)           | `POST /api/person/register`        |


### 页面 5: CamerasPage ⚠️


| 功能                    | 状态      | 需要的API                            |
| --------------------- | ------- | --------------------------------- |
| 摄像头列表查询               | ✅ 真实API | —                                 |
| 获取全部摄像头(地图用)          | ✅ 真实API | —                                 |
| 新增/编辑/删除摄像头           | ✅ 真实API | —                                 |
| 批量删除                  | ✅ 真实API | —                                 |
| 摄像头统计 (在线/离线/已配置/未配置) | ❌ Mock  | `GET /api/camera/stats`           |
| 地图拖拽更新摄像头位置           | ❌ Mock  | `POST /api/camera/updatePosition` |
| 清除摄像头位置               | ❌ Mock  | `POST /api/camera/clearPosition`  |
| 导出摄像头                 | ❌ Mock  | `GET /api/camera/export`          |


### 页面 6: TracksPage ❌


| 功能             | 状态                            | 需要的API                                                         |
| -------------- | ----------------------------- | -------------------------------------------------------------- |
| 人员特征列表(左侧面板)   | ❌ Mock (直接导入 `@/mocks/track`) | `GET /api/personTrack/features`                                |
| 搜索/筛选人员特征      | ❌ Mock                        | 同上（带筛选参数）                                                      |
| 获取人员历史轨迹       | ❌ Mock (直接导入 `@/mocks/track`) | `GET /api/personTrack/track?personId={id}&startTime=&endTime=` |
| 获取楼层摄像头位置      | ❌ Mock (直接导入 `@/mocks/track`) | `GET /api/camera/positions?layer={layer}` 或复用 cameraService    |
| 轨迹回放(播放/暂停/速度) | ❌ 依赖mock轨迹数据                  | 依赖上述轨迹接口                                                       |


### 页面 7: DrillPage ⚠️


| 功能         | 状态        | 需要的API                             |
| ---------- | --------- | ---------------------------------- |
| 演习列表查询     | ✅ 真实API   | —                                  |
| 创建/编辑演习    | ✅ 真实API   | —                                  |
| 删除演习记录     | ❌ Mock    | `POST /api/drill/remove?ids={id}`  |
| 批量删除       | ❌ Mock    | `POST /api/drill/remove?ids={ids}` |
| 开始演习(实时模式) | ❌ Mock    | `POST /api/drill/start`            |
| 获取进行中的演习   | ❌ Mock    | `GET /api/drill/active`            |
| 结束演习       | ❌ Mock    | `POST /api/drill/end`              |
| 签到切换(点名)   | ❌ Mock    | `POST /api/drill/togglePersonnel`  |
| 导出演习报告     | ❌ Mock    | `GET /api/drill/export`            |
| 查看演习详情弹窗   | ⚠️ 使用列表数据 | 可能需要 `GET /api/drill/detail?id=`   |


### 页面 8: EvacuationPage ❌


| 功能       | 状态                                 | 需要的API                                  |
| -------- | ---------------------------------- | --------------------------------------- |
| 撤离记录列表   | ❌ Mock (直接导入 `@/mocks/evacuation`) | `POST /api/evacuation/list`             |
| 删除撤离记录   | ❌ Mock                             | `POST /api/evacuation/remove?ids={id}`  |
| 批量删除     | ❌ Mock                             | `POST /api/evacuation/remove?ids={ids}` |
| 获取撤离阈值设置 | ❌ Mock                             | `GET /api/evacuation/settings`          |
| 保存撤离阈值设置 | ❌ Mock                             | `POST /api/evacuation/settings`         |
| 导出撤离记录   | ❌ Mock                             | `GET /api/evacuation/export`            |


### 页面 9: ResourcesPage ❌


| 功能           | 状态                           | 需要的API                         |
| ------------ | ---------------------------- | ------------------------------ |
| 房间列表(按楼层含床位) | ❌ Mock (直接导入 `@/mocks/room`) | `GET /api/room/listWithBeds`   |
| 房间统计         | ❌ Mock                       | `GET /api/room/stats`          |
| 锁定/解锁房间      | ❌ Mock                       | `POST /api/room/toggleLock`    |
| 锁定/解锁床位      | ❌ Mock                       | `POST /api/roomBed/toggleLock` |
| 批量锁定房间       | ❌ Mock                       | `POST /api/room/batchLock`     |


### 页面 10: ResourcesRoomsPage ❌


| 功能               | 状态                           | 需要的API                         |
| ---------------- | ---------------------------- | ------------------------------ |
| 房间列表(含床位和入住人员)   | ❌ Mock (直接导入 `@/mocks/room`) | `GET /api/room/listWithBeds`   |
| 房间统计             | ❌ Mock                       | `GET /api/room/stats`          |
| 锁定/解锁房间          | ❌ Mock                       | `POST /api/room/toggleLock`    |
| 锁定/解锁床位          | ❌ Mock                       | `POST /api/roomBed/toggleLock` |
| 批量锁定/解锁房间        | ❌ Mock                       | `POST /api/room/batchLock`     |
| 拖拽人员换房(DnD) + 保存 | ❌ Mock                       | `POST /api/room/batchMove`     |


### 页面 11: ResourcesLifeboatsPage ❌


| 功能             | 状态                               | 需要的API                              |
| -------------- | -------------------------------- | ----------------------------------- |
| 救生艇列表(按撤离点含座位) | ❌ Mock (直接导入 `@/mocks/lifeboat`) | `GET /api/lifeboat/listWithSeats`   |
| 救生艇统计          | ❌ Mock                           | `GET /api/lifeboat/stats`           |
| 锁定/解锁救生艇       | ❌ Mock                           | `POST /api/lifeboat/toggleLock`     |
| 锁定/解锁座位        | ❌ Mock                           | `POST /api/lifeboatSeat/toggleLock` |
| 批量锁定救生艇        | ❌ Mock                           | `POST /api/lifeboat/batchLock`      |


### 页面 12: SystemUsersPage ✅


| 功能                   | 状态      | 需要的API |
| -------------------- | ------- | ------ |
| 全部功能(列表/增删改/重置密码/导出) | ✅ 真实API | —      |


### 页面 13: SystemRoomsPage ✅


| 功能          | 状态          | 需要的API                  |
| ----------- | ----------- | ----------------------- |
| 房间列表/增删改/导出 | ✅ 真实API     | —                       |
| 批量导入按钮      | ⚠️ 按钮存在但无功能 | `POST /api/room/import` |


### 页面 14: SystemLifeboatsPage ❌


| 功能      | 状态                                     | 需要的API                                |
| ------- | -------------------------------------- | ------------------------------------- |
| 救生艇列表查询 | ❌ Mock (直接导入 `@/mocks/systemLifeboat`) | `POST /api/lifeboat/page`             |
| 新增救生艇   | ❌ Mock                                 | `POST /api/lifeboat/add`              |
| 编辑救生艇   | ❌ Mock                                 | `POST /api/lifeboat/edit`             |
| 删除/批量删除 | ❌ Mock                                 | `POST /api/lifeboat/remove?ids={ids}` |
| 导出救生艇   | ❌ Mock                                 | `GET /api/lifeboat/export`            |
| 批量导入按钮  | ⚠️ 按钮存在但无功能                            | `POST /api/lifeboat/import`           |


### 页面 15: SystemPage ✅


| 功能             | 状态         | 需要的API |
| -------------- | ---------- | ------ |
| 房间管理 Tab       | ✅ 真实API    | —      |
| 用户管理/救生艇管理 Tab | ⚠️ 显示"开发中" | 已有独立页面 |


---

## 三、缺失接口完整清单


| #   | API                            | 方法   | 用途                                         | 涉及页面                              |
| --- | ------------------------------ | ---- | ------------------------------------------ | --------------------------------- |
| 1   | `/api/auth/logout`             | POST | 后端登出(清session)                             | Header (全局)                       |
| 2   | `/api/person/detail`           | GET  | 人员详情                                       | PersonnelPage                     |
| 3   | `/api/person/stats`            | GET  | 人员统计                                       | PersonnelPage                     |
| 4   | `/api/person/export`           | POST | 导出人员 POB                                   | PersonnelPage                     |
| 5   | `/api/person/register`         | POST | 人员综合登记保存                                   | PersonnelCollectionPage           |
| 6   | `/api/collection/readCard`     | POST | 读取 MTS 卡信息                                 | PersonnelCollectionPage           |
| 7   | `/api/collection/captureFace`  | POST | 人脸采集                                       | PersonnelCollectionPage           |
| 8   | `/api/collection/captureGait`  | POST | 步态采集                                       | PersonnelCollectionPage           |
| 9   | `/api/camera/stats`            | GET  | 摄像头统计(在线/离线/已配置/未配置)                       | CamerasPage                       |
| 10  | `/api/camera/updatePosition`   | POST | 更新摄像头地图位置(拖拽)                              | CamerasPage                       |
| 11  | `/api/camera/clearPosition`    | POST | 清除摄像头地图位置                                  | CamerasPage                       |
| 12  | `/api/camera/export`           | GET  | 导出摄像头列表                                    | CamerasPage                       |
| 13  | `/api/personTrack/features`    | GET  | 人员特征列表(带筛选)                                | TracksPage                        |
| 14  | `/api/personTrack/track`       | GET  | 获取人员历史轨迹(参数: personId, startTime, endTime) | TracksPage                        |
| 15  | `/api/camera/positions`        | GET  | 获取楼层摄像头位置(参数: layer)                       | TracksPage                        |
| 16  | `/api/drill/remove`            | POST | 删除演习记录(参数: ids)                            | DrillPage                         |
| 17  | `/api/drill/start`             | POST | 开始演习                                       | DrillPage                         |
| 18  | `/api/drill/active`            | GET  | 获取进行中的演习                                   | DrillPage                         |
| 19  | `/api/drill/end`               | POST | 结束演习                                       | DrillPage                         |
| 20  | `/api/drill/togglePersonnel`   | POST | 演习签到切换(点名)                                 | DrillPage                         |
| 21  | `/api/drill/detail`            | GET  | 演习详情(参数: id)                               | DrillPage                         |
| 22  | `/api/drill/export`            | GET  | 导出演习报告                                     | DrillPage                         |
| 23  | `/api/evacuation/list`         | POST | 撤离记录列表                                     | EvacuationPage                    |
| 24  | `/api/evacuation/remove`       | POST | 删除撤离记录(参数: ids)                            | EvacuationPage                    |
| 25  | `/api/evacuation/settings`     | GET  | 获取撤离阈值设置                                   | EvacuationPage                    |
| 26  | `/api/evacuation/settings`     | POST | 保存撤离阈值设置                                   | EvacuationPage                    |
| 27  | `/api/evacuation/export`       | GET  | 导出撤离记录                                     | EvacuationPage                    |
| 28  | `/api/room/listWithBeds`       | GET  | 房间列表(含床位和入住人员)                             | ResourcesPage, ResourcesRoomsPage |
| 29  | `/api/room/stats`              | GET  | 房间统计(空闲/锁定/占用)                             | ResourcesPage, ResourcesRoomsPage |
| 30  | `/api/room/toggleLock`         | POST | 锁定/解锁房间                                    | ResourcesPage, ResourcesRoomsPage |
| 31  | `/api/room/batchLock`          | POST | 批量锁定房间                                     | ResourcesPage, ResourcesRoomsPage |
| 32  | `/api/room/batchMove`          | POST | 批量调整人员房间(拖拽换房)                             | ResourcesRoomsPage                |
| 33  | `/api/room/import`             | POST | 批量导入房间                                     | SystemRoomsPage, SystemPage       |
| 34  | `/api/room/available`          | GET  | 可用房间列表(登记用)                                | PersonnelCollectionPage           |
| 35  | `/api/roomBed/toggleLock`      | POST | 锁定/解锁床位                                    | ResourcesPage, ResourcesRoomsPage |
| 36  | `/api/lifeboat/page`           | POST | 系统救生艇分页列表                                  | SystemLifeboatsPage               |
| 37  | `/api/lifeboat/add`            | POST | 新增救生艇                                      | SystemLifeboatsPage               |
| 38  | `/api/lifeboat/edit`           | POST | 编辑救生艇                                      | SystemLifeboatsPage               |
| 39  | `/api/lifeboat/remove`         | POST | 删除救生艇(参数: ids)                             | SystemLifeboatsPage               |
| 40  | `/api/lifeboat/export`         | GET  | 导出救生艇                                      | SystemLifeboatsPage               |
| 41  | `/api/lifeboat/import`         | POST | 批量导入救生艇                                    | SystemLifeboatsPage               |
| 42  | `/api/lifeboat/listWithSeats`  | GET  | 救生艇列表(含座位和人员)                              | ResourcesLifeboatsPage            |
| 43  | `/api/lifeboat/stats`          | GET  | 救生艇统计                                      | ResourcesLifeboatsPage            |
| 44  | `/api/lifeboat/toggleLock`     | POST | 锁定/解锁救生艇                                   | ResourcesLifeboatsPage            |
| 45  | `/api/lifeboat/batchLock`      | POST | 批量锁定救生艇                                    | ResourcesLifeboatsPage            |
| 46  | `/api/lifeboat/available`      | GET  | 可用救生艇列表(登记用)                               | PersonnelCollectionPage           |
| 47  | `/api/lifeboatSeat/toggleLock` | POST | 锁定/解锁座位                                    | ResourcesLifeboatsPage            |
| 48  | `/api/platform/stats`          | GET  | 平台统计数据(人员/房间/摄像头等)                         | DashboardPage                     |
| 49  | `/api/platform/points`         | GET  | 平台地图点位(参数: layer)                          | DashboardPage                     |
| 50  | `/api/platform/alerts`         | GET  | 平台告警列表                                     | DashboardPage                     |


---

## 四、总览统计

### 页面接入状态


| 状态           | 页面数 | 页面列表                                                                                                                                               |
| ------------ | --- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| ✅ 100% 真实API | 4   | LoginPage, SystemUsersPage, SystemRoomsPage, SystemPage                                                                                            |
| ⚠️ 部分 Mock   | 3   | PersonnelPage, CamerasPage, DrillPage                                                                                                              |
| ❌ 100% Mock  | 8   | DashboardPage, PersonnelCollectionPage, TracksPage, EvacuationPage, ResourcesPage, ResourcesRoomsPage, ResourcesLifeboatsPage, SystemLifeboatsPage |


### 按模块统计缺失接口数量


| 模块                     | 缺失数量   |
| ---------------------- | ------ |
| 认证 (auth)              | 1      |
| 人员 (person)            | 3      |
| 人员采集 (collection)      | 3      |
| 摄像头 (camera)           | 4      |
| 人员轨迹 (personTrack)     | 2      |
| 演习 (drill)             | 7      |
| 撤离 (evacuation)        | 5      |
| 房间 (room)              | 6      |
| 床位 (roomBed)           | 1      |
| 救生艇 (lifeboat)         | 11     |
| 救生艇座位 (lifeboatSeat)   | 1      |
| 平台总览 (platform)        | 3      |
| 人员登记 (person/register) | 1      |
| 导入 (import)            | 2      |
| **合计**                 | **50** |


### 后端已有但存在问题的接口


| 接口                                | 问题                                            | 影响                    |
| --------------------------------- | --------------------------------------------- | --------------------- |
| `POST /cosl/api/personTrack/list` | SQL 错误: `GROUP BY` 与 `only_full_group_by` 不兼容 | TracksPage 无法使用真实轨迹数据 |


