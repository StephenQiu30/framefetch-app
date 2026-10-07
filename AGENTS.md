# framefetch-app 协作规范

本文件约束在本仓库工作的代码代理与贡献者。技术栈、目录与命名见 [PROJECT.md](PROJECT.md)，视觉映射见 [design.md](design.md)，安全边界见 [SECURITY.md](SECURITY.md)，提交格式与本地检查见 [CONTRIBUTING.md](CONTRIBUTING.md)。规则冲突时以用户最新要求为准，其次是本文件。

## 定位

`framefetch-app` 是帧取的 Flutter 原生客户端，只支持 Android 与 iOS。`framefetch-server` 负责 API、Web、Provider、媒体执行、存储与 AI 分析；本仓库只通过 App 专用 OpenAPI 契约与其协作，不复制、不修改服务端实现。

## 文档

- `docs/design/` 是本仓库唯一的产品与技术设计来源，索引为 `docs/design/README.md`。不另建 PRD、Plan 或 Acceptance 文档。
- 行为、契约或边界变化时同步更新对应设计主题与索引。
- 文档只写当前有效规格，并区分“规格”与“已验证事实”；不写变更日期、阶段编号或迁移过程，历史通过 Git 追溯。
- 不保存临时计划、工作日志、缓存、构建产物、签名材料或本地环境文件。

## 不可违反的边界

- 不启用 Flutter Web，不用 WebView 复用 Web 页面；其他平台须先在 `docs/design/` 建立设计。
- 不在设备上运行 yt-dlp、FFmpeg、提取器或 AI 模型，不保存第三方平台会话。
- 原生鉴权只用 Bearer：Access Token 只在内存，Refresh Credential 只进 Keychain/Keystore；不接入浏览器 Cookie 或 WebView 登录。
- REST 客户端只从冻结的 App 专用 OpenAPI 快照生成，不手写 DTO，不修改生成代码。
- App 不接收 Provider Cookie、平台账号密钥、任意 yt-dlp 参数、shell 输入或私网 URL。

## 修改原则

- 先读相邻代码、对应设计主题与测试，优先复用已有 Controller、Repository 与共享组件。
- 只实现当前需求。不写兼容分支、备用实现、第二套状态管理/路由/网络/设计系统，不保留空目录或转发层。
- 删除时同步清理引用、依赖、生成配置、测试与文档。
- 核心逻辑先写测试（Red → Green → Refactor）；无法先写自动测试时，实现前先定义最接近的可执行验收。
- Web 新增面向用户的页面或内容章节时，同步更新 App 入口、信息层级、ARB 文案与 Widget 测试；因平台边界不实现时在对应设计主题中说明。

## 验证

- 每次改动运行 [CONTRIBUTING.md](CONTRIBUTING.md#本地检查) 中的相关检查。
- 真实鉴权、文件上传下载、深链接、权限与生命周期以与 `framefetch-server` 的真实集成为准；Mock、生成客户端与服务端测试不能替代。
- 视觉改动在模拟器检查明暗主题、窄屏与宽屏、文字缩放、焦点与错误恢复。
- 验证结论只有 `passed`、`failed`、`blocked` 三种；缺少环境、凭据、设备或证据时为 `blocked`。

## Git 与交付

- 开始前和提交后都执行 `git status --short`，保留用户已有改动，不顺带提交无关文件。
- 一个提交对应一个可独立说明、验证和回滚的小任务。
- 只有用户明确要求时才提交、推送、建分支、发起 PR、修改仓库设置或发布商店制品；不改写远端历史，不强制推送。
- 交付说明用中文，包含修改摘要、验证结果与结论、提交哈希、工作区状态，以及剩余风险。
