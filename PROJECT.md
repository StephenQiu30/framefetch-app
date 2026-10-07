# framefetch-app 工程规范

本文规定 `framefetch-app` 的技术栈、架构、目录、命名与接口规则。协作与交付见 [AGENTS.md](AGENTS.md)，产品与技术设计见 [docs/design](docs/design/README.md)，精确依赖版本以 `pubspec.yaml` 与 `pubspec.lock` 为准。

## 1. 职责

面向自托管帧取服务端的 Flutter 客户端，支持 iOS 与 Android：原生认证、链接解析、文件上传、任务与历史、媒体播放、分析结果展示与移动管理。文件由用户通过系统选择器显式选择；下载、播放与导出使用服务端授权接口。

## 2. 技术栈

| 层次 | 选型 | 约束 |
| --- | --- | --- |
| 工具链 | Flutter 3.44.7、Dart 3.12、JDK 21、Xcode 27 | Android JVM target 17；iOS 最低 16.0 |
| 状态与装配 | Riverpod 3 | 唯一状态管理与依赖注入方案 |
| 路由 | go_router + go_router_builder | 声明式类型化路由、深链接与认证重定向 |
| 网络 | Dio + OpenAPI Generator 7.22.0 `dart-dio` | 生成客户端是唯一 REST 入口 |
| 凭据 | flutter_secure_storage | 只保存 Refresh Credential |
| 偏好 | shared_preferences | 只保存非敏感偏好 |
| UI | shadcn_ui 0.57.x + Phosphor Icons 3.x | 唯一组件与图标体系 |
| 主题 | `lib/core/theme/` 语义 Token | 由 Web token 生成，页面不散落视觉常量 |
| 播放 | media_kit / libmpv | 原生依赖经 CocoaPods，`pubspec.yaml` 关闭 Swift Package Manager |
| 系统交互 | file_selector、flutter_file_saver、share_plus、url_launcher | 使用系统原生对话框与授权 |
| 本地化 | Flutter ARB（zh、en） | 所有用户可见文本进入 ARB |
| 验证 | flutter_test、integration_test、flutter analyze | |

- Android/iOS 工程由 `flutter create --platforms=android,ios` 生成；依赖只通过 `flutter pub` 管理并提交 `pubspec.lock`。
- 不引入 Bloc、GetX、Provider、第二套路由器、第二个 HTTP 客户端、第二套设计系统或图标库。
- 本地数据库、WebSocket、崩溃与分析 SDK 等能力只有在真实需求、隐私评审与独立测试齐备时才加入。
- `uses-material-design: true` 只服务于 Flutter SDK 底层依赖，不代表可以新增 Material 风格的业务组件。
- 依赖升级与技术栈替换是独立变更，不夹带在功能改动中。

## 3. 架构

单向数据流：

```text
用户事件 → presentation（Screen / View）
        → application（Controller / State）
        → data（Repository → 生成的 API 客户端）
        → application 产出新的不可变状态 → presentation 渲染
```

- **presentation**：布局、渲染、路由触发、简单显隐与动画；不发请求、不刷新 Token、不映射服务端错误。
- **application**：Riverpod `Controller` 持有页面状态、命令与流程编排，即 Flutter 官方架构中的 ViewModel；项目统一称 Controller，不再引入 ViewModel、Bloc 或 Notifier 表示同一角色。
- **data**：Repository 是数据事实入口，负责请求、解包、缓存、重试与错误转换。Repository 直接是具体类；只有出现第二个实现时才抽出接口。测试通过 Riverpod override 注入替身。
- **domain**（可选）：与 Flutter、网络和持久化无关的业务模型、值对象、规则，以及被多个 Controller 复用的用例；简单透传不建用例。
- Repository 之间不读取彼此内部实现；跨数据源编排放在 Controller 或 domain 用例。
- 页面不维护与 Provider 重复的长期业务状态；测试不依赖真实网络或全局单例。

## 4. 目录

```text
framefetch-app/
├── contracts/openapi/          App 专用 OpenAPI 冻结快照
├── packages/framefetch_server_api/  生成的 Dart API 客户端
├── lib/
│   ├── main.dart / bootstrap.dart
│   ├── app/                    根装配、根路由、根页面与生命周期
│   │   ├── presentation/
│   │   └── router/
│   ├── core/                   无业务语义的基础设施
│   │   ├── config/ network/ routing/ security/
│   │   └── theme/              语义 Token 与 AppTheme
│   ├── features/<feature>/
│   │   ├── presentation/
│   │   ├── application/
│   │   ├── domain/             可选
│   │   └── data/
│   ├── l10n/                   ARB 与生成的本地化代码
│   └── shared/presentation/    多个 feature 稳定复用的 App 级 UI
├── test/                       镜像 lib/ 的单元与 Widget 测试
├── integration_test/           模拟器与真机用户旅程
├── tool/                       check、openapi、设计 Token 同步等可复现入口
├── assets/                     字体、图像
└── docs/design/                产品与技术设计
```

