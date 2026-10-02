// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '帧取';

  @override
  String get openNavigation => '打开导航菜单';

  @override
  String get navigationDescription => '访问素材导入、下载记录、剧本文档、平台状态与账户设置。';

  @override
  String get homeNavigation => '首页';

  @override
  String get downloadHistoryNavigation => '下载记录';

  @override
  String get historyTab => '历史';

  @override
  String get screenplayDocumentsNavigation => '剧本文档';

  @override
  String get documentsTab => '文档';

  @override
  String get providerStatusNavigation => '平台状态';

  @override
  String get statusTab => '状态';

  @override
  String get accountNavigation => '我的';

  @override
  String get downloadHistoryDescription => '继续查看、获取或分析已创建的任务。';

  @override
  String get downloadRowActionsHint => '向左轻扫可查看任务操作。';

  @override
  String get screenplayDocumentsDescription => '查看导入状态、解析信息和剧本正文。';

  @override
  String get documentRowActionsHint => '向左轻扫可管理剧本文档。';

  @override
  String get providerStatusDescription => '这里展示平台的接入与身份要求。下载是否成功以实际文件结果为准。';

  @override
  String get loadingData => '正在加载…';

  @override
  String get loadFailedTitle => '暂时无法读取数据';

  @override
  String get loadFailedDescription => '请检查网络连接后重试。';

  @override
  String get invalidResponseError => '服务响应与当前 App 版本不兼容，请更新 App 或联系服务管理员。';

  @override
  String get forbiddenError => '当前账户没有执行此操作的权限。';

  @override
  String get retryAction => '重新加载';

  @override
  String get refreshAction => '刷新';

  @override
  String get totalLabel => '全部';

  @override
  String get availableLabel => '可用';

  @override
  String get succeededLabel => '已完成';

  @override
  String get activeLabel => '进行中';

  @override
  String get failedLabel => '失败';

  @override
  String get yesLabel => '是';

  @override
  String get noLabel => '否';

  @override
  String get downloadHistoryEmptyTitle => '还没有下载记录';

  @override
  String get downloadHistoryEmptyDescription => '从首页解析链接或导入本地视频后，下载任务会显示在这里。';

  @override
  String get createDownloadFromHomeAction => '去首页创建任务';

  @override
  String get downloadStatusQueued => '排队中';

  @override
  String get downloadStatusRunning => '下载中';

  @override
  String get downloadStatusRetryWait => '等待重试';

  @override
  String get downloadStatusSucceeded => '已完成';

  @override
  String get downloadStatusFailed => '失败';

  @override
  String get downloadStatusCancelled => '已取消';

  @override
  String get downloadStatusUnknown => '状态未知';

  @override
  String get progressLabel => '进度';

  @override
  String get updatedAtLabel => '更新于';

  @override
  String get showingFirstPage => '当前显示最近 20 条';

  @override
  String get failureCancelled => '任务已取消';

  @override
  String get failureTimeout => '处理超时';

  @override
  String get failureStorage => '存储暂时不可用';

  @override
  String get failureGeneric => '处理未完成';

  @override
  String get documentEmptyTitle => '还没有剧本文档';

  @override
  String get documentEmptyDescription => '从首页上传剧本文档后，可在这里查看解析状态与正文。';

  @override
  String get goToScreenplayUploadAction => '去首页上传剧本';

  @override
  String get documentStatusUploading => '等待上传';

  @override
  String get documentStatusVerifying => '正在解析';

  @override
  String get documentStatusReady => '可以核对';

  @override
  String get documentStatusFailed => '解析失败';

  @override
  String get documentStatusCancelled => '已取消';

  @override
  String get documentStatusExpired => '已过期';

  @override
  String get documentStatusUnknown => '状态未知';

  @override
  String get openDocumentDetailsHint => '打开剧本文档详情';

  @override
  String get screenplayDocumentDetailNavigation => '文档详情';

  @override
  String get screenplayDocumentDetailDescription => '查看导入信息、解析摘要和规范化剧本。';

  @override
  String get documentInformationTitle => '导入信息';

  @override
  String documentImportSummary(int attempt, int version) {
    return '第 $attempt 次导入 · 版本 $version';
  }

  @override
  String get documentStoragePolicyLabel => '存储策略';

  @override
  String get documentStoragePersistent => '持久保存';

  @override
  String get documentBasicParsingTitle => '基础解析';

  @override
  String get documentPageCountLabel => '页数';

  @override
  String get documentParagraphCountLabel => '段落';

  @override
  String get documentHeadingCountLabel => '标题';

  @override
  String get documentListItemCountLabel => '列表项';

  @override
  String get documentTableCountLabel => '表格';

  @override
  String get documentDialogueBlockCountLabel => '对白块';

  @override
  String get waitingForParsing => '等待解析';

  @override
  String get chineseLanguage => '中文';

  @override
  String get englishLanguage => '英文';

  @override
  String get mixedLanguage => '中英混合';

  @override
  String get unknownLanguage => '未知';

  @override
  String get normalizedScreenplayTitle => '规范化剧本';

  @override
  String get markdownPreviewLabel => 'Markdown 正文预览';

  @override
  String get documentPreviewUploading => '文件尚未完成上传，上传完成后将自动开始解析。';

  @override
  String get documentPreviewVerifying => '正在提取结构和正文，页面会自动更新。';

  @override
  String get documentPreviewEmpty => '解析已完成，但没有可显示的正文。';

  @override
  String get documentPreviewFailed => '剧本文档未能完成解析，请根据错误信息重新上传。';

  @override
  String get documentPreviewCancelled => '这次剧本文档导入已经取消。';

  @override
  String get documentPreviewExpired => '上传会话已经过期，请返回首页重新上传。';

  @override
  String get documentPreviewTruncatedTitle => '当前显示节选';

  @override
  String get documentPreviewTruncatedDescription => '文档正文较长，此处只显示服务端返回的规范化预览。';

  @override
  String get documentParsingIncompleteTitle => '解析尚未完成';

  @override
  String get documentManualReviewTitle => '建议人工核对';

  @override
  String get documentStorageUnavailable => '文件存储暂时不可用，请稍后重试。';

  @override
  String get documentUploadSessionExpired => '上传会话已过期，请重新上传。';

  @override
  String get documentUploadIncomplete => '文件上传不完整，请重新上传。';

  @override
  String get documentSizeMismatch => '文件大小校验失败，请重新选择原文件。';

  @override
  String get documentIntegrityMismatch => '文件完整性校验失败，请重新上传。';

  @override
  String get documentFormatUnsupported => '服务端不支持这个文档格式。';

  @override
  String get documentEncrypted => '无法解析受密码保护的文档。';

  @override
  String get documentArchiveUnsafe => '文档压缩结构不安全，已停止处理。';

  @override
  String get documentTextUnavailable => '文档中没有可提取的文本。';

  @override
  String get documentStructureInvalid => '文档结构无法识别。';

  @override
  String get documentSceneHeadingMissing => '部分场景缺少标准场景标题。';

  @override
  String get documentManualReviewRequired => '解析结果需要人工核对。';

  @override
  String get fileSizeLabel => '文件大小';

  @override
  String get sceneCountLabel => '场景';

  @override
  String get characterCountLabel => '字符';

  @override
  String get languageLabel => '语言';

  @override
  String get providerEmptyTitle => '暂无平台状态';

  @override
  String get providerEmptyDescription => '服务端当前没有公开的平台能力记录，请稍后刷新。';

  @override
  String get downloadAvailableLabel => '下载可用';

  @override
  String get capabilitiesLabel => '能力';

  @override
  String get userActionLabel => '建议操作';

  @override
  String get providerStatusDisabled => '已停用';

  @override
  String get providerStatusUnsupported => '不支持';

  @override
  String get capabilitySingleVideo => '单视频';

  @override
  String get capabilityShortVideo => '短视频';

  @override
  String get capabilityClipOrVod => '片段或点播';

  @override
  String get capabilityAudioVideoSplit => '音视频分离';

  @override
  String get capabilitySubtitles => '字幕';

  @override
  String get capabilityImageOrCarousel => '图片或图集';

  @override
  String get capabilityLive => '直播';

  @override
  String get capabilityPlaylist => '播放列表';

  @override
  String get accountDescription => '管理用户名与头像；管理员还可调整账户身份。';

  @override
  String get appearanceSection => '外观';

  @override
  String get accountSection => '账户';

  @override
  String get helpSection => '帮助与产品';

  @override
  String get guideNavigation => '使用指南';

  @override
  String get guideEntryDescription => '了解素材导入、AI 分析、客户端分工与自托管边界。';

  @override
  String get darkThemeLabel => '深色外观';

  @override
  String get themeToggleDescription => '在深色与浅色主题间切换';

  @override
  String get switchToDarkTheme => '切换到深色主题';

  @override
  String get switchToLightTheme => '切换到浅色主题';

  @override
  String get publicHomeEyebrow => '帧取 FrameFetch · 开源视频工作流';

  @override
  String get publicHomeTitle => '把素材，\n带回本地。';

  @override
  String get publicHomeDescription =>
      '开源、自托管地完成公开视频解析、本地视频与剧本文档导入、制品管理和 AI 分析。数据与运行边界由你掌控。';

  @override
  String get publicRegisterAction => '创建本地账户';

  @override
  String get publicSourceAction => '查看源代码';

  @override
  String get publicWorkflowTitle => '一套可审计的完整链路';

  @override
  String get publicWorkflowInspectTitle => '解析';

  @override
  String get publicWorkflowInspectDescription => '识别公开媒体或文章中的候选视频';

  @override
  String get publicWorkflowSelectTitle => '选择';

  @override
  String get publicWorkflowSelectDescription => '确认目标与格式，避免隐式下载';

  @override
  String get publicWorkflowExecuteTitle => '执行';

  @override
  String get publicWorkflowExecuteDescription => '由隔离 Worker 处理下载、导入和分析';

  @override
  String get publicWorkflowDeliverTitle => '交付';

  @override
  String get publicWorkflowDeliverDescription => '通过授权短时入口预览或获取制品';

  @override
  String get publicCapabilitiesEyebrow => '核心功能';

  @override
  String get publicHomeCapabilitiesTitle => '视频解析、剧本处理与 AI 分析';

  @override
  String get publicHomeCapabilitiesDescription =>
      'Web 控制面、API 与 Worker 共享同一套权限、任务和制品模型，适合个人本地使用，也便于团队自托管。';

  @override
  String get publicVideoEyebrow => '公开视频';

  @override
  String get publicVideoTitle => '公开视频工作流';

  @override
  String get publicVideoDescription => '解析有权处理的公开链接，选择真实可用格式，并跟踪下载与最终制品。';

  @override
  String get publicDocumentEyebrow => '剧本文档';

  @override
  String get publicDocumentTitle => '剧本与文档处理';

  @override
  String get publicDocumentDescription => '导入获授权的剧本文档，在同一工作区完成规范化、分析与处理记录。';

  @override
  String get publicAnalysisEyebrow => 'AI 分析';

  @override
  String get publicAnalysisTitle => '结构化 AI 视频分析';

  @override
  String get publicAnalysisDescription => '围绕场景、分镜、高光和内容资产生成结构化结果与运行证据。';

  @override
  String get publicTrustEyebrow => '自托管架构';

  @override
  String get publicTrustTitle => '开源，不交出数据控制权';

  @override
  String get publicTrustDescription =>
      'FastAPI、Next.js、PostgreSQL、RabbitMQ、MinIO、FFmpeg 与 yt-dlp 组成可独立部署的工作流。MIT 许可证允许你免费检查、修改和自托管。';

  @override
  String get publicSafeguardSession => '浏览器会话采用 HttpOnly Cookie；原生客户端使用可轮换令牌。';

  @override
  String get publicSafeguardWorkers => '下载、导入与 AI 分析通过独立队列和 Worker 执行。';

  @override
  String get publicSafeguardArtifacts => '短时制品入口、所有者隔离与授权边界贯穿完整链路。';

  @override
  String get publicSafeguardAuthorization => '公开视频并不等于可自由使用，请仅处理已获授权的内容。';

  @override
  String get publicSafetyEyebrow => '安全边界';

  @override
  String get publicSafetyTitle => '运行与授权边界';

  @override
  String get publicSafetyDescription => '把访问、执行和交付拆成可检查的边界。';

  @override
  String get publicFaqEyebrow => '常见问题';

  @override
  String get publicFaqTitle => '开始使用前，先了解这些';

  @override
  String get publicFaqDescription => '了解输入、分析结果、运行成本与移动端支持范围。';

  @override
  String get publicFaqWhatQuestion => '帧取 FrameFetch 是什么？';

  @override
  String get publicFaqWhatAnswer =>
      '帧取是面向创作者、内容研究者和开发者的 MIT 开源自托管视频解析与 AI 分析平台。它把已获授权的媒体链接、本地视频和剧本文档组织为任务，并提供素材管理、结构化分析与报告导出。';

  @override
  String get publicFaqReportsQuestion => 'AI 视频分析可以输出什么？';

  @override
  String get publicFaqReportsAnswer =>
      '按所选分析能力生成场景、分镜、时间轴和关键帧证据等结构化结果，报告可导出为 Markdown 或 DOCX。AI 分析需要配置可用的模型服务与 AI Worker；模型结论需要结合原始素材复核。';

  @override
  String get publicFaqImportQuestion => '可以直接分析本地视频和剧本吗？';

  @override
  String get publicFaqImportAnswer =>
      '可以导入自己有权处理的本地视频与剧本文档。剧本支持 Markdown、Fountain、TXT、PDF 和 DOCX；导入后可在工作区阅读和发起分析，无需先提供第三方平台链接。';

  @override
  String get publicFaqCostQuestion => '开源免费是否意味着运行没有成本？';

  @override
  String get publicFaqCostAnswer =>
      '源代码以 MIT 许可证开放，可自行部署、使用和修改。服务器、对象存储、网络流量和外部 AI 模型可能产生费用；本项目不承诺免费托管或免费模型额度。';

  @override
  String get publicFaqPlatformsQuestion => '是否支持所有视频平台和所有链接？';

  @override
  String get publicFaqPlatformsAnswer =>
      '不保证所有平台或链接可用。实际能力取决于部署实例的 Provider 配置、内容授权、访问条件和最近验证结果；应先检查链接再选择格式。公开可访问不等于获得使用授权。';

  @override
  String get publicFaqMobileQuestion => '手机端是否能独立运行 AI 分析？';

  @override
  String get publicFaqMobileAnswer =>
      'iOS 和 Android 客户端位于独立的 video-app 仓库，使用 Flutter 构建并连接自托管 video-server。媒体处理与 AI 推理由服务端执行，手机端不内置离线提取器或离线 AI 模型。';

  @override
  String get publicGuideAction => '阅读视频分析与自托管使用指南';

  @override
  String get publicStartEyebrow => '快速开始';

  @override
  String get publicStartTitle => '在自己的基础设施上运行 FrameFetch';

  @override
  String get publicStartDescription =>
      '从仓库的 Quick Start、架构文档和安全边界开始，按需启用媒体解析、剧本工作流与 AI 服务。';

  @override
  String get publicDeploymentAction => '阅读部署说明';

  @override
  String get publicGuideEyebrow => 'FrameFetch 使用指南';

  @override
  String get publicGuideTitle => '从素材到分析报告';

  @override
  String get publicGuideDescription =>
      '了解 FrameFetch 如何导入授权视频与剧本文档、执行 AI 分镜分析并导出 Markdown / DOCX 报告，以及 Web、Flutter 客户端和自托管服务端的分工。';

  @override
  String get publicGuideNotice => '本指南介绍当前产品流程。配置与实现以链接的仓库文档为准，实例可用性以实际检查结果为准。';

  @override
  String get publicGuideVideoTitle => '如何从视频得到可复核的 AI 分析报告？';

  @override
  String get publicGuideVideoParagraphOne =>
      '先导入自己拥有或已获授权的本地视频，也可以检查公开媒体链接、确认可用格式并创建任务。视频完成处理后，在任务详情选择分析能力并提交 AI 分析任务。';

  @override
  String get publicGuideVideoParagraphTwo =>
      '服务端 AI Worker 执行分析，页面展示场景、分镜时间轴、关键帧证据等结构化结果。不同分析能力输出不同内容；报告支持 Markdown 与 DOCX 导出，便于继续整理、审阅和分享。关键结论应对照视频与证据复核。';

  @override
  String get publicGuideVideoParagraphThree =>
      '媒体处理成功不代表分析已经完成；AI 服务不可用时，检查管理员配置的模型 Provider 与 AI Worker 状态。';

  @override
  String get publicGuideVideoSource => '查看 AI 视频分析与报告能力';

  @override
  String get publicGuideScreenplayTitle => '如何处理剧本文档？';

  @override
  String get publicGuideScreenplayParagraphOne =>
      '在剧本文档工作区导入 Markdown、Fountain、TXT、PDF 或 DOCX。导入后可阅读规范化文档、查看目录并发起分析或改写，结果与处理记录保存在同一工作区。';

  @override
  String get publicGuideScreenplayParagraphTwo =>
      '文档是否能够完整提取取决于原文件结构。扫描件、复杂版式或缺失文本的文件需要检查导入结果，不能仅凭任务成功就判断原文已经完整保留。';

  @override
  String get publicGuideScreenplaySource => '查看当前文档处理能力';

  @override
  String get publicGuideDeploymentTitle => '自托管需要部署哪些服务？';

  @override
  String get publicGuideDeploymentParagraphOne =>
      'video-server 包含 Next.js Web 页面、FastAPI API，以及独立的下载、媒体处理与 AI Worker。Docker Compose 管理业务服务，并连接部署者已有的 PostgreSQL、RabbitMQ、Redis 和 MinIO。默认 Web 端口为 8101，API 端口为 8111。';

  @override
  String get publicGuideDeploymentParagraphTwo =>
      '使用根 README 的快速开始说明安装和配置，按实际需求启用模型服务与媒体 Provider。MIT 许可证开放源代码；基础设施、存储、流量和外部模型的费用由部署者承担。';

  @override
  String get publicGuideDeploymentParagraphThree =>
      '自托管不表示数据永远不离开设备：使用外部 AI Provider 时，分析所需内容会发送到该服务。启用模型前应核对其数据处理约定，并确认素材可用于该分析。';

  @override
  String get publicGuideDeploymentSource => '阅读自托管部署步骤';

  @override
  String get publicGuideClientsTitle => 'Web 与 iOS / Android 客户端如何选择？';

  @override
  String get publicGuideClientsParagraphOne =>
      'Web 随 video-server 部署，适合在浏览器中管理素材、任务、分析报告与管理员配置。video-app 是单独维护的 Flutter 原生客户端，面向 iOS 和 Android，需要连接可访问的 video-server。';

  @override
  String get publicGuideClientsParagraphTwo =>
      '手机端负责上传、任务操作与结果展示，媒体处理与 AI 推理仍由服务端完成。当前移动端从源码构建，不提供 App Store 或 Google Play 预构建安装包，也不提供离线 AI。';

  @override
  String get publicGuideClientsSource => '查看 Flutter 移动客户端与构建说明';

  @override
  String get publicGuideAvailabilityTitle => '为什么同一个平台的不同链接会有不同结果？';

  @override
  String get publicGuideAvailabilityParagraphOne =>
      '平台支持由部署实例、Provider 版本、访问条件和内容授权共同决定。存在某个平台的适配器，并不意味着该平台的所有链接均可处理。以当前实例的链接检查、Provider 状态与最终文件验证为准。';

  @override
  String get publicGuideAvailabilityParagraphTwo =>
      '默认匿名流程面向可正向确认的公开、免费、非 DRM 内容。只处理自己有权使用的素材；账号能看到内容不能替代下载、导出或后续使用授权。';

  @override
  String get publicGuideAvailabilitySource => '查看能力范围与运行边界';

  @override
  String get publicExternalLinkError => '暂时无法打开外部链接';

  @override
  String get downloadDetailNavigation => '任务详情';

  @override
  String get downloadDetailDescription => '查看任务当前执行状态、文件可用性与处理信息。';

  @override
  String get sourceLabel => '来源';

  @override
  String get formatLabel => '格式';

  @override
  String get stageLabel => '执行阶段';

  @override
  String get attemptLabel => '执行次数';

  @override
  String get fileAvailabilityLabel => '文件状态';

  @override
  String get createdAtLabel => '创建时间';

  @override
  String get finishedAtLabel => '完成时间';

  @override
  String get durationLabel => '媒体时长';

  @override
  String get fileAvailable => '文件可获取';

  @override
  String get fileCleared => '文件已清理';

  @override
  String get downloadStageRevalidating => '重新校验';

  @override
  String get downloadStageDownloading => '正在下载';

  @override
  String get downloadStageRemuxing => '封装处理中';

  @override
  String get downloadStageVerifying => '正在验证';

  @override
  String get downloadStageUploading => '正在保存';

  @override
  String get downloadStageUnknown => '阶段未知';

  @override
  String get formatUnavailable => '格式信息暂不可用';

  @override
  String get loginAction => '登录';

  @override
  String get registerAction => '注册';

  @override
  String get welcomeBack => '欢迎回来';

  @override
  String get loginDescription => '使用你的帧取账户继续管理下载、文档与分析。';

  @override
  String get createAccountTitle => '创建你的帧取账户';

  @override
  String get registerDescription => '验证邮箱后创建账户，保存和管理你的下载、文档与分析。';

  @override
  String get emailLabel => '邮箱地址';

  @override
  String get usernameLabel => '用户名';

  @override
  String get usernameHelp => '2–32 个字符，仅支持字母、数字、中文以及 _-. 字符。';

  @override
  String get passwordLabel => '密码';

  @override
  String get confirmPasswordLabel => '确认密码';

  @override
  String get showPassword => '显示密码';

  @override
  String get hidePassword => '隐藏密码';

  @override
  String get loginSubmit => '登录';

  @override
  String get loginSubmitting => '正在登录…';

  @override
  String get registerSubmit => '注册并登录';

  @override
  String get registerSubmitting => '正在创建…';

  @override
  String get goRegister => '创建账户';

  @override
  String get goLogin => '返回登录';

  @override
  String get noAccountPrompt => '还没有账户？';

  @override
  String get hasAccountPrompt => '已有账户？';

  @override
  String get invalidEmail => '请输入有效的邮箱地址';

  @override
  String get invalidUsername => '用户名需为 2–32 个字符，仅支持字母、数字、中文以及 _-. 字符。';

  @override
  String get invalidPassword => '密码至少需要 8 个字符';

  @override
  String get passwordMismatch => '两次输入的密码不一致';

  @override
  String get invalidCredentialsError => '邮箱或密码错误，请重新输入。';

  @override
  String get emailRegisteredError => '该邮箱已注册，请直接登录或使用其他邮箱。';

  @override
  String get usernameRegisteredError => '该用户名已被使用，请更换后重试。';

  @override
  String get unauthenticatedError => '登录状态已失效，请重新登录。';

  @override
  String get rateLimitedError => '操作过于频繁，请稍后再试。';

  @override
  String get serviceUnavailableError => '暂时无法连接服务，请检查网络后重试。';

  @override
  String get unknownAuthError => '操作未完成，请稍后重试。';

  @override
  String get sessionRestoring => '正在恢复登录状态…';

  @override
  String get signedOutTitle => '登录后继续';

  @override
  String get signedOutDescription => '登录或注册后可查看账户资料，并访问与身份关联的任务。';

  @override
  String get signedInAs => '当前账户';

  @override
  String get logoutAction => '退出登录';

  @override
  String get loggingOut => '正在退出…';

  @override
  String get downloadHomeTitle => '把素材，带回本地。';

  @override
  String get downloadHomeDescription => '解析公开视频、图片与合集链接，或上传本地视频与剧本文档。';

  @override
  String get linkIntakeMode => '链接解析';

  @override
  String get videoIntakeMode => '本地视频';

  @override
  String get screenplayIntakeMode => '剧本文档';

  @override
  String get linkIntakeSupport => '支持粘贴公开链接或分享文案；文章包含多个视频时，请选择要处理的内容。';

  @override
  String get videoIntakeTitle => '导入本地视频';

  @override
  String get videoIntakeDescription =>
      '选择你拥有或已获授权的 MP4 视频，服务端完成隔离校验后进入下载记录与 AI 分析。';

  @override
  String get selectVideoFile => '选择视频文件';

  @override
  String get reimportDownloadAction => '返回首页重新导入';

  @override
  String get screenplayIntakeTitle => '导入剧本文档';

  @override
  String get screenplayIntakeDescription =>
      '选择 DOCX、PDF、TXT、Markdown 或 Fountain 文件，服务端会生成可分析和改写的规范化预览。';

  @override
  String get selectScreenplayFile => '选择剧本文件';

  @override
  String get choosingUploadFile => '正在选择文件…';

  @override
  String get hashingUploadFile => '正在校验文件…';

  @override
  String get creatingUpload => '正在创建上传任务…';

  @override
  String get uploadingFile => '正在上传…';

  @override
  String get cancelUploadAction => '取消上传';

  @override
  String get completingUpload => '正在完成上传…';

  @override
  String get emptyUploadFileError => '请选择包含内容的文件。';

  @override
  String get invalidVideoFileError => '当前只支持上传 MP4 视频。';

  @override
  String get invalidDocumentFileError =>
      '支持 DOCX、PDF、TXT、Markdown 和 Fountain 剧本。';

  @override
  String get documentTooLargeError => '剧本文档不能超过 50 MB。';

  @override
  String get fileSelectionFailedError => '无法打开系统文件选择器，请重试。';

  @override
  String get inaccessibleFileError => '无法读取所选文件，请重新选择。';

  @override
  String get fileUploadFailed => '文件上传失败，请检查网络后重试。';

  @override
  String get mediaUrlHint => '粘贴公开链接或整段分享文案';

  @override
  String get mediaUrlLabel => '公开内容地址';

  @override
  String get clearMediaUrl => '清空链接';

  @override
  String get inspectMedia => '解析媒体';

  @override
  String get intentAutomaticAccess => '系统会自动选择公开访问路线。仅在明确获得授权时选择其他策略。';

  @override
  String get activityHistoryEmpty => '暂无处理记录';

  @override
  String get clearFiltersAction => '清空筛选';

  @override
  String get providerNoCapabilities => '暂无已登记能力';

  @override
  String get providerFileResultHint => '下载结果以实际文件为准。';

  @override
  String get intentQueued => '等待解析';

  @override
  String get intentResolving => '正在解析媒体';

  @override
  String get intentExpired => '解析结果已过期';

  @override
  String get intentFailed => '解析未能完成';

  @override
  String get intentCancelled => '解析已取消';

  @override
  String get intentRefreshAction => '更新解析结果';

  @override
  String get intentCancelling => '正在取消解析';

  @override
  String get intentCancelAction => '取消解析';

  @override
  String get intentHistoryAction => '查看解析记录';

  @override
  String get intentHandedOff => '已创建下载任务';

  @override
  String get intentRefreshHint => '更新后需重新确认下载规格。';

  @override
  String get inspectingMedia => '解析中…';

  @override
  String get mediaUrlError => '请输入有效的公开 HTTP(S) 视频地址。';

  @override
  String get publicInputRequired => '请输入公开链接或完整分享文案。';

  @override
  String get operationFailed => '操作未完成，请稍后重试。';

  @override
  String get deletionBlockedByAnalysis => '资源正在被分析使用，请先结束相关分析后再删除。';

  @override
  String get inspectionResultTitle => '解析结果';

  @override
  String get formatSelectionTitle => '选择下载格式';

  @override
  String get formatSelectionDescription => '格式来自本次真实解析结果，创建后可在下载记录查看进度。';

  @override
  String get createDownloadAction => '创建下载任务';

  @override
  String get creatingDownload => '正在创建…';

  @override
  String get sourceCandidatesTitle => '选择文章中的视频';

  @override
  String get sourceCandidatesDescription => '该文章包含多个媒体来源，请明确选择要处理的视频。';

  @override
  String get sourceCandidatesEmpty => '文章中没有发现可处理的视频。';

  @override
  String get candidateUnavailable => '当前来源不可处理';

  @override
  String get mediaUnavailableTitle => '当前媒体不可下载';

  @override
  String get mediaUnavailableDescription => '服务端未批准创建下载任务。请根据提示更换公开链接或处理方式。';

  @override
  String get noFormatsAvailable => '解析成功，但没有可创建任务的下载格式。';

  @override
  String imageGalleryFormatDetails(Object count) {
    return '$count 张原图 · ZIP';
  }

  @override
  String videoCollectionFormatDetails(Object count) {
    return '$count 个视频 · ZIP';
  }

  @override
  String get providerTemporaryError => '媒体平台当前无法完成验证，请稍后重试。';

  @override
  String routeCooldownUntil(String time) {
    return '默认线路最早重试时间：$time；到期仍需验证恢复。';
  }

  @override
  String get providerRouteConfigured => '线路已配置';

  @override
  String get providerContextObserved => '上下文可达；来源和内容授权仍需验证';

  @override
  String get providerContextMissing => '上下文不可达或尚未确认';

  @override
  String get providerRestrictedError => '该媒体为私有或受访问权限限制，无法处理。';

  @override
  String get providerLinkError => '分享链接已失效或无法定位视频，请复制新的公开分享链接。';

  @override
  String get providerUnsupportedError => '该链接不包含受支持的可下载视频，请更换链接。';

  @override
  String get durationLimitError => '该媒体时长超过服务允许的上限。';

  @override
  String get articleRestrictedError => '文章需要验证、关注或付费，无法安全读取媒体来源。';

  @override
  String get articleDiscoveryError => '无法读取文章中的媒体来源，请确认文章公开且链接有效。';

  @override
  String get legalMediaStatus => '请仅提交你有权处理的公开链接';

  @override
  String get privacyStatus => '请勿提交包含账号或访问凭据的链接';

  @override
  String get mediaCoverPending => '封面生成中';

  @override
  String get mediaCoverUnavailable => '暂无封面';

  @override
  String get mediaCoverLabel => '视频封面';

  @override
  String get watchVideoAction => '观看';

  @override
  String get getFileAction => '获取文件';

  @override
  String get playbackFailed => '暂时无法播放视频，请重新获取播放地址。';

  @override
  String get downloadOpenFailed => '无法打开系统下载，请稍后重试。';

  @override
  String get aiAnalysisTitle => 'AI 智能分析';

  @override
  String get aiAnalysisDescription => '由 AI 观察视频画面，生成连续分镜、视觉高光、资产目录，或将视频整理成文章。';

  @override
  String get screenplayAnalysisTitle => '剧本分析与改写';

  @override
  String get screenplayAnalysisDescription =>
      '选择综合分析、结构审阅或中英文改写；任务绑定当前规范化剧本，不会修改原文。';

  @override
  String get analysisSkillLabel => '分析 Skill';

  @override
  String get analysisOutputLanguageLabel => '输出语言';

  @override
  String get simplifiedChineseLabel => '简体中文';

  @override
  String get englishLabel => 'English';

  @override
  String get analysisPromptLabel => '分析重点';

  @override
  String get analysisPromptDescription => '可修改或清空分析重点；工具权限、安全边界与结果结构不可修改。';

  @override
  String get restoreDefaultPrompt => '恢复默认值';

  @override
  String get startAnalysisAction => '开始 AI 分析';

  @override
  String get startingAnalysis => '正在创建分析…';

  @override
  String get analysisSkillsEmpty => '当前没有可用的分析 Skill，请检查 AI 服务配置后重试。';

  @override
  String get analysisLoadFailed => '暂时无法读取 AI 分析服务。';

  @override
  String get analysisStatusQueued => '等待分析';

  @override
  String get analysisStatusRunning => '正在分析';

  @override
  String get analysisStatusRetryWait => '等待重试';

  @override
  String get analysisStatusSucceeded => '分析已完成';

  @override
  String get analysisStatusFailed => '分析失败';

  @override
  String get analysisStatusCancelled => '分析已取消';

  @override
  String get analysisStagePreparing => '准备输入';

  @override
  String get analysisStageAnalyzing => '执行 AI 分析';

  @override
  String get analysisStageValidating => '校验结构化结果';

  @override
  String get analysisStagePublishing => '发布分析报告';

  @override
  String get analysisStagePending => '等待调度';

  @override
  String analysisRunSummary(int run, int attempt) {
    return '第 $run 次执行 · 本次第 $attempt 个技术尝试';
  }

  @override
  String analysisProgressSemantics(int progress) {
    return '分析进度 $progress%';
  }

  @override
  String get refreshAnalysisAction => '刷新分析';

  @override
  String get cancelAnalysisAction => '取消分析';

  @override
  String get cancelAnalysisTitle => '取消当前分析任务？';

  @override
  String get cancelAnalysisDescription => '确认后将停止当前分析。你之后仍可重新发起分析任务。';

  @override
  String get continueAnalysisAction => '继续分析';

  @override
  String get confirmCancelAnalysis => '确认取消分析';

  @override
  String get retryAnalysisAction => '重试分析';

  @override
  String get retryingAnalysis => '正在重试…';

  @override
  String get deleteAnalysisAction => '删除分析';

  @override
  String get deletingAnalysis => '正在删除…';

  @override
  String get deleteAnalysisTitle => '删除这次分析？';

  @override
  String get deleteAnalysisDescription => '分析结果与报告将被清理，此操作无法撤销。下载文件不会受到影响。';

  @override
  String get confirmDeleteAnalysis => '确认删除';

  @override
  String get analysisOperationFailed => 'AI 分析操作未完成，请稍后重试。';

  @override
  String get analysisExecutionFailed => 'AI 分析执行失败，请稍后重试。';

  @override
  String get analysisServiceUnavailable => 'AI 分析服务暂时不可用，请稍后重试。';

  @override
  String get analysisAuthenticationRequired => 'AI 分析服务未登录，请完成登录后重试。';

  @override
  String get analysisTimeoutError => 'AI 分析超时，请稍后重试。';

  @override
  String get analysisInvalidResult => 'AI 返回结果未通过校验，请重新分析。';

  @override
  String get screenplayStoryOverview => '故事概览';

  @override
  String get screenplayLoglineLabel => '一句话梗概';

  @override
  String get screenplaySynopsisLabel => '故事梗概';

  @override
  String get screenplaySceneCoverageLabel => '逐场景覆盖';

  @override
  String get screenplayMainCharactersLabel => '主要人物';

  @override
  String get screenplaySourceScenesLabel => '源场景';

  @override
  String get screenplayOutputScenesLabel => '输出场景';

  @override
  String get screenplayRewriteSummaryTitle => '修改摘要';

  @override
  String get screenplayGlossaryTitle => '统一术语';

  @override
  String get screenplayFullReportTitle => '完整报告';

  @override
  String get screenplayStructuredResultTitle => '结构化结果';

  @override
  String get analysisResourceLimit => '视频超出分析资源限制，请使用更短或更小的视频。';

  @override
  String get analysisInputUnavailable => '用于分析的视频文件已不可用，请重新创建下载任务。';

  @override
  String get screenplayAnalysisInputUnavailable => '用于分析的剧本文档已不可用，请重新上传剧本。';

  @override
  String get analysisUsageLimited => 'AI 服务额度不足，请恢复可用额度后重试。';

  @override
  String get analysisWorkerLost => '分析执行服务连接中断，请稍后重试。';

  @override
  String get shotCountLabel => '分镜';

  @override
  String get visualAssetCountLabel => '视觉资产';

  @override
  String get visualSummaryTitle => '视觉摘要';

  @override
  String get productionAdviceTitle => '制作建议';

  @override
  String get analysisResultSectionLabel => '结果分类';

  @override
  String get analysisScenesTab => '场景';

  @override
  String get analysisShotsTab => '分镜';

  @override
  String get analysisHighlightsTab => '高光';

  @override
  String get analysisAssetsTab => '资产';

  @override
  String get analysisReportTab => '报告预览';

  @override
  String get openAnalysisReportAction => '打开报告预览';

  @override
  String get analysisReportLoading => '正在准备报告预览…';

  @override
  String get downloadAnalysisReportAction => '导出 Markdown';

  @override
  String get exportAnalysisReportAction => '分享报告';

  @override
  String get analysisReportDownloaded => '报告已保存到你选择的位置。';

  @override
  String get analysisReportDownloadFailed => '无法保存报告，请稍后重试。';

  @override
  String get analysisReportExportFailed => '无法导出报告，请稍后重试。';

  @override
  String get analysisEmptySection => '当前分类没有识别结果。';

  @override
  String loadMoreAnalysisResults(int count) {
    return '加载更多（剩余 $count 项）';
  }

  @override
  String get highlightScoreLabel => '评分';

  @override
  String get articleKeyPointsTitle => '核心观点';

  @override
  String get articleClosingTitle => '结语';

  @override
  String get articleLimitationsTitle => '事实说明';

  @override
  String get articleEvidenceLabel => '画面证据';

  @override
  String get assetTypePerson => '人物';

  @override
  String get assetTypeLocation => '地点';

  @override
  String get assetTypeObject => '物体';

  @override
  String get assetTypeProduct => '产品';

  @override
  String get assetTypeLogo => '标志';

  @override
  String get assetTypeOnScreenText => '画面文字';

  @override
  String get adminCenterTitle => '管理中心';

  @override
  String get adminCenterDescription => '查看全局运行数据，并处理高频管理事项。';

  @override
  String get adminAnalyticsTitle => '使用统计';

  @override
  String get adminAnalyticsDescription => '查看下载表现与 AI 分析执行情况。';

  @override
  String get adminFilesTitle => '文件管理';

  @override
  String get adminFilesDescription => '查看已保存文件的类型、大小和创建时间，或删除单个文件。';

  @override
  String get adminUsersTitle => '用户管理';

  @override
  String get adminUsersDescription => '查找账户，并在不离开当前页面的情况下调整角色与启用状态。';

  @override
  String get adminProvidersTitle => '平台目录';

  @override
  String get adminProvidersDescription =>
      '维护平台状态页的名称、排序与可见性。下载域名和执行能力由系统 Profile 控制。';

  @override
  String get adminAiProvidersTitle => 'AI 服务';

  @override
  String get adminAiProvidersDescription =>
      '默认使用服务端本机 Codex；可在这里新增并启用第三方 API。切换后从下一次分析任务生效，无需修改环境文件。';

  @override
  String adminDays(int days) {
    return '$days 天';
  }

  @override
  String get adminSuccessRate => '成功率';

  @override
  String get adminDownloadedBytes => '下载量';

  @override
  String get adminSourceBreakdown => '来源分布';

  @override
  String adminFileCount(int count) {
    return '共 $count 项持久文件';
  }

  @override
  String get adminFilesEmpty => '暂无持久文件';

  @override
  String get adminFilesEmptyDescription => '当前没有需要管理员处理的持久文件。';

  @override
  String adminUserCount(int count) {
    return '共 $count 位用户';
  }

  @override
  String get adminRoleLabel => '角色';

  @override
  String get adminRoleUser => '普通用户';

  @override
  String get adminRoleAdmin => '管理员';

  @override
  String get adminAccountActive => '允许登录和访问服务';

  @override
  String get adminAccountEnabled => '已启用';

  @override
  String get adminAccountDisabled => '已停用';

  @override
  String get adminCurrentUser => '当前账户';

  @override
  String get saveAction => '保存';

  @override
  String get editAction => '编辑';

  @override
  String get adminSystemRegistered => '系统已注册';

  @override
  String get adminSystemMissing => '仅目录';

  @override
  String get adminAgentAvailable => '本机分析 Agent 可用。';

  @override
  String get adminAgentUnavailable => '本机分析 Agent 当前不可用。';

  @override
  String get adminCredentialReady => '凭据已配置';

  @override
  String get adminCredentialMissing => '凭据未配置';

  @override
  String get adminActiveLine => '当前线路';

  @override
  String get adminActivateAction => '设为当前';

  @override
  String get adminActionFailed => '管理操作未完成，请刷新后重试。';

  @override
  String get cancelDownloadAction => '取消任务';

  @override
  String get retryDownloadAction => '重新下载';

  @override
  String get deleteDownloadAction => '删除任务';

  @override
  String get deleteDownloadTitle => '删除任务与文件？';

  @override
  String get deleteDownloadDescription =>
      '下载记录、视频文件、本地上传源文件和私有封面将永久删除。此操作不可撤销。';

  @override
  String get deleteDownloadActiveDescription =>
      '当前任务会先被取消。下载记录、视频文件、本地上传源文件和私有封面将永久删除。此操作不可撤销。';

  @override
  String get keepDownloadAction => '保留任务';

  @override
  String get deleteDocumentAction => '删除文档';

  @override
  String get deleteDocumentTitle => '删除剧本文档？';

  @override
  String get deleteDocumentDescription =>
      '原始文件、规范化剧本和当前文档记录将永久删除。正在使用该文档的分析需先结束。此操作不可撤销。';

  @override
  String get keepDocumentAction => '保留文档';

  @override
  String get confirmDeleteAction => '确认删除';

  @override
  String get verificationCodeLabel => '邮箱验证码';

  @override
  String get invalidVerificationCode => '验证码错误、已过期或已使用，请检查邮箱和验证码，或重新获取。';

  @override
  String get emailUnavailable => '注册邮件暂不可用，请稍后重试或联系支持。';

  @override
  String get emailSendFailed => '邮件发送未能确认，请稍后重新获取验证码。';

  @override
  String get sendVerificationCode => '获取验证码';

  @override
  String get sendingVerificationCode => '正在发送…';

  @override
  String get verificationCodeSent => '验证码已发送，10 分钟内有效。未收到时请检查垃圾邮件。';

  @override
  String verificationCodeCooldown(int seconds) {
    return '$seconds 秒后可重发';
  }

  @override
  String get verificationCodeRequired => '请输入邮件中的 6 位验证码';

  @override
  String get verificationRateLimited => '请等待 60 秒后再获取验证码。';

  @override
  String get passwordTooLong => '密码不能超过 128 个字符';

  @override
  String get requiredEmail => '请输入邮箱地址';

  @override
  String get requiredPassword => '请输入密码';

  @override
  String get requiredNewPassword => '请设置密码';

  @override
  String get requiredConfirmPassword => '请再次输入密码';

  @override
  String get requiredUsername => '请设置用户名';

  @override
  String get usernameTooShort => '用户名至少需要 2 个字符';

  @override
  String get usernameTooLong => '用户名不能超过 32 个字符';

  @override
  String get usernameInvalidCharacters => '用户名仅支持字母、数字、中文以及 _-. 字符';

  @override
  String get previousPage => '上一页';

  @override
  String get nextPage => '下一页';

  @override
  String get profileSaved => '个人资料已更新。';

  @override
  String get saveProfile => '保存资料';

  @override
  String get savingProfile => '正在保存';

  @override
  String get profileTitle => '个人资料';

  @override
  String get profileDescription => '管理公开用户名，并查看不会随任务变化的账户身份信息。';

  @override
  String get searchAction => '搜索';

  @override
  String get allStatuses => '全部状态';

  @override
  String get currentPageAvailable => '本页可用';

  @override
  String get searchDownloads => '搜索下载记录';

  @override
  String get searchUsers => '搜索用户名或邮箱';

  @override
  String get statusLabel => '状态';

  @override
  String get deleteConfiguration => '删除配置？';

  @override
  String get deleteConfigurationDescription => '此操作不可撤销。删除配置不会删除已有任务和报告。';

  @override
  String get createPlatform => '新增平台';

  @override
  String get configurationKey => '配置标识';

  @override
  String get displayName => '显示名称';

  @override
  String get sortOrder => '排序值';

  @override
  String get platformVisible => '用户侧可见';

  @override
  String get invalidConfiguration => '请检查此字段的格式和取值。';

  @override
  String get createAiProvider => '新增 AI 服务';

  @override
  String get engineLabel => '执行引擎';

  @override
  String get authModeLabel => '认证方式';

  @override
  String get modelLabel => '模型';

  @override
  String get baseUrlLabel => '服务地址';

  @override
  String get apiKeyLabel => 'API Key';

  @override
  String get apiKeyKeepHint => '留空保留已有凭据';

  @override
  String get localCodexRestriction => '这是服务端保留的本机 Codex 线路，只能修改显示名称和模型。';

  @override
  String get hostLoginLabel => '本机账号登录 · 免 Key';

  @override
  String get deleteAction => '删除';

  @override
  String get cancelAction => '取消';

  @override
  String get exportDocx => '导出 DOCX';

  @override
  String get videoFile => '视频文件';

  @override
  String get analysisReport => '分析报告';

  @override
  String get uniqueUsers => '独立用户';

  @override
  String get averageDuration => '平均视频时长（秒）';

  @override
  String get dailyTrend => '每日趋势';

  @override
  String get cancelledLabel => '已取消';

  @override
  String get allRoles => '全部身份';

  @override
  String get searchPlatforms => '搜索平台';

  @override
  String get visiblePlatform => '公开显示';

  @override
  String get hiddenPlatform => '已隐藏';

  @override
  String get needsAttention => '需要关注';

  @override
  String get previousAnalysisResult => '上一版已完成的结果';

  @override
  String get catalogScopeDescription => '此处只维护状态页名称、排序与可见性，不会新增下载域名或执行能力。';

  @override
  String get saveConfiguration => '保存配置';

  @override
  String get analysisRateLimited => 'AI 服务请求过于频繁，请稍后重试。';

  @override
  String get providerChallengeError => '平台要求验证，当前无法继续读取媒体。';

  @override
  String get providerExtractorError => '平台页面结构已变化，当前无法读取媒体。';

  @override
  String get providerEgressError => '当前出口无法连接媒体平台。';

  @override
  String get providerNetworkError => '连接媒体平台时发生临时网络故障。';

  @override
  String get providerRuntimeError => '解析执行环境暂不可用。';

  @override
  String get providerRegistered => '已接入';

  @override
  String get providerIdentityLabel => '身份要求';

  @override
  String get providerIdentityRequired => '需要登录';

  @override
  String get providerIdentityPrefer => '优先登录';

  @override
  String get providerIdentityNone => '无需登录';

  @override
  String get providerLoginRequiredError => '该内容需要登录，请确认部署主机已登录对应平台。';

  @override
  String get providerContentProtectedError => '该内容受加密保护，无法下载；可导入已取得的文件。';

  @override
  String get providerUnavailable => '未开放';

  @override
  String get providerIdentityUnavailableError =>
      '平台登录材料暂不可用，请检查部署主机的登录状态后重新解析。';

  @override
  String get providerContextChangedError => '媒体执行上下文已变化，请重新解析链接并确认下载规格。';

  @override
  String get reparseDownloadAction => '重新解析';

  @override
  String get inspectionContainerLabel => '容器';

  @override
  String get inspectionCompatibilityLabel => '兼容策略';

  @override
  String get inspectionVideoCodecLabel => '视频编码';

  @override
  String get inspectionAudioCodecLabel => '音频编码';

  @override
  String get compatibilityQuality => '画质优先';

  @override
  String get compatibilitySmallest => '体积优先';

  @override
  String get compatibilityBalanced => '均衡';

  @override
  String get analysisPriorityRevisions => '优先修改';

  @override
  String get analysisStrengths => '值得保留';

  @override
  String get analysisStructure => '幕结构';

  @override
  String get analysisTurningPoints => '关键转折';

  @override
  String get analysisCharacters => '人物';

  @override
  String get analysisDialogue => '对白发现';

  @override
  String get analysisConflict => '冲突';

  @override
  String get analysisTurn => '变化';

  @override
  String get analysisPacing => '节奏';

  @override
  String get analysisGoal => '目标';

  @override
  String get analysisCharacterArc => '人物弧';

  @override
  String get analysisVisualRules => '视觉规则';

  @override
  String get analysisContinuityRisks => '连续性风险';

  @override
  String get analysisNarrativeFunction => '叙事作用';

  @override
  String get analysisTransition => '转场';

  @override
  String get analysisRecommendedExtensions => '建议延展';

  @override
  String get analysisPriorityShots => '优先分镜';

  @override
  String get analysisEvidenceShots => '依据分镜';

  @override
  String get analysisReportSections => '报告章节';

  @override
  String get activityHistoryTitle => '我的处理记录';

  @override
  String get activityHistoryDescription => '统一查看链接、文档和 AI 分析记录。';

  @override
  String get activityHistorySearch => '搜索处理记录';

  @override
  String get activityHistoryLink => '链接解析';

  @override
  String get activityHistoryVideo => '视频 AI';

  @override
  String get activityHistoryScreenplay => '剧本解析';

  @override
  String get activityHistoryBasic => '基础解析';

  @override
  String get activityHistoryRewrite => 'AI 改写';

  @override
  String get activityHistoryAll => '全部类型';

  @override
  String get pageSizeLabel => '每页条数';

  @override
  String get profileAvatarUpload => '上传头像';

  @override
  String get profileAvatarRemove => '移除头像';

  @override
  String get profileAvatarBusy => '正在处理头像';

  @override
  String get profileAvatarHelp => 'JPEG、PNG 或 WebP，最大 4 MB。上传后自动裁切为方形。';

  @override
  String get profileAvatarInvalidType => '请选择 JPEG、PNG 或 WebP 图片。';

  @override
  String get profileAvatarInvalidSize => '头像文件不能超过 4 MB，且不能为空。';

  @override
  String get profileAvatarSaved => '头像已更新。';

  @override
  String get profileAvatarRemoved => '头像已移除。';

  @override
  String get profileEmailHelp => '用于登录账户，暂不支持在此修改。';

  @override
  String get profileRoleLabel => '账户身份';

  @override
  String get profileRoleAdminHelp => '更改为普通用户前，必须保留另一位启用的管理员。';

  @override
  String get profileRoleUserHelp => '仅管理员可以修改账户身份。';

  @override
  String get profileFieldsTitle => '资料字段';

  @override
  String get profilePartialSave => '用户名已保存；账户身份修改失败。';

  @override
  String get selfHostingNavigation => '自托管部署';

  @override
  String get selfHostingDescription => '从环境准备到首次登录，在自己的基础设施上运行帧取。';

  @override
  String get aboutNavigation => '关于帧取';

  @override
  String get aboutDescription => '了解开源媒体工作流的定位、工程原则与授权边界。';

  @override
  String get resourcesNavigation => '资源';

  @override
  String get adminDownloadsTab => '下载';

  @override
  String get adminAnalysisTab => 'AI 分析';

  @override
  String get adminAnalysisExecutions => '执行次数';

  @override
  String get adminAnalysisDuration => '平均完成耗时';

  @override
  String get adminAnalysisDurationCount => '有效完成记录';

  @override
  String get adminAnalysisStatus => '执行状态';

  @override
  String get adminAnalysisInput => '输入类型';

  @override
  String get adminAnalysisEmpty => '当前周期还没有 AI 分析记录';

  @override
  String get adminAnalysisEmptyDescription => '切换统计周期，或发起分析后再查看。';

  @override
  String get adminAnalysisScopeHint =>
      '按 UTC 日期统计分析执行；重试与重新分析分别计次。执行次数不代表模型请求次数。';

  @override
  String get adminCompletionRate => '完成率';

  @override
  String get adminTrendDetails => '精确数据';

  @override
  String get adminOperationLogsTitle => '系统操作日志';

  @override
  String get adminOperationLogsDescription => '查看全系统业务请求与管理员操作，追踪操作人、对象和执行结果。';

  @override
  String get adminOperationLogSearch => '操作人或操作名称';

  @override
  String get adminOperationScope => '操作范围';

  @override
  String get adminAllOperations => '全部操作';

  @override
  String get adminRequestOperations => '接口请求';

  @override
  String get adminTaskOperations => '系统任务';

  @override
  String get adminAdminOperations => '管理员操作';

  @override
  String get adminOperationOutcome => '执行结果';

  @override
  String get adminAllOutcomes => '全部结果';

  @override
  String get adminOperationStarted => '结果未确认';

  @override
  String get adminOperationSucceeded => '请求成功';

  @override
  String get adminOperationFailed => '请求失败';

  @override
  String get adminOperationSucceededFilter => '成功 / 状态更新';

  @override
  String get adminOperationFrom => '开始时间';

  @override
  String get adminOperationTo => '结束时间';

  @override
  String get adminOperationDateHint => 'YYYY-MM-DD HH:mm';

  @override
  String get adminOperationInvalidDates =>
      '结束时间不能早于开始时间，时间格式为 YYYY-MM-DD HH:mm。';

  @override
  String get adminOperationLogsHint =>
      '展示日志启用后的操作。请求结果与系统任务状态分别记录；结果未确认表示请求尚未结束或执行曾中断。';

  @override
  String get adminOperationLogsEmpty => '暂无操作日志';

  @override
  String get adminOperationLogsEmptyDescription => '尚未产生符合条件的操作。可以调整筛选条件或稍后刷新。';

  @override
  String get adminOperationDetails => '操作详情';

  @override
  String get adminOperationDetailsDescription => '只读记录，用于定位请求和核对执行结果。';

  @override
  String get adminOperationActor => '操作人';

  @override
  String get adminUnknownAccount => '未识别账户';

  @override
  String get adminOperationObject => '对象';

  @override
  String get adminOperationId => '日志 ID';

  @override
  String get adminActorId => '账户 ID';

  @override
  String get adminOperationLabel => '操作';

  @override
  String get adminOperationKey => '操作标识';

  @override
  String get adminOperationEndpoint => '接口';

  @override
  String get adminOperationFinished => '结束时间';

  @override
  String get adminOperationStatusCode => 'HTTP 状态';

  @override
  String get adminOperationErrorCode => '错误码';

  @override
  String get adminDeleteSelectionDescription =>
      '删除后无法恢复。已删除的记录会从列表移除；失败的记录可以重试。';

  @override
  String get adminDeleteUserDescription =>
      '账户、登录凭据、角色、配额和会话会一并移除；历史下载文件与任务记录不会自动删除。';

  @override
  String get adminDeleteFileDescription => '文件及其持久对象将永久删除。正在分析的源文件无法删除。';

  @override
  String get adminUsersEmpty => '没有匹配的账户';

  @override
  String get adminUsersEmptyDescription => '调整搜索词、角色或账户状态后重试。';

  @override
  String get adminQuotaTitle => '用量限制';

  @override
  String get adminQuotaDescription => '留空使用系统默认。启用豁免后跳过用量限制。';

  @override
  String get adminQuotaExempt => '豁免用量限制';

  @override
  String get adminQuotaActive => '同时活跃任务';

  @override
  String get adminQuotaDailyTasks => '24 小时任务数';

  @override
  String get adminQuotaDailyGiB => '24 小时处理量（GiB）';

  @override
  String get adminQuotaStorageGiB => '保留存储（GiB）';

  @override
  String get adminQuotaAnalysis => '24 小时分析尝试';

  @override
  String get adminUseSystemDefault => '使用系统默认';

  @override
  String get adminPlatformsEmpty => '没有匹配的平台';

  @override
  String get adminPlatformsEmptyDescription => '调整搜索词或公开状态后重试。';

  @override
  String get adminAiSearch => '搜索 AI 配置';

  @override
  String get adminAiEmpty => '没有匹配的 AI 配置';

  @override
  String get adminAiEmptyDescription => '调整搜索词，或新增 AI 配置。';

  @override
  String get adminEngineCodex => 'Codex CLI · Responses';

  @override
  String get adminEngineClaude => 'Claude CLI · Messages';

  @override
  String get adminEngineOpenRouter => 'OpenRouter API';

  @override
  String get adminEngineOpenAi => 'OpenAI 兼容 API';

  @override
  String get adminEngineDeepSeek => 'DeepSeek API · LangChain 视觉';

  @override
  String get adminOpenRouterUrlHint =>
      '使用 OpenRouter 官方地址；视频分析要求模型支持图像输入与结构化输出。';

  @override
  String get adminApiUrlHint => '公网地址必须使用 HTTPS；本机 localhost 可使用 HTTP。';

  @override
  String get adminFixedDeepSeekModel => '当前视觉适配器固定使用此模型。';

  @override
  String get adminHostLoginHint => 'Agent 将读取当前系统用户的 CLI 登录状态，无需在项目中保存 Key。';

  @override
  String get adminReadModels => '读取 OpenRouter 模型';

  @override
  String get adminModelSearch => '搜索模型名称或 ID';

  @override
  String get adminModelsHint => '仅列出声明支持结构化输出的模型；视频请选择支持图像的模型。目录信息不代表实际调用已验证。';

  @override
  String get adminImageSupported => '支持图像';

  @override
  String get adminTextOnly => '仅文本';

  @override
  String get adminModelsEmpty => '没有匹配的模型';

  @override
  String get adminModelDirectory => '目录中的模型';

  @override
  String pageSizeOption(int size) {
    return '每页 $size 条';
  }

  @override
  String get uploadVideoAction => '导入自有视频';

  @override
  String get aboutContent =>
      '## 帧取为谁而做？\n\n### 创作者\n\n整理自己拥有或已获授权的素材，用分镜、场景与关键帧证据复盘作品结构。\n\n### 内容研究者\n\n把视频与剧本文档组织为可追踪的任务，并导出 Markdown / DOCX 报告用于审阅。\n\n### 开发者与团队\n\n在自己的基础设施上运行 FastAPI、Next.js 与 Worker，通过 OpenAPI 契约扩展 Web 或移动端。\n\n## 为什么采用异步工作流架构？\n\n### 可恢复\n\nPostgreSQL 保存任务事实，Transactional Outbox 保证数据库状态与消息意图一致；实时连接只用于展示进度。\n\n### 可隔离\n\n下载、媒体命令与 AI 长任务不在 HTTP 请求进程中执行，Runner 经过阻断私网的受控出口代理。\n\n### 可验证\n\nProvider 返回值不会直接成为最终文件；Worker 重新解析并校验格式、时长、大小与 SHA-256 后才写入存储。\n\n### 可自托管\n\n数据保存在部署者配置的基础设施中，项目不依赖官方托管服务，也不内置第三方追踪器。\n\n## 帧取不做什么？\n\n帧取不是规避平台限制的下载脚本。默认只处理用户有权使用、公开、免费且非 DRM 的 HTTP(S) 内容；受保护、会员、私密、购买或地域限制内容不属于项目目标。私网 URL、任意 yt-dlp 参数和 shell 输入始终禁止。\n\nMIT 许可证授予软件的使用、修改和分发权，不代表授予任何第三方媒体内容的下载、复制或分析权。项目不提供官方 SaaS、公共演示站或服务可用性 SLA。\n\n## 源码在哪里？\n\n[video-server](https://github.com/StephenQiu30/video-server)：FastAPI API、Next.js Web、下载 / 文档 / 报告 Worker、隔离 Media Runner 与 Docker Compose 部署。\n\n[video-app](https://github.com/StephenQiu30/video-app)：连接自托管 video-server 的 Flutter iOS / Android 客户端；媒体处理与 AI 推理仍在服务端执行。\n\n项目由 [StephenQiu](https://github.com/StephenQiu30) 维护，欢迎通过 Issue 或 Pull Request 参与。安全问题请按[安全策略](https://github.com/StephenQiu30/video-server/blob/main/SECURITY.md)私下报告。';

  @override
  String get selfHostingContent =>
      '本页摘录当前部署流程。命令与配置以仓库 README 为准；平台登录、换机与故障恢复请阅读对应设计文档。\n\n## 运行帧取需要准备什么？\n\n- Docker Engine 与 Docker Compose。\n- 部署者已有的 PostgreSQL、RabbitMQ、Redis 与 MinIO；Compose 只管理帧取自身的业务服务并复用这些基础环境。\n- macOS 平台会话来源需要 uv（Python 3.12）、日常 Chrome 与帧取扩展。\n- 生产部署需要强随机密钥、稳定的 HTTPS 访问地址和规划好的对象存储容量。\n\n## 如何用 Docker Compose 部署？\n\n### 克隆仓库并准备环境文件\n\n复制示例配置后，把 .env 中的连接信息改为本机已运行的 PostgreSQL、RabbitMQ、Redis 与 MinIO。真实密钥只写入未提交的 .env 或 Secret Manager。\n\n```sh\ngit clone https://github.com/StephenQiu30/video-server.git\ncd video-server\ntest -f .env || cp .env.example .env\n```\n\n### 为空数据库加载当前态结构\n\n首次使用空项目数据库时，以该库的 DDL 账号加载 schema.sql。已有数据库升级前先备份。\n\n```sh\npsql -X -v ON_ERROR_STOP=1 -W -h 127.0.0.1 -U video -d video \\\n  -f backend/sql/schema.sql\n```\n\n### 安装登录来源并启动业务服务\n\nmacOS 上安装 Chrome 会话来源，并在 chrome://extensions 加载命令输出目录中的扩展。复用日常 Chrome 已有平台登录；Compose 启动 Web、API、Worker、Runner 与出口代理。公开链接优先匿名解析。生产配置见 README。\n\n```sh\nuv run --project backend python -m app.workers.session.source_cli install --env-file .env\ndocker compose up -d --build --wait --remove-orphans\n```\n\n### 初始化首个管理员\n\n全新空库在部署机终端执行一次，密码交互输入。命令只在用户表为空时创建管理员，不开放 HTTP 初始化接口。\n\n```sh\nuv run --project backend python -m app.workers.bootstrap_admin \\\n  --env-file .env --username your-admin --email you@example.com\n```\n\n### 检查服务健康状态\n\n默认 Web 端口为 8101，API 端口为 8111，Swagger UI 位于 :8111/docs。健康检查只证明服务可运行，不代表每个平台都有可下载的媒体。\n\n```sh\ncurl --fail http://127.0.0.1:8111/health/live\ncurl --fail http://127.0.0.1:8111/health/ready\ncurl --fail --head http://127.0.0.1:8101/\n```\n\n## AI 视频分析是否必须启用？\n\n不是。AI Worker 独立于业务 Compose 运行，可复用宿主机已登录的 Codex App Server，或由管理员配置受支持的模型 Provider。只需要下载与剧本文档导入时，在 .env 中设置 ANALYSIS_ENABLED=false；关闭 AI 不影响下载和文档导入。\n\n使用外部模型时，分析所需内容会发送到该服务，并可能产生费用。启用前应确认素材授权和模型服务的数据处理约定。\n\n## 公开上线前应检查什么？\n\n- 替换 .env.prod 中所有占位凭据，并确认密钥来源可在换机时恢复。\n- 外部媒体访问必须经过阻断私网的出口代理；入口 URL 校验不能替代网络隔离。\n- 为 MinIO 规划容量、备份与显式清理策略；预签名链接过期不会删除最终文件。\n- 只在计划公开介绍项目的网站设置 SITE_INDEXABLE=true，并把 SITE_URL 设为稳定的 HTTPS 域名。\n- 更新代码后执行 git pull --ff-only 并按 README 重新安装来源并执行 Compose 构建启动；docker compose restart 不会应用新镜像或环境配置。\n\n[README 快速开始](https://github.com/StephenQiu30/video-server#快速开始) · [系统设计](https://github.com/StephenQiu30/video-server/blob/main/docs/design/README.md)';

  @override
  String get activityHistoryFrom => '起始日期';

  @override
  String get activityHistoryTo => '结束日期';

  @override
  String get activityHistorySkill => '分析 Skill';

  @override
  String get activitySourceUnavailable => '源文件不可用，已有结果仍可查看。';

  @override
  String get analysisRunsTitle => '运行记录';

  @override
  String get verifyRegistrationEmail => '验证邮箱';

  @override
  String get verifyingRegistrationEmail => '验证中…';

  @override
  String get registrationEmailVerified => '邮箱已验证';

  @override
  String get registrationEmailVerificationSuccess => '邮箱已验证，可以设置密码。';

  @override
  String get registrationPasswordPrompt => '邮箱已验证，现在设置密码完成注册。';

  @override
  String currentPageLabel(int page) {
    return '第 $page 页';
  }

  @override
  String get adminAnalysisRateFormula => '成功 ÷（成功 + 失败）';

  @override
  String get adminAnalysisTrendTitle => '每日分析趋势';

  @override
  String get adminDownloadTrendTitle => '每日下载趋势';

  @override
  String get adminStatusDistribution => '状态分布';

  @override
  String get adminSourcePerformance => '各视频源下载表现';

  @override
  String get adminCompletionTrend => '完成率走势';

  @override
  String get adminOperationDeleted => '已删除';

  @override
  String get adminDeleteAiDescription => '所选 AI 配置与凭据将永久删除。当前线路和系统兜底线路不可删除。';

  @override
  String get adminDeleteCatalogDescription =>
      '该条目会从平台目录和公开状态页移除。系统下载 Profile 不会因此被删除。';

  @override
  String get exportMarkdown => '导出 Markdown';

  @override
  String get publicWorkflowEyebrow => '工作流';

  @override
  String get publicWorkflowDescription => '从识别到交付，每一步都有明确边界。';

  @override
  String get adminObjectCount => '对象数';

  @override
  String analysisRunNumber(int run) {
    return '第 $run 次执行';
  }

  @override
  String get analysisRetryTitle => '按原配置重新运行';

  @override
  String get analysisRetryDescription =>
      '将保留任务编号并增加执行次数，可能消耗模型额度。修改配置请从源文件新建分析。';

  @override
  String get confirmRetryAnalysis => '确认执行';

  @override
  String get adminPeriodLabel => '统计周期';
}
