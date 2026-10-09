# 贡献指南

感谢你改进帧取 App。开始前请阅读 [AGENTS.md](AGENTS.md) 与 [PROJECT.md](PROJECT.md)；运行方式见 [README.md](README.md)，安全问题按 [SECURITY.md](SECURITY.md) 私下报告。

本仓库只维护 Flutter iOS/Android 客户端。API、Web、管理后台、媒体执行、AI Worker 与对象存储属于 [`framefetch-server`](https://github.com/StephenQiu30/framefetch-server)；接口变化先在服务端完成，再更新本仓库的冻结快照。

## 本地检查

```bash
flutter pub get --enforce-lockfile
dart run tool/openapi.dart --from-snapshot --check
dart run tool/check.dart
flutter build apk --debug
flutter build ios --simulator --no-codesign
```

`tool/check.dart` 校验 Flutter 版本并依次执行 `gen-l10n`、`dart format`、`flutter analyze` 与 `flutter test`。涉及核心旅程或平台能力时再运行 `flutter test integration_test`。

生成文件只通过工具更新：

| 修改 | 命令 |
| --- | --- |
| `@TypedGoRoute` | `dart run build_runner build` |
| ARB | `flutter gen-l10n` |
| 冻结 OpenAPI 快照 | `dart run tool/openapi.dart` |
| Web 设计 Token | `node tool/sync_design_tokens.mjs`（`--check` 检查漂移） |

## CI

`flutter-quality.yml` 执行锁文件安装、冻结 OpenAPI 客户端重生成、路由与本地化重生成、生成漂移检查、format、analyze、test 与 Android debug 构建；独立 macOS Job 构建 iOS 模拟器应用。冻结快照检查不连接在线 API，不证明与服务端最新提交一致。

缓存只复用依赖下载，不跳过锁文件安装、代码生成、测试或构建。main 的 CI 按提交 SHA 独立运行；PR 的新提交会取消同一 PR 的旧运行。

每次推送后，检查本次提交对应的运行并等待终态：

```bash
commit_sha=$(git rev-parse HEAD)
gh run list --commit "$commit_sha" --event push --workflow flutter-quality.yml --json databaseId,headSha,status,conclusion,url
gh run watch <run_id> --exit-status --interval 30
gh run view <run_id> --json headSha,status,conclusion,jobs
```

`<run_id>` 取自列表中的本次推送。确认 `headSha` 与 `commit_sha` 相同，且全部必跑 Job 为 `success`，才报告通过；没有运行、进行中、取消或跳过均不算通过。失败时读取 `gh run view <run_id> --log-failed`，修复后重新检查新 SHA。当前提交验证完成后再推进下一次提交；多个本地提交一次推送只会检查最终提交。

## 提交规范

提交信息使用 Conventional Commits，类型与作用域为小写英文，描述为中文：

```text
<type>(<scope>): <中文描述>
```

- 类型：`feat`、`fix`、`refactor`、`docs`、`test`、`perf`、`build`、`ci`、`chore`、`style`、`revert`。
- 作用域使用 feature 或模块名，如 `auth`、`download`、`analysis`、`theme`、`openapi`；无法准确归属时省略，不留空括号。
- 标题不超过 72 个字符，末尾不加标点。
- 破坏性变更在类型或作用域后加 `!`，并在正文写 `BREAKING CHANGE: <中文说明>`。

不提交 Secret、Token、Cookie、用户媒体、签名材料、构建产物或临时文件。