- `app/` 只做全局装配，具体业务不进入根 App 或根路由。
- `core/` 只放配置、网络、安全、路由与主题；不建 `helpers/`、`utils/`、`common/`。
- feature 之间不导入彼此的 `presentation/`、`application/` 或 `data/`。
- `shared/presentation/` 只收两个以上 feature 稳定复用且不携带 feature 语义的 UI；不设 `shared/widgets/`、`shared/models/`。
- 生成内容只在生成目录或 `.g.dart` 文件中，只通过对应工具更新。
- 空目录与 `.gitkeep` 占位不入库。

## 5. 命名

遵循 Effective Dart：目录与文件 `lowercase_with_underscores`；类型 `UpperCamelCase`；变量、方法、Provider 与常量 `lowerCamelCase`；缩写按单词处理（`ApiClient`、`UrlParser`）；布尔值使用 `is`/`has`/`can`/`should` 前缀；不使用 `Manager`、`Helper`、`Utils`、`Common`、`Base` 等不表达职责的名称。

| 职责 | 文件 | 标识符 |
| --- | --- | --- |
| 路由页面 | `<feature>_screen.dart` | `<Feature>Screen` |
| 页面内区域 | `<noun>_view.dart` / `<noun>_section.dart` | `<Noun>View` / `<Noun>Section` |
| 流程与状态拥有者 | `<feature>_controller.dart` | `<Feature>Controller` |
| 不可变状态 | `<feature>_state.dart` | `<Feature>State` |
| Provider 声明 | `<feature>_provider(s).dart` | `<feature>Provider` |
| 数据事实入口 | `<noun>_repository.dart` | `<Noun>Repository` |
| 平台或凭据端口 | `<noun>_gateway.dart` | `<Noun>Gateway` |
| 领域模型 | `<noun>.dart` | `<Noun>` |
| 领域用例 | `<verb>_<noun>_use_case.dart` | `<Verb><Noun>UseCase` |
| 测试 | 镜像源文件的 `*_test.dart`；旅程 `<journey>_flow_test.dart` | 描述可观察行为 |
| 测试替身 | `<noun>_fake(s).dart` | `Fake<Noun>` |

- 路由目的地一律叫 `Screen`，不用 `Page`、`Content` 或编号命名。
- 一个文件聚焦一个主要公开概念，按职责拆分，不按行数机械拆分。
- ARB key 用语义化的 `lowerCamelCase`；测试 Key 用稳定的 `feature-element[-id]` 小写连字符格式。
- 跨目录引用使用 `package:framefetch/...`，同一小目录内可相对引用；不导入其他包的 `lib/src/`；不建 barrel export。
- import 顺序为 Dart SDK、Flutter 与第三方包、本项目，由格式化工具维护。

## 6. 视觉同步

App 与 Web 共享视觉语义与交互状态，不复制 Radix 的 Web 实现。规则见 [design.md](design.md)。

- Web `globals.css` 的主题变量是输入，`tool/sync_design_tokens.mjs` 生成 `core/theme/` 的语义 Token（`background`、`foreground`、`card`、`popover`、`primary`、`secondary`、`muted`、`accent`、`destructive`、`border`、`input`、`ring`、圆角与图表色）。
- 页面只消费语义 Token 与 App 级组件，不写十六进制颜色或临时间距。
- 组件状态覆盖默认、按下、聚焦、禁用、加载、错误与深浅色。shadcn_ui 缺少的组件先在 `shared/presentation/` 建立 Token 驱动的封装并补测试，再用于页面。
- 图标只用 Phosphor；平台必须使用系统控件的场景在对应设计主题中注明。
- Web Token 或核心组件变化时，同步更新 App 映射、组件测试与对应设计主题。

## 7. 接口与运行

- 契约来源是服务端 `/openapi.json`。变更顺序：更新冻结快照 → 生成 `packages/framefetch_server_api/` → 调整 Repository。允许进入 App 的 operation 只在 `tool/openapi/openapi_config.dart` 声明，使用方法见 [tool/openapi/README.md](tool/openapi/README.md)。
- 共享业务接口为 `{code, message, data}` 包装：生成客户端保留 `ApiResponse*` 类型，Repository 是唯一的解包与必填 `data` 校验边界；原生认证接口按 OpenAPI 声明的直接响应处理。错误文案读取 `message`。
- 反序列化、权限、认证与限流失败分别呈现，不统一描述为网络中断。
- 页面不散落 Dio 调用、状态码映射或 Token 刷新；刷新请求单飞，失败后清除会话回到登录。
- 自动重试只用于幂等且可安全重放的请求；创建任务使用服务端幂等键。
- 活动任务与分析通过受控轮询收敛；前后台切换与网络恢复后以服务端查询结果为准。
- `FRAMEFETCH_SERVER_BASE_URL` 指定服务端地址；真机使用设备可达地址，生产构建必须使用有效 HTTPS。
