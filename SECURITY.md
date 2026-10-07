# 安全策略

## 产品边界

帧取 App 是 `framefetch-server` 的受控原生客户端，只处理用户有权获取和分析的内容。App 不在设备上实现平台提取器、DRM 绕过、客户端签名逆向、密钥提取或任意媒体命令。

## 客户端控制

- 只连接用户配置且通过 TLS 校验的服务端；生产环境禁止明文 HTTP 与任意证书信任。
- Access Token 只在内存中；Refresh Credential 只存于 iOS Keychain 或 Android Keystore 支持的安全存储。
- Token、Cookie、完整 URL query、预签名 URL、用户媒体与 AI 原始响应不进入 WebView、剪贴板、日志、崩溃报告或分析事件。
- 外部链接、深链接与服务端地址校验 scheme、host、端口与重定向，拒绝私网探测与开放跳转。
- 文件下载校验任务归属、大小上限、可用空间与服务端提供的完整性信息；失败或取消时清理临时文件。
- 发布签名、证书、Provisioning Profile、商店 API Key 与环境配置不入库。

## 报告漏洞

请通过 GitHub 私有安全报告提交复现条件、影响范围与最小 PoC，不要在公开 Issue 中披露凭据、用户内容或可利用细节。

## 发布门禁

认证、深链接、网络、文件、日志、存储或平台权限的变更必须包含滥用与失败测试，并通过 [CONTRIBUTING.md](CONTRIBUTING.md#本地检查) 的全部检查。
