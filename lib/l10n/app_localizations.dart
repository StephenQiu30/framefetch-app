import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('zh'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In zh, this message translates to:
  /// **'帧取'**
  String get appTitle;

  /// No description provided for @homeNavigation.
  ///
  /// In zh, this message translates to:
  /// **'首页'**
  String get homeNavigation;

  /// No description provided for @downloadHistoryNavigation.
  ///
  /// In zh, this message translates to:
  /// **'下载记录'**
  String get downloadHistoryNavigation;

  /// No description provided for @historyTab.
  ///
  /// In zh, this message translates to:
  /// **'历史'**
  String get historyTab;

  /// No description provided for @screenplayDocumentsNavigation.
  ///
  /// In zh, this message translates to:
  /// **'剧本文档'**
  String get screenplayDocumentsNavigation;

  /// No description provided for @documentsTab.
  ///
  /// In zh, this message translates to:
  /// **'文档'**
  String get documentsTab;

  /// No description provided for @providerStatusNavigation.
  ///
  /// In zh, this message translates to:
  /// **'平台状态'**
  String get providerStatusNavigation;

  /// No description provided for @statusTab.
  ///
  /// In zh, this message translates to:
  /// **'状态'**
  String get statusTab;

  /// No description provided for @accountNavigation.
  ///
  /// In zh, this message translates to:
  /// **'我的'**
  String get accountNavigation;

  /// No description provided for @downloadRowActionsHint.
  ///
  /// In zh, this message translates to:
  /// **'向左轻扫可查看任务操作。'**
  String get downloadRowActionsHint;

  /// No description provided for @loadingData.
  ///
  /// In zh, this message translates to:
  /// **'正在加载…'**
  String get loadingData;

  /// No description provided for @loadFailedTitle.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法读取数据'**
  String get loadFailedTitle;

  /// No description provided for @invalidResponseError.
  ///
  /// In zh, this message translates to:
  /// **'服务响应与当前 App 版本不兼容，请更新 App 或联系服务管理员。'**
  String get invalidResponseError;

  /// No description provided for @forbiddenError.
  ///
  /// In zh, this message translates to:
  /// **'当前账户没有执行此操作的权限。'**
  String get forbiddenError;

  /// No description provided for @retryAction.
  ///
  /// In zh, this message translates to:
  /// **'重新加载'**
  String get retryAction;

  /// No description provided for @refreshAction.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get refreshAction;

  /// No description provided for @totalLabel.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get totalLabel;

  /// No description provided for @succeededLabel.
  ///
  /// In zh, this message translates to:
  /// **'已完成'**
  String get succeededLabel;

  /// No description provided for @activeLabel.
  ///
  /// In zh, this message translates to:
  /// **'进行中'**
  String get activeLabel;

  /// No description provided for @failedLabel.
  ///
  /// In zh, this message translates to:
  /// **'失败'**
  String get failedLabel;

  /// No description provided for @downloadHistoryEmptyTitle.
  ///
  /// In zh, this message translates to:
  /// **'还没有下载记录'**
  String get downloadHistoryEmptyTitle;

  /// No description provided for @createDownloadFromHomeAction.
  ///
  /// In zh, this message translates to:
  /// **'去首页创建任务'**
  String get createDownloadFromHomeAction;

  /// No description provided for @downloadStatusQueued.
  ///
  /// In zh, this message translates to:
  /// **'排队中'**
  String get downloadStatusQueued;

  /// No description provided for @downloadStatusRunning.
  ///
  /// In zh, this message translates to:
  /// **'下载中'**
  String get downloadStatusRunning;

  /// No description provided for @downloadStatusRetryWait.
  ///
  /// In zh, this message translates to:
  /// **'等待重试'**
  String get downloadStatusRetryWait;

  /// No description provided for @downloadStatusSucceeded.
  ///
  /// In zh, this message translates to:
  /// **'已完成'**
  String get downloadStatusSucceeded;

  /// No description provided for @downloadStatusFailed.
  ///
  /// In zh, this message translates to:
  /// **'失败'**
  String get downloadStatusFailed;

  /// No description provided for @downloadStatusCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消'**
  String get downloadStatusCancelled;

  /// No description provided for @downloadStatusUnknown.
  ///
  /// In zh, this message translates to:
  /// **'状态未知'**
  String get downloadStatusUnknown;

  /// No description provided for @updatedAtLabel.
  ///
  /// In zh, this message translates to:
  /// **'更新于'**
  String get updatedAtLabel;

  /// No description provided for @failureCancelled.
  ///
  /// In zh, this message translates to:
  /// **'任务已取消'**
  String get failureCancelled;

  /// No description provided for @failureStorage.
  ///
  /// In zh, this message translates to:
  /// **'存储暂时不可用'**
  String get failureStorage;

  /// No description provided for @failureGeneric.
  ///
  /// In zh, this message translates to:
  /// **'处理未完成'**
  String get failureGeneric;

  /// No description provided for @documentEmptyTitle.
  ///
  /// In zh, this message translates to:
  /// **'还没有剧本文档'**
  String get documentEmptyTitle;

  /// No description provided for @goToScreenplayUploadAction.
  ///
  /// In zh, this message translates to:
  /// **'去首页上传剧本'**
  String get goToScreenplayUploadAction;

  /// No description provided for @documentStatusUploading.
  ///
  /// In zh, this message translates to:
  /// **'等待上传'**
  String get documentStatusUploading;

  /// No description provided for @documentStatusVerifying.
  ///
  /// In zh, this message translates to:
  /// **'正在解析'**
  String get documentStatusVerifying;

  /// No description provided for @documentStatusReady.
  ///
  /// In zh, this message translates to:
  /// **'可以核对'**
  String get documentStatusReady;

  /// No description provided for @documentStatusFailed.
  ///
  /// In zh, this message translates to:
  /// **'解析失败'**
  String get documentStatusFailed;

  /// No description provided for @documentStatusCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消'**
  String get documentStatusCancelled;

  /// No description provided for @documentStatusExpired.
  ///
  /// In zh, this message translates to:
  /// **'已过期'**
  String get documentStatusExpired;

  /// No description provided for @documentStatusUnknown.
  ///
  /// In zh, this message translates to:
  /// **'状态未知'**
  String get documentStatusUnknown;

  /// No description provided for @openDocumentDetailsHint.
  ///
  /// In zh, this message translates to:
  /// **'打开剧本文档详情'**
  String get openDocumentDetailsHint;

  /// No description provided for @screenplayDocumentDetailNavigation.
  ///
  /// In zh, this message translates to:
  /// **'文档详情'**
  String get screenplayDocumentDetailNavigation;

  /// No description provided for @documentInformationTitle.
  ///
  /// In zh, this message translates to:
  /// **'导入信息'**
  String get documentInformationTitle;

  /// No description provided for @documentImportSummary.
  ///
  /// In zh, this message translates to:
  /// **'第 {attempt} 次导入 · 版本 {version}'**
  String documentImportSummary(int attempt, int version);

  /// No description provided for @documentStoragePolicyLabel.
  ///
  /// In zh, this message translates to:
  /// **'存储策略'**
  String get documentStoragePolicyLabel;

  /// No description provided for @documentStoragePersistent.
  ///
  /// In zh, this message translates to:
  /// **'持久保存'**
  String get documentStoragePersistent;

  /// No description provided for @documentBasicParsingTitle.
  ///
  /// In zh, this message translates to:
  /// **'基础解析'**
  String get documentBasicParsingTitle;

  /// No description provided for @documentPageCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'页数'**
  String get documentPageCountLabel;

  /// No description provided for @documentParagraphCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'段落'**
  String get documentParagraphCountLabel;

  /// No description provided for @documentHeadingCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'标题'**
  String get documentHeadingCountLabel;

  /// No description provided for @documentListItemCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'列表项'**
  String get documentListItemCountLabel;

  /// No description provided for @documentTableCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'表格'**
  String get documentTableCountLabel;

  /// No description provided for @documentDialogueBlockCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'对白块'**
  String get documentDialogueBlockCountLabel;

  /// No description provided for @waitingForParsing.
  ///
  /// In zh, this message translates to:
  /// **'等待解析'**
  String get waitingForParsing;

  /// No description provided for @chineseLanguage.
  ///
  /// In zh, this message translates to:
  /// **'中文'**
  String get chineseLanguage;

  /// No description provided for @englishLanguage.
  ///
  /// In zh, this message translates to:
  /// **'英文'**
  String get englishLanguage;

  /// No description provided for @mixedLanguage.
  ///
  /// In zh, this message translates to:
  /// **'中英混合'**
  String get mixedLanguage;

  /// No description provided for @unknownLanguage.
  ///
  /// In zh, this message translates to:
  /// **'未知'**
  String get unknownLanguage;

  /// No description provided for @normalizedScreenplayTitle.
  ///
  /// In zh, this message translates to:
  /// **'规范化剧本'**
  String get normalizedScreenplayTitle;

  /// No description provided for @markdownPreviewLabel.
  ///
  /// In zh, this message translates to:
  /// **'Markdown 正文预览'**
  String get markdownPreviewLabel;

  /// No description provided for @documentPreviewUploading.
  ///
  /// In zh, this message translates to:
  /// **'文件尚未完成上传，上传完成后将自动开始解析。'**
  String get documentPreviewUploading;

  /// No description provided for @documentPreviewVerifying.
  ///
  /// In zh, this message translates to:
  /// **'正在提取结构和正文，页面会自动更新。'**
  String get documentPreviewVerifying;

  /// No description provided for @documentPreviewEmpty.
  ///
  /// In zh, this message translates to:
  /// **'解析已完成，但没有可显示的正文。'**
  String get documentPreviewEmpty;

  /// No description provided for @documentPreviewFailed.
  ///
  /// In zh, this message translates to:
  /// **'剧本文档未能完成解析，请根据错误信息重新上传。'**
  String get documentPreviewFailed;

  /// No description provided for @documentPreviewCancelled.
  ///
  /// In zh, this message translates to:
  /// **'这次剧本文档导入已经取消。'**
  String get documentPreviewCancelled;

  /// No description provided for @documentPreviewExpired.
  ///
  /// In zh, this message translates to:
  /// **'上传会话已经过期，请返回首页重新上传。'**
  String get documentPreviewExpired;

  /// No description provided for @documentPreviewTruncatedTitle.
  ///
  /// In zh, this message translates to:
  /// **'当前显示节选'**
  String get documentPreviewTruncatedTitle;

  /// No description provided for @documentPreviewTruncatedDescription.
  ///
  /// In zh, this message translates to:
  /// **'文档正文较长，此处只显示服务端返回的规范化预览。'**
  String get documentPreviewTruncatedDescription;

  /// No description provided for @documentParsingIncompleteTitle.
  ///
  /// In zh, this message translates to:
  /// **'解析尚未完成'**
  String get documentParsingIncompleteTitle;

  /// No description provided for @documentManualReviewTitle.
  ///
  /// In zh, this message translates to:
  /// **'建议人工核对'**
  String get documentManualReviewTitle;

  /// No description provided for @documentStorageUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'文件存储暂时不可用，请稍后重试。'**
  String get documentStorageUnavailable;

  /// No description provided for @documentUploadSessionExpired.
  ///
  /// In zh, this message translates to:
  /// **'上传会话已过期，请重新上传。'**
  String get documentUploadSessionExpired;

  /// No description provided for @documentUploadIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'文件上传不完整，请重新上传。'**
  String get documentUploadIncomplete;

  /// No description provided for @documentSizeMismatch.
  ///
  /// In zh, this message translates to:
  /// **'文件大小校验失败，请重新选择原文件。'**
  String get documentSizeMismatch;

  /// No description provided for @documentIntegrityMismatch.
  ///
  /// In zh, this message translates to:
  /// **'文件完整性校验失败，请重新上传。'**
  String get documentIntegrityMismatch;

  /// No description provided for @documentFormatUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'服务端不支持这个文档格式。'**
  String get documentFormatUnsupported;

  /// No description provided for @documentEncrypted.
  ///
  /// In zh, this message translates to:
  /// **'无法解析受密码保护的文档。'**
  String get documentEncrypted;

  /// No description provided for @documentArchiveUnsafe.
  ///
  /// In zh, this message translates to:
  /// **'文档压缩结构不安全，已停止处理。'**
  String get documentArchiveUnsafe;

  /// No description provided for @documentTextUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'文档中没有可提取的文本。'**
  String get documentTextUnavailable;

  /// No description provided for @documentStructureInvalid.
  ///
  /// In zh, this message translates to:
  /// **'文档结构无法识别。'**
  String get documentStructureInvalid;

  /// No description provided for @documentSceneHeadingMissing.
  ///
  /// In zh, this message translates to:
  /// **'部分场景缺少标准场景标题。'**
  String get documentSceneHeadingMissing;

  /// No description provided for @documentManualReviewRequired.
  ///
  /// In zh, this message translates to:
  /// **'解析结果需要人工核对。'**
  String get documentManualReviewRequired;

  /// No description provided for @fileSizeLabel.
  ///
  /// In zh, this message translates to:
  /// **'文件大小'**
  String get fileSizeLabel;

  /// No description provided for @sceneCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'场景'**
  String get sceneCountLabel;

  /// No description provided for @characterCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'字符'**
  String get characterCountLabel;

  /// No description provided for @languageLabel.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get languageLabel;

  /// No description provided for @providerEmptyTitle.
  ///
  /// In zh, this message translates to:
  /// **'暂无平台状态'**
  String get providerEmptyTitle;

  /// No description provided for @providerStatusUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'不支持'**
  String get providerStatusUnsupported;

  /// No description provided for @capabilitySingleVideo.
  ///
  /// In zh, this message translates to:
  /// **'单视频'**
  String get capabilitySingleVideo;

  /// No description provided for @capabilityShortVideo.
  ///
  /// In zh, this message translates to:
  /// **'短视频'**
  String get capabilityShortVideo;

  /// No description provided for @capabilityClipOrVod.
  ///
  /// In zh, this message translates to:
  /// **'片段或点播'**
  String get capabilityClipOrVod;

  /// No description provided for @capabilityAudioVideoSplit.
  ///
  /// In zh, this message translates to:
  /// **'音视频分离'**
  String get capabilityAudioVideoSplit;

  /// No description provided for @capabilitySubtitles.
  ///
  /// In zh, this message translates to:
  /// **'字幕'**
  String get capabilitySubtitles;

  /// No description provided for @capabilityImageOrCarousel.
  ///
  /// In zh, this message translates to:
  /// **'图片或图集'**
  String get capabilityImageOrCarousel;

  /// No description provided for @capabilityLive.
  ///
  /// In zh, this message translates to:
  /// **'直播'**
  String get capabilityLive;

  /// No description provided for @capabilityPlaylist.
  ///
  /// In zh, this message translates to:
  /// **'播放列表'**
  String get capabilityPlaylist;

  /// No description provided for @guideNavigation.
  ///
  /// In zh, this message translates to:
  /// **'使用指南'**
  String get guideNavigation;

  /// No description provided for @switchToDarkTheme.
  ///
  /// In zh, this message translates to:
  /// **'切换到深色主题'**
  String get switchToDarkTheme;

  /// No description provided for @switchToLightTheme.
  ///
  /// In zh, this message translates to:
  /// **'切换到浅色主题'**
  String get switchToLightTheme;

  /// No description provided for @publicHomeEyebrow.
  ///
  /// In zh, this message translates to:
  /// **'帧取 Framefetch · 开源视频工作流'**
  String get publicHomeEyebrow;

  /// No description provided for @publicHomeTitle.
  ///
  /// In zh, this message translates to:
  /// **'把素材，\n带回本地。'**
  String get publicHomeTitle;

  /// No description provided for @publicHomeDescription.
  ///
  /// In zh, this message translates to:
  /// **'开源、自托管地完成公开视频解析、本地视频与剧本文档导入、制品管理和 AI 分析。数据与运行边界由你掌控。'**
  String get publicHomeDescription;

  /// No description provided for @publicRegisterAction.
  ///
  /// In zh, this message translates to:
  /// **'创建本地账户'**
  String get publicRegisterAction;

  /// No description provided for @publicSourceAction.
  ///
  /// In zh, this message translates to:
  /// **'查看源代码'**
  String get publicSourceAction;

  /// No description provided for @publicWorkflowInspectTitle.
  ///
  /// In zh, this message translates to:
  /// **'解析'**
  String get publicWorkflowInspectTitle;

  /// No description provided for @publicWorkflowInspectDescription.
  ///
  /// In zh, this message translates to:
  /// **'识别公开媒体或文章中的候选视频'**
  String get publicWorkflowInspectDescription;

  /// No description provided for @publicWorkflowSelectTitle.
  ///
  /// In zh, this message translates to:
  /// **'选择'**
  String get publicWorkflowSelectTitle;

  /// No description provided for @publicWorkflowSelectDescription.
  ///
  /// In zh, this message translates to:
  /// **'确认目标与格式，避免隐式下载'**
  String get publicWorkflowSelectDescription;

  /// No description provided for @publicWorkflowExecuteTitle.
  ///
  /// In zh, this message translates to:
  /// **'执行'**
  String get publicWorkflowExecuteTitle;

  /// No description provided for @publicWorkflowExecuteDescription.
  ///
  /// In zh, this message translates to:
  /// **'由隔离 Worker 处理下载、导入和分析'**
  String get publicWorkflowExecuteDescription;

  /// No description provided for @publicWorkflowDeliverTitle.
  ///
  /// In zh, this message translates to:
  /// **'交付'**
  String get publicWorkflowDeliverTitle;

  /// No description provided for @publicWorkflowDeliverDescription.
  ///
  /// In zh, this message translates to:
  /// **'通过授权短时入口预览或获取制品'**
  String get publicWorkflowDeliverDescription;

  /// No description provided for @publicHomeCapabilitiesTitle.
  ///
  /// In zh, this message translates to:
  /// **'视频解析、剧本处理与 AI 分析'**
  String get publicHomeCapabilitiesTitle;

  /// No description provided for @publicVideoTitle.
  ///
  /// In zh, this message translates to:
  /// **'公开视频工作流'**
  String get publicVideoTitle;

  /// No description provided for @publicVideoDescription.
  ///
  /// In zh, this message translates to:
  /// **'解析有权处理的公开链接，选择真实可用格式，并跟踪下载与最终制品。'**
  String get publicVideoDescription;

  /// No description provided for @publicDocumentTitle.
  ///
  /// In zh, this message translates to:
  /// **'剧本与文档处理'**
  String get publicDocumentTitle;

  /// No description provided for @publicDocumentDescription.
  ///
  /// In zh, this message translates to:
  /// **'导入获授权的剧本文档，在同一工作区完成规范化、分析与处理记录。'**
  String get publicDocumentDescription;

  /// No description provided for @publicAnalysisTitle.
  ///
  /// In zh, this message translates to:
  /// **'结构化 AI 视频分析'**
  String get publicAnalysisTitle;

  /// No description provided for @publicAnalysisDescription.
  ///
  /// In zh, this message translates to:
  /// **'围绕场景、分镜、高光和内容资产生成结构化结果与运行证据。'**
  String get publicAnalysisDescription;

  /// No description provided for @publicTrustEyebrow.
  ///
  /// In zh, this message translates to:
  /// **'自托管架构'**
  String get publicTrustEyebrow;

  /// No description provided for @publicTrustDescription.
  ///
  /// In zh, this message translates to:
  /// **'FastAPI、Next.js、PostgreSQL、RabbitMQ、MinIO、FFmpeg 与 yt-dlp 组成可独立部署的工作流。MIT 许可证允许你免费检查、修改和自托管。'**
  String get publicTrustDescription;

  /// No description provided for @publicSafeguardAuthorization.
  ///
  /// In zh, this message translates to:
  /// **'公开视频并不等于可自由使用，请仅处理已获授权的内容。'**
  String get publicSafeguardAuthorization;

  /// No description provided for @publicFaqEyebrow.
  ///
  /// In zh, this message translates to:
  /// **'常见问题'**
  String get publicFaqEyebrow;

  /// No description provided for @publicFaqWhatQuestion.
  ///
  /// In zh, this message translates to:
  /// **'帧取 Framefetch 是什么？'**
  String get publicFaqWhatQuestion;

  /// No description provided for @publicFaqWhatAnswer.
  ///
  /// In zh, this message translates to:
  /// **'帧取是面向创作者、内容研究者和开发者的 MIT 开源自托管视频解析与 AI 分析平台。它把已获授权的媒体链接、本地视频和剧本文档组织为任务，并提供素材管理、结构化分析与报告导出。'**
  String get publicFaqWhatAnswer;

  /// No description provided for @publicFaqReportsQuestion.
  ///
  /// In zh, this message translates to:
  /// **'AI 视频分析可以输出什么？'**
  String get publicFaqReportsQuestion;

  /// No description provided for @publicFaqReportsAnswer.
  ///
  /// In zh, this message translates to:
  /// **'按所选分析能力生成场景、分镜、时间轴和关键帧证据等结构化结果，报告可导出为 Markdown 或 DOCX。AI 分析需要配置可用的模型服务与 AI Worker；模型结论需要结合原始素材复核。'**
  String get publicFaqReportsAnswer;

  /// No description provided for @publicFaqImportQuestion.
  ///
  /// In zh, this message translates to:
  /// **'可以直接分析本地视频和剧本吗？'**
  String get publicFaqImportQuestion;

  /// No description provided for @publicFaqImportAnswer.
  ///
  /// In zh, this message translates to:
  /// **'可以导入自己有权处理的本地视频与剧本文档。剧本支持 Markdown、Fountain、TXT、PDF 和 DOCX；导入后可在工作区阅读和发起分析，无需先提供第三方平台链接。'**
  String get publicFaqImportAnswer;

  /// No description provided for @publicFaqCostQuestion.
  ///
  /// In zh, this message translates to:
  /// **'开源免费是否意味着运行没有成本？'**
  String get publicFaqCostQuestion;

  /// No description provided for @publicFaqCostAnswer.
  ///
  /// In zh, this message translates to:
  /// **'源代码以 MIT 许可证开放，可自行部署、使用和修改。服务器、对象存储、网络流量和外部 AI 模型可能产生费用；本项目不承诺免费托管或免费模型额度。'**
  String get publicFaqCostAnswer;

  /// No description provided for @publicFaqPlatformsQuestion.
  ///
  /// In zh, this message translates to:
  /// **'是否支持所有视频平台和所有链接？'**
  String get publicFaqPlatformsQuestion;

  /// No description provided for @publicFaqPlatformsAnswer.
  ///
  /// In zh, this message translates to:
  /// **'不保证所有平台或链接可用。实际能力取决于部署实例的 Provider 配置、内容授权、访问条件和最近验证结果；应先检查链接再选择格式。公开可访问不等于获得使用授权。'**
  String get publicFaqPlatformsAnswer;

  /// No description provided for @publicFaqMobileQuestion.
  ///
  /// In zh, this message translates to:
  /// **'手机端是否能独立运行 AI 分析？'**
  String get publicFaqMobileQuestion;

  /// No description provided for @publicFaqMobileAnswer.
  ///
  /// In zh, this message translates to:
  /// **'iOS 和 Android 客户端位于独立的 framefetch-app 仓库，使用 Flutter 构建并连接自托管 framefetch-server。媒体处理与 AI 推理由服务端执行，手机端不内置离线提取器或离线 AI 模型。'**
  String get publicFaqMobileAnswer;

  /// No description provided for @publicGuideAction.
  ///
  /// In zh, this message translates to:
  /// **'阅读视频分析与自托管使用指南'**
  String get publicGuideAction;

  /// No description provided for @publicStartTitle.
  ///
  /// In zh, this message translates to:
  /// **'在自己的基础设施上运行 Framefetch'**
  String get publicStartTitle;

  /// No description provided for @publicDeploymentAction.
  ///
  /// In zh, this message translates to:
  /// **'阅读部署说明'**
  String get publicDeploymentAction;

  /// No description provided for @publicGuideTitle.
  ///
  /// In zh, this message translates to:
  /// **'从素材到分析报告'**
  String get publicGuideTitle;

  /// No description provided for @publicGuideVideoTitle.
  ///
  /// In zh, this message translates to:
  /// **'如何从视频得到可复核的 AI 分析报告？'**
  String get publicGuideVideoTitle;

  /// No description provided for @publicGuideVideoParagraphOne.
  ///
  /// In zh, this message translates to:
  /// **'先导入自己拥有或已获授权的本地视频，也可以检查公开媒体链接、确认可用格式并创建任务。视频完成处理后，在任务详情选择分析能力并提交 AI 分析任务。'**
  String get publicGuideVideoParagraphOne;

  /// No description provided for @publicGuideVideoParagraphTwo.
  ///
  /// In zh, this message translates to:
  /// **'服务端 AI Worker 执行分析，页面展示场景、分镜时间轴、关键帧证据等结构化结果。不同分析能力输出不同内容；报告支持 Markdown 与 DOCX 导出，便于继续整理、审阅和分享。关键结论应对照视频与证据复核。'**
  String get publicGuideVideoParagraphTwo;

  /// No description provided for @publicGuideVideoParagraphThree.
  ///
  /// In zh, this message translates to:
  /// **'媒体处理成功不代表分析已经完成；AI 服务不可用时，检查管理员配置的模型 Provider 与 AI Worker 状态。'**
  String get publicGuideVideoParagraphThree;

  /// No description provided for @publicGuideVideoSource.
  ///
  /// In zh, this message translates to:
  /// **'查看 AI 视频分析与报告能力'**
  String get publicGuideVideoSource;

  /// No description provided for @publicGuideScreenplayTitle.
  ///
  /// In zh, this message translates to:
  /// **'如何处理剧本文档？'**
  String get publicGuideScreenplayTitle;

  /// No description provided for @publicGuideScreenplayParagraphOne.
  ///
  /// In zh, this message translates to:
  /// **'在剧本文档工作区导入 Markdown、Fountain、TXT、PDF 或 DOCX。导入后可阅读规范化文档、查看目录并发起分析或改写，结果与处理记录保存在同一工作区。'**
  String get publicGuideScreenplayParagraphOne;

  /// No description provided for @publicGuideScreenplayParagraphTwo.
  ///
  /// In zh, this message translates to:
  /// **'文档是否能够完整提取取决于原文件结构。扫描件、复杂版式或缺失文本的文件需要检查导入结果，不能仅凭任务成功就判断原文已经完整保留。'**
  String get publicGuideScreenplayParagraphTwo;

  /// No description provided for @publicGuideScreenplaySource.
  ///
  /// In zh, this message translates to:
  /// **'查看当前文档处理能力'**
  String get publicGuideScreenplaySource;

  /// No description provided for @publicGuideDeploymentTitle.
  ///
  /// In zh, this message translates to:
  /// **'自托管需要部署哪些服务？'**
  String get publicGuideDeploymentTitle;

  /// No description provided for @publicGuideDeploymentParagraphOne.
  ///
  /// In zh, this message translates to:
  /// **'framefetch-server 包含 Next.js Web 页面、FastAPI API，以及独立的下载、媒体处理与 AI Worker。Docker Compose 管理业务服务，并连接部署者已有的 PostgreSQL、RabbitMQ、Redis 和 MinIO。默认 Web 端口为 8101，API 端口为 8111。'**
  String get publicGuideDeploymentParagraphOne;

  /// No description provided for @publicGuideDeploymentParagraphTwo.
  ///
  /// In zh, this message translates to:
  /// **'使用根 README 的快速开始说明安装和配置，按实际需求启用模型服务与媒体 Provider。MIT 许可证开放源代码；基础设施、存储、流量和外部模型的费用由部署者承担。'**
  String get publicGuideDeploymentParagraphTwo;

  /// No description provided for @publicGuideDeploymentParagraphThree.
  ///
  /// In zh, this message translates to:
  /// **'自托管不表示数据永远不离开设备：使用外部 AI Provider 时，分析所需内容会发送到该服务。启用模型前应核对其数据处理约定，并确认素材可用于该分析。'**
  String get publicGuideDeploymentParagraphThree;

  /// No description provided for @publicGuideDeploymentSource.
  ///
  /// In zh, this message translates to:
  /// **'阅读自托管部署步骤'**
  String get publicGuideDeploymentSource;

  /// No description provided for @publicGuideClientsTitle.
  ///
  /// In zh, this message translates to:
  /// **'Web 与 iOS / Android 客户端如何选择？'**
  String get publicGuideClientsTitle;

  /// No description provided for @publicGuideClientsParagraphOne.
  ///
  /// In zh, this message translates to:
  /// **'Web 随 framefetch-server 部署，适合在浏览器中管理素材、任务、分析报告与管理员配置。framefetch-app 是单独维护的 Flutter 原生客户端，面向 iOS 和 Android，需要连接可访问的 framefetch-server。'**
  String get publicGuideClientsParagraphOne;

  /// No description provided for @publicGuideClientsParagraphTwo.
  ///
  /// In zh, this message translates to:
  /// **'手机端负责上传、任务操作与结果展示，媒体处理与 AI 推理仍由服务端完成。当前移动端从源码构建，不提供 App Store 或 Google Play 预构建安装包，也不提供离线 AI。'**
  String get publicGuideClientsParagraphTwo;

  /// No description provided for @publicGuideClientsSource.
  ///
  /// In zh, this message translates to:
  /// **'查看 Flutter 移动客户端与构建说明'**
  String get publicGuideClientsSource;

  /// No description provided for @publicGuideAvailabilityTitle.
  ///
  /// In zh, this message translates to:
  /// **'为什么同一个平台的不同链接会有不同结果？'**
  String get publicGuideAvailabilityTitle;

  /// No description provided for @publicGuideAvailabilityParagraphOne.
  ///
  /// In zh, this message translates to:
  /// **'平台支持由部署实例、Provider 版本、访问条件和内容授权共同决定。存在某个平台的适配器，并不意味着该平台的所有链接均可处理。以当前实例的链接检查、Provider 状态与最终文件验证为准。'**
  String get publicGuideAvailabilityParagraphOne;

  /// No description provided for @publicGuideAvailabilityParagraphTwo.
  ///
  /// In zh, this message translates to:
  /// **'默认匿名流程面向可正向确认的公开、免费、非 DRM 内容。只处理自己有权使用的素材；账号能看到内容不能替代下载、导出或后续使用授权。'**
  String get publicGuideAvailabilityParagraphTwo;

  /// No description provided for @publicGuideAvailabilitySource.
  ///
  /// In zh, this message translates to:
  /// **'查看能力范围与运行边界'**
  String get publicGuideAvailabilitySource;

  /// No description provided for @publicExternalLinkError.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法打开外部链接'**
  String get publicExternalLinkError;

  /// No description provided for @downloadDetailNavigation.
  ///
  /// In zh, this message translates to:
  /// **'任务详情'**
  String get downloadDetailNavigation;

  /// No description provided for @sourceLabel.
  ///
  /// In zh, this message translates to:
  /// **'来源'**
  String get sourceLabel;

  /// No description provided for @formatLabel.
  ///
  /// In zh, this message translates to:
  /// **'格式'**
  String get formatLabel;

  /// No description provided for @stageLabel.
  ///
  /// In zh, this message translates to:
  /// **'执行阶段'**
  String get stageLabel;

  /// No description provided for @attemptLabel.
  ///
  /// In zh, this message translates to:
  /// **'执行次数'**
  String get attemptLabel;

  /// No description provided for @fileAvailabilityLabel.
  ///
  /// In zh, this message translates to:
  /// **'文件状态'**
  String get fileAvailabilityLabel;

  /// No description provided for @createdAtLabel.
  ///
  /// In zh, this message translates to:
  /// **'创建时间'**
  String get createdAtLabel;

  /// No description provided for @finishedAtLabel.
  ///
  /// In zh, this message translates to:
  /// **'完成时间'**
  String get finishedAtLabel;

  /// No description provided for @durationLabel.
  ///
  /// In zh, this message translates to:
  /// **'媒体时长'**
  String get durationLabel;

  /// No description provided for @fileAvailable.
  ///
  /// In zh, this message translates to:
  /// **'文件可获取'**
  String get fileAvailable;

  /// No description provided for @fileCleared.
  ///
  /// In zh, this message translates to:
  /// **'文件已清理'**
  String get fileCleared;

  /// No description provided for @downloadStageRevalidating.
  ///
  /// In zh, this message translates to:
  /// **'重新校验'**
  String get downloadStageRevalidating;

  /// No description provided for @downloadStageDownloading.
  ///
  /// In zh, this message translates to:
  /// **'正在下载'**
  String get downloadStageDownloading;

  /// No description provided for @downloadStageRemuxing.
  ///
  /// In zh, this message translates to:
  /// **'封装处理中'**
  String get downloadStageRemuxing;

  /// No description provided for @downloadStageVerifying.
  ///
  /// In zh, this message translates to:
  /// **'正在验证'**
  String get downloadStageVerifying;

  /// No description provided for @downloadStageUploading.
  ///
  /// In zh, this message translates to:
  /// **'正在保存'**
  String get downloadStageUploading;

  /// No description provided for @downloadStageUnknown.
  ///
  /// In zh, this message translates to:
  /// **'阶段未知'**
  String get downloadStageUnknown;

  /// No description provided for @formatUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'格式信息暂不可用'**
  String get formatUnavailable;

  /// No description provided for @loginAction.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get loginAction;

  /// No description provided for @welcomeBack.
  ///
  /// In zh, this message translates to:
  /// **'欢迎回来'**
  String get welcomeBack;

  /// No description provided for @createAccountTitle.
  ///
  /// In zh, this message translates to:
  /// **'创建你的帧取账户'**
  String get createAccountTitle;

  /// No description provided for @emailLabel.
  ///
  /// In zh, this message translates to:
  /// **'邮箱地址'**
  String get emailLabel;

  /// No description provided for @usernameLabel.
  ///
  /// In zh, this message translates to:
  /// **'用户名'**
  String get usernameLabel;

  /// No description provided for @usernameHelp.
  ///
  /// In zh, this message translates to:
  /// **'2–32 个字符，仅支持字母、数字、中文以及 _-. 字符。'**
  String get usernameHelp;

  /// No description provided for @passwordLabel.
  ///
  /// In zh, this message translates to:
  /// **'密码'**
  String get passwordLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In zh, this message translates to:
  /// **'确认密码'**
  String get confirmPasswordLabel;

  /// No description provided for @showPassword.
  ///
  /// In zh, this message translates to:
  /// **'显示密码'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In zh, this message translates to:
  /// **'隐藏密码'**
  String get hidePassword;

  /// No description provided for @loginSubmit.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get loginSubmit;

  /// No description provided for @loginSubmitting.
  ///
  /// In zh, this message translates to:
  /// **'正在登录…'**
  String get loginSubmitting;

  /// No description provided for @registerSubmit.
  ///
  /// In zh, this message translates to:
  /// **'注册并登录'**
  String get registerSubmit;

  /// No description provided for @registerSubmitting.
  ///
  /// In zh, this message translates to:
  /// **'正在创建…'**
  String get registerSubmitting;

  /// No description provided for @goRegister.
  ///
  /// In zh, this message translates to:
  /// **'创建账户'**
  String get goRegister;

  /// No description provided for @goLogin.
  ///
  /// In zh, this message translates to:
  /// **'返回登录'**
  String get goLogin;

  /// No description provided for @invalidEmail.
  ///
  /// In zh, this message translates to:
  /// **'请输入有效的邮箱地址'**
  String get invalidEmail;

  /// No description provided for @invalidUsername.
  ///
  /// In zh, this message translates to:
  /// **'用户名需为 2–32 个字符，仅支持字母、数字、中文以及 _-. 字符。'**
  String get invalidUsername;

  /// No description provided for @invalidPassword.
  ///
  /// In zh, this message translates to:
  /// **'密码至少需要 8 个字符'**
  String get invalidPassword;

  /// No description provided for @passwordMismatch.
  ///
  /// In zh, this message translates to:
  /// **'两次输入的密码不一致'**
  String get passwordMismatch;

  /// No description provided for @invalidCredentialsError.
  ///
  /// In zh, this message translates to:
  /// **'邮箱或密码错误，请重新输入。'**
  String get invalidCredentialsError;

  /// No description provided for @emailRegisteredError.
  ///
  /// In zh, this message translates to:
  /// **'该邮箱已注册，请直接登录或使用其他邮箱。'**
  String get emailRegisteredError;

  /// No description provided for @usernameRegisteredError.
  ///
  /// In zh, this message translates to:
  /// **'该用户名已被使用，请更换后重试。'**
  String get usernameRegisteredError;

  /// No description provided for @unauthenticatedError.
  ///
  /// In zh, this message translates to:
  /// **'登录状态已失效，请重新登录。'**
  String get unauthenticatedError;

  /// No description provided for @rateLimitedError.
  ///
  /// In zh, this message translates to:
  /// **'操作过于频繁，请稍后再试。'**
  String get rateLimitedError;

  /// No description provided for @serviceUnavailableError.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法连接服务，请检查网络后重试。'**
  String get serviceUnavailableError;

  /// No description provided for @unknownAuthError.
  ///
  /// In zh, this message translates to:
  /// **'操作未完成，请稍后重试。'**
  String get unknownAuthError;

  /// No description provided for @logoutAction.
  ///
  /// In zh, this message translates to:
  /// **'退出登录'**
  String get logoutAction;

  /// No description provided for @loggingOut.
  ///
  /// In zh, this message translates to:
  /// **'正在退出…'**
  String get loggingOut;

  /// No description provided for @downloadHomeTitle.
  ///
  /// In zh, this message translates to:
  /// **'把素材，带回本地。'**
  String get downloadHomeTitle;

  /// No description provided for @linkIntakeMode.
  ///
  /// In zh, this message translates to:
  /// **'链接解析'**
  String get linkIntakeMode;

  /// No description provided for @videoIntakeMode.
  ///
  /// In zh, this message translates to:
  /// **'本地视频'**
  String get videoIntakeMode;

  /// No description provided for @screenplayIntakeMode.
  ///
  /// In zh, this message translates to:
  /// **'剧本文档'**
  String get screenplayIntakeMode;

  /// No description provided for @videoIntakeTitle.
  ///
  /// In zh, this message translates to:
  /// **'导入本地视频'**
  String get videoIntakeTitle;

  /// No description provided for @selectVideoFile.
  ///
  /// In zh, this message translates to:
  /// **'选择视频文件'**
  String get selectVideoFile;

  /// No description provided for @reimportDownloadAction.
  ///
  /// In zh, this message translates to:
  /// **'返回首页重新导入'**
  String get reimportDownloadAction;

  /// No description provided for @screenplayIntakeTitle.
  ///
  /// In zh, this message translates to:
  /// **'导入剧本文档'**
  String get screenplayIntakeTitle;

  /// No description provided for @selectScreenplayFile.
  ///
  /// In zh, this message translates to:
  /// **'选择剧本文件'**
  String get selectScreenplayFile;

  /// No description provided for @choosingUploadFile.
  ///
  /// In zh, this message translates to:
  /// **'正在选择文件…'**
  String get choosingUploadFile;

  /// No description provided for @hashingUploadFile.
  ///
  /// In zh, this message translates to:
  /// **'正在校验文件…'**
  String get hashingUploadFile;

  /// No description provided for @creatingUpload.
  ///
  /// In zh, this message translates to:
  /// **'正在创建上传任务…'**
  String get creatingUpload;

  /// No description provided for @uploadingFile.
  ///
  /// In zh, this message translates to:
  /// **'正在上传…'**
  String get uploadingFile;

  /// No description provided for @cancelUploadAction.
  ///
  /// In zh, this message translates to:
  /// **'取消上传'**
  String get cancelUploadAction;

  /// No description provided for @completingUpload.
  ///
  /// In zh, this message translates to:
  /// **'正在完成上传…'**
  String get completingUpload;

  /// No description provided for @emptyUploadFileError.
  ///
  /// In zh, this message translates to:
  /// **'请选择包含内容的文件。'**
  String get emptyUploadFileError;

  /// No description provided for @invalidVideoFileError.
  ///
  /// In zh, this message translates to:
  /// **'当前只支持上传 MP4 视频。'**
  String get invalidVideoFileError;

  /// No description provided for @invalidDocumentFileError.
  ///
  /// In zh, this message translates to:
  /// **'支持 DOCX、PDF、TXT、Markdown 和 Fountain 剧本。'**
  String get invalidDocumentFileError;

  /// No description provided for @documentTooLargeError.
  ///
  /// In zh, this message translates to:
  /// **'剧本文档不能超过 50 MB。'**
  String get documentTooLargeError;

  /// No description provided for @fileSelectionFailedError.
  ///
  /// In zh, this message translates to:
  /// **'无法打开系统文件选择器，请重试。'**
  String get fileSelectionFailedError;

  /// No description provided for @inaccessibleFileError.
  ///
  /// In zh, this message translates to:
  /// **'无法读取所选文件，请重新选择。'**
  String get inaccessibleFileError;

  /// No description provided for @fileUploadFailed.
  ///
  /// In zh, this message translates to:
  /// **'文件上传失败，请检查网络后重试。'**
  String get fileUploadFailed;

  /// No description provided for @mediaUrlHint.
  ///
  /// In zh, this message translates to:
  /// **'粘贴公开链接或整段分享文案'**
  String get mediaUrlHint;

  /// No description provided for @mediaUrlLabel.
  ///
  /// In zh, this message translates to:
  /// **'公开内容地址'**
  String get mediaUrlLabel;

  /// No description provided for @clearMediaUrl.
  ///
  /// In zh, this message translates to:
  /// **'清空链接'**
  String get clearMediaUrl;

  /// No description provided for @inspectMedia.
  ///
  /// In zh, this message translates to:
  /// **'解析媒体'**
  String get inspectMedia;

  /// No description provided for @activityHistoryEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无处理记录'**
  String get activityHistoryEmpty;

  /// No description provided for @clearFiltersAction.
  ///
  /// In zh, this message translates to:
  /// **'清空筛选'**
  String get clearFiltersAction;

  /// No description provided for @providerNoCapabilities.
  ///
  /// In zh, this message translates to:
  /// **'暂无已登记能力'**
  String get providerNoCapabilities;

  /// No description provided for @intentQueued.
  ///
  /// In zh, this message translates to:
  /// **'等待解析'**
  String get intentQueued;

  /// No description provided for @intentResolving.
  ///
  /// In zh, this message translates to:
  /// **'正在解析媒体'**
  String get intentResolving;

  /// No description provided for @intentExpired.
  ///
  /// In zh, this message translates to:
  /// **'解析结果已过期'**
  String get intentExpired;

  /// No description provided for @intentFailed.
  ///
  /// In zh, this message translates to:
  /// **'解析未能完成'**
  String get intentFailed;

  /// No description provided for @intentCancelled.
  ///
  /// In zh, this message translates to:
  /// **'解析已取消'**
  String get intentCancelled;

  /// No description provided for @intentRefreshAction.
  ///
  /// In zh, this message translates to:
  /// **'更新解析结果'**
  String get intentRefreshAction;

  /// No description provided for @intentCancelling.
  ///
  /// In zh, this message translates to:
  /// **'正在取消解析'**
  String get intentCancelling;

  /// No description provided for @intentCancelAction.
  ///
  /// In zh, this message translates to:
  /// **'取消解析'**
  String get intentCancelAction;

  /// No description provided for @intentHandedOff.
  ///
  /// In zh, this message translates to:
  /// **'已创建下载任务'**
  String get intentHandedOff;

  /// No description provided for @intentRefreshHint.
  ///
  /// In zh, this message translates to:
  /// **'更新后需重新确认下载规格。'**
  String get intentRefreshHint;

  /// No description provided for @inspectingMedia.
  ///
  /// In zh, this message translates to:
  /// **'解析中…'**
  String get inspectingMedia;

  /// No description provided for @mediaUrlError.
  ///
  /// In zh, this message translates to:
  /// **'请输入有效的公开 HTTP(S) 视频地址。'**
  String get mediaUrlError;

  /// No description provided for @publicInputRequired.
  ///
  /// In zh, this message translates to:
  /// **'请输入公开链接或完整分享文案。'**
  String get publicInputRequired;

  /// No description provided for @operationFailed.
  ///
  /// In zh, this message translates to:
  /// **'操作未完成，请稍后重试。'**
  String get operationFailed;

  /// No description provided for @deletionBlockedByAnalysis.
  ///
  /// In zh, this message translates to:
  /// **'资源正在被分析使用，请先结束相关分析后再删除。'**
  String get deletionBlockedByAnalysis;

  /// No description provided for @inspectionResultTitle.
  ///
  /// In zh, this message translates to:
  /// **'解析结果'**
  String get inspectionResultTitle;

  /// No description provided for @formatSelectionTitle.
  ///
  /// In zh, this message translates to:
  /// **'选择下载格式'**
  String get formatSelectionTitle;

  /// No description provided for @createDownloadAction.
  ///
  /// In zh, this message translates to:
  /// **'创建下载任务'**
  String get createDownloadAction;

  /// No description provided for @creatingDownload.
  ///
  /// In zh, this message translates to:
  /// **'正在创建…'**
  String get creatingDownload;

  /// No description provided for @sourceCandidatesTitle.
  ///
  /// In zh, this message translates to:
  /// **'选择文章中的视频'**
  String get sourceCandidatesTitle;

  /// No description provided for @sourceCandidatesEmpty.
  ///
  /// In zh, this message translates to:
  /// **'文章中没有发现可处理的视频。'**
  String get sourceCandidatesEmpty;

  /// No description provided for @candidateUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'当前来源不可处理'**
  String get candidateUnavailable;

  /// No description provided for @mediaUnavailableDescription.
  ///
  /// In zh, this message translates to:
  /// **'服务端未批准创建下载任务。请根据提示更换公开链接或处理方式。'**
  String get mediaUnavailableDescription;

  /// No description provided for @noFormatsAvailable.
  ///
  /// In zh, this message translates to:
  /// **'解析成功，但没有可创建任务的下载格式。'**
  String get noFormatsAvailable;

  /// No description provided for @imageGalleryFormatDetails.
  ///
  /// In zh, this message translates to:
  /// **'{count} 张原图 · ZIP'**
  String imageGalleryFormatDetails(Object count);

  /// No description provided for @videoCollectionFormatDetails.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个视频 · ZIP'**
  String videoCollectionFormatDetails(Object count);

  /// No description provided for @providerRestrictedError.
  ///
  /// In zh, this message translates to:
  /// **'该媒体为私有或受访问权限限制，无法处理。'**
  String get providerRestrictedError;

  /// No description provided for @providerLinkError.
  ///
  /// In zh, this message translates to:
  /// **'分享链接已失效或无法定位视频，请复制新的公开分享链接。'**
  String get providerLinkError;

  /// No description provided for @durationLimitError.
  ///
  /// In zh, this message translates to:
  /// **'该媒体时长超过服务允许的上限。'**
  String get durationLimitError;

  /// No description provided for @articleRestrictedError.
  ///
  /// In zh, this message translates to:
  /// **'文章需要验证、关注或付费，无法安全读取媒体来源。'**
  String get articleRestrictedError;

  /// No description provided for @articleDiscoveryError.
  ///
  /// In zh, this message translates to:
  /// **'无法读取文章中的媒体来源，请确认文章公开且链接有效。'**
  String get articleDiscoveryError;

  /// No description provided for @mediaCoverPending.
  ///
  /// In zh, this message translates to:
  /// **'封面生成中'**
  String get mediaCoverPending;

  /// No description provided for @mediaCoverUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'暂无封面'**
  String get mediaCoverUnavailable;

  /// No description provided for @mediaCoverLabel.
  ///
  /// In zh, this message translates to:
  /// **'视频封面'**
  String get mediaCoverLabel;

  /// No description provided for @watchVideoAction.
  ///
  /// In zh, this message translates to:
  /// **'观看'**
  String get watchVideoAction;

  /// No description provided for @getFileAction.
  ///
  /// In zh, this message translates to:
  /// **'获取文件'**
  String get getFileAction;

  /// No description provided for @playbackFailed.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法播放视频，请重新获取播放地址。'**
  String get playbackFailed;

  /// No description provided for @downloadOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法打开系统下载，请稍后重试。'**
  String get downloadOpenFailed;

  /// No description provided for @aiAnalysisTitle.
  ///
  /// In zh, this message translates to:
  /// **'AI 智能分析'**
  String get aiAnalysisTitle;

  /// No description provided for @screenplayAnalysisTitle.
  ///
  /// In zh, this message translates to:
  /// **'剧本分析与改写'**
  String get screenplayAnalysisTitle;

  /// No description provided for @analysisSkillLabel.
  ///
  /// In zh, this message translates to:
  /// **'分析 Skill'**
  String get analysisSkillLabel;

  /// No description provided for @analysisOutputLanguageLabel.
  ///
  /// In zh, this message translates to:
  /// **'输出语言'**
  String get analysisOutputLanguageLabel;

  /// No description provided for @simplifiedChineseLabel.
  ///
  /// In zh, this message translates to:
  /// **'简体中文'**
  String get simplifiedChineseLabel;

  /// No description provided for @englishLabel.
  ///
  /// In zh, this message translates to:
  /// **'English'**
  String get englishLabel;

  /// No description provided for @analysisPromptLabel.
  ///
  /// In zh, this message translates to:
  /// **'分析重点'**
  String get analysisPromptLabel;

  /// No description provided for @restoreDefaultPrompt.
  ///
  /// In zh, this message translates to:
  /// **'恢复默认值'**
  String get restoreDefaultPrompt;

  /// No description provided for @startAnalysisAction.
  ///
  /// In zh, this message translates to:
  /// **'开始 AI 分析'**
  String get startAnalysisAction;

  /// No description provided for @startingAnalysis.
  ///
  /// In zh, this message translates to:
  /// **'正在创建分析…'**
  String get startingAnalysis;

  /// No description provided for @analysisSkillsEmpty.
  ///
  /// In zh, this message translates to:
  /// **'当前没有可用的分析 Skill，请检查 AI 服务配置后重试。'**
  String get analysisSkillsEmpty;

  /// No description provided for @analysisLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法读取 AI 分析服务。'**
  String get analysisLoadFailed;

  /// No description provided for @analysisStatusQueued.
  ///
  /// In zh, this message translates to:
  /// **'等待分析'**
  String get analysisStatusQueued;

  /// No description provided for @analysisStatusRunning.
  ///
  /// In zh, this message translates to:
  /// **'正在分析'**
  String get analysisStatusRunning;

  /// No description provided for @analysisStatusRetryWait.
  ///
  /// In zh, this message translates to:
  /// **'等待重试'**
  String get analysisStatusRetryWait;

  /// No description provided for @analysisStatusSucceeded.
  ///
  /// In zh, this message translates to:
  /// **'分析已完成'**
  String get analysisStatusSucceeded;

  /// No description provided for @analysisStatusFailed.
  ///
  /// In zh, this message translates to:
  /// **'分析失败'**
  String get analysisStatusFailed;

  /// No description provided for @analysisStatusCancelled.
  ///
  /// In zh, this message translates to:
  /// **'分析已取消'**
  String get analysisStatusCancelled;

  /// No description provided for @analysisStagePreparing.
  ///
  /// In zh, this message translates to:
  /// **'准备输入'**
  String get analysisStagePreparing;

  /// No description provided for @analysisStageAnalyzing.
  ///
  /// In zh, this message translates to:
  /// **'执行 AI 分析'**
  String get analysisStageAnalyzing;

  /// No description provided for @analysisStageValidating.
  ///
  /// In zh, this message translates to:
  /// **'校验结构化结果'**
  String get analysisStageValidating;

  /// No description provided for @analysisStagePublishing.
  ///
  /// In zh, this message translates to:
  /// **'发布分析报告'**
  String get analysisStagePublishing;

  /// No description provided for @analysisStagePending.
  ///
  /// In zh, this message translates to:
  /// **'等待调度'**
  String get analysisStagePending;

  /// No description provided for @analysisRunSummary.
  ///
  /// In zh, this message translates to:
  /// **'第 {run} 次执行 · 本次第 {attempt} 个技术尝试'**
  String analysisRunSummary(int run, int attempt);

  /// No description provided for @analysisProgressSemantics.
  ///
  /// In zh, this message translates to:
  /// **'分析进度 {progress}%'**
  String analysisProgressSemantics(int progress);

  /// No description provided for @refreshAnalysisAction.
  ///
  /// In zh, this message translates to:
  /// **'刷新分析'**
  String get refreshAnalysisAction;

  /// No description provided for @cancelAnalysisAction.
  ///
  /// In zh, this message translates to:
  /// **'取消分析'**
  String get cancelAnalysisAction;

  /// No description provided for @cancelAnalysisTitle.
  ///
  /// In zh, this message translates to:
  /// **'取消当前分析任务？'**
  String get cancelAnalysisTitle;

  /// No description provided for @cancelAnalysisDescription.
  ///
  /// In zh, this message translates to:
  /// **'确认后将停止当前分析。你之后仍可重新发起分析任务。'**
  String get cancelAnalysisDescription;

  /// No description provided for @confirmCancelAnalysis.
  ///
  /// In zh, this message translates to:
  /// **'确认取消分析'**
  String get confirmCancelAnalysis;

  /// No description provided for @retryAnalysisAction.
  ///
  /// In zh, this message translates to:
  /// **'重试分析'**
  String get retryAnalysisAction;

  /// No description provided for @retryingAnalysis.
  ///
  /// In zh, this message translates to:
  /// **'正在重试…'**
  String get retryingAnalysis;

  /// No description provided for @deleteAnalysisAction.
  ///
  /// In zh, this message translates to:
  /// **'删除分析'**
  String get deleteAnalysisAction;

  /// No description provided for @deletingAnalysis.
  ///
  /// In zh, this message translates to:
  /// **'正在删除…'**
  String get deletingAnalysis;

  /// No description provided for @deleteAnalysisTitle.
  ///
  /// In zh, this message translates to:
  /// **'删除这次分析？'**
  String get deleteAnalysisTitle;

  /// No description provided for @deleteAnalysisDescription.
  ///
  /// In zh, this message translates to:
  /// **'分析结果与报告将被清理，此操作无法撤销。下载文件不会受到影响。'**
  String get deleteAnalysisDescription;

  /// No description provided for @confirmDeleteAnalysis.
  ///
  /// In zh, this message translates to:
  /// **'确认删除'**
  String get confirmDeleteAnalysis;

  /// No description provided for @analysisOperationFailed.
  ///
  /// In zh, this message translates to:
  /// **'AI 分析操作未完成，请稍后重试。'**
  String get analysisOperationFailed;

  /// No description provided for @analysisExecutionFailed.
  ///
  /// In zh, this message translates to:
  /// **'AI 分析执行失败，请稍后重试。'**
  String get analysisExecutionFailed;

  /// No description provided for @analysisServiceUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'AI 分析服务暂时不可用，请稍后重试。'**
  String get analysisServiceUnavailable;

  /// No description provided for @analysisAuthenticationRequired.
  ///
  /// In zh, this message translates to:
  /// **'AI 分析服务未登录，请完成登录后重试。'**
  String get analysisAuthenticationRequired;

  /// No description provided for @analysisTimeoutError.
  ///
  /// In zh, this message translates to:
  /// **'AI 分析超时，请稍后重试。'**
  String get analysisTimeoutError;

  /// No description provided for @analysisInvalidResult.
  ///
  /// In zh, this message translates to:
  /// **'AI 返回结果未通过校验，请重新分析。'**
  String get analysisInvalidResult;

  /// No description provided for @screenplayLoglineLabel.
  ///
  /// In zh, this message translates to:
  /// **'一句话梗概'**
  String get screenplayLoglineLabel;

  /// No description provided for @screenplaySynopsisLabel.
  ///
  /// In zh, this message translates to:
  /// **'故事梗概'**
  String get screenplaySynopsisLabel;

  /// No description provided for @screenplaySceneCoverageLabel.
  ///
  /// In zh, this message translates to:
  /// **'逐场景覆盖'**
  String get screenplaySceneCoverageLabel;

  /// No description provided for @screenplayMainCharactersLabel.
  ///
  /// In zh, this message translates to:
  /// **'主要人物'**
  String get screenplayMainCharactersLabel;

  /// No description provided for @screenplaySourceScenesLabel.
  ///
  /// In zh, this message translates to:
  /// **'源场景'**
  String get screenplaySourceScenesLabel;

  /// No description provided for @screenplayOutputScenesLabel.
  ///
  /// In zh, this message translates to:
  /// **'输出场景'**
  String get screenplayOutputScenesLabel;

  /// No description provided for @screenplayRewriteSummaryTitle.
  ///
  /// In zh, this message translates to:
  /// **'修改摘要'**
  String get screenplayRewriteSummaryTitle;

  /// No description provided for @screenplayGlossaryTitle.
  ///
  /// In zh, this message translates to:
  /// **'统一术语'**
  String get screenplayGlossaryTitle;

  /// No description provided for @screenplayFullReportTitle.
  ///
  /// In zh, this message translates to:
  /// **'完整报告'**
  String get screenplayFullReportTitle;

  /// No description provided for @screenplayStructuredResultTitle.
  ///
  /// In zh, this message translates to:
  /// **'结构化结果'**
  String get screenplayStructuredResultTitle;

  /// No description provided for @analysisResourceLimit.
  ///
  /// In zh, this message translates to:
  /// **'视频超出分析资源限制，请使用更短或更小的视频。'**
  String get analysisResourceLimit;

  /// No description provided for @analysisInputUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'用于分析的视频文件已不可用，请重新创建下载任务。'**
  String get analysisInputUnavailable;

  /// No description provided for @screenplayAnalysisInputUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'用于分析的剧本文档已不可用，请重新上传剧本。'**
  String get screenplayAnalysisInputUnavailable;

  /// No description provided for @analysisUsageLimited.
  ///
  /// In zh, this message translates to:
  /// **'AI 服务额度不足，请恢复可用额度后重试。'**
  String get analysisUsageLimited;

  /// No description provided for @analysisWorkerLost.
  ///
  /// In zh, this message translates to:
  /// **'分析执行服务连接中断，请稍后重试。'**
  String get analysisWorkerLost;

  /// No description provided for @shotCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'分镜'**
  String get shotCountLabel;

  /// No description provided for @visualAssetCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'视觉资产'**
  String get visualAssetCountLabel;

  /// No description provided for @visualSummaryTitle.
  ///
  /// In zh, this message translates to:
  /// **'视觉摘要'**
  String get visualSummaryTitle;

  /// No description provided for @productionAdviceTitle.
  ///
  /// In zh, this message translates to:
  /// **'制作建议'**
  String get productionAdviceTitle;

  /// No description provided for @analysisResultSectionLabel.
  ///
  /// In zh, this message translates to:
  /// **'结果分类'**
  String get analysisResultSectionLabel;

  /// No description provided for @analysisScenesTab.
  ///
  /// In zh, this message translates to:
  /// **'场景'**
  String get analysisScenesTab;

  /// No description provided for @analysisShotsTab.
  ///
  /// In zh, this message translates to:
  /// **'分镜'**
  String get analysisShotsTab;

  /// No description provided for @analysisHighlightsTab.
  ///
  /// In zh, this message translates to:
  /// **'高光'**
  String get analysisHighlightsTab;

  /// No description provided for @analysisAssetsTab.
  ///
  /// In zh, this message translates to:
  /// **'资产'**
  String get analysisAssetsTab;

  /// No description provided for @analysisReportTab.
  ///
  /// In zh, this message translates to:
  /// **'报告预览'**
  String get analysisReportTab;

  /// No description provided for @openAnalysisReportAction.
  ///
  /// In zh, this message translates to:
  /// **'打开报告预览'**
  String get openAnalysisReportAction;

  /// No description provided for @analysisReportLoading.
  ///
  /// In zh, this message translates to:
  /// **'正在准备报告预览…'**
  String get analysisReportLoading;

  /// No description provided for @downloadAnalysisReportAction.
  ///
  /// In zh, this message translates to:
  /// **'导出 Markdown'**
  String get downloadAnalysisReportAction;

  /// No description provided for @exportAnalysisReportAction.
  ///
  /// In zh, this message translates to:
  /// **'分享报告'**
  String get exportAnalysisReportAction;

  /// No description provided for @analysisReportDownloaded.
  ///
  /// In zh, this message translates to:
  /// **'报告已保存到你选择的位置。'**
  String get analysisReportDownloaded;

  /// No description provided for @analysisReportDownloadFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法保存报告，请稍后重试。'**
  String get analysisReportDownloadFailed;

  /// No description provided for @analysisReportExportFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法导出报告，请稍后重试。'**
  String get analysisReportExportFailed;

  /// No description provided for @analysisEmptySection.
  ///
  /// In zh, this message translates to:
  /// **'当前分类没有识别结果。'**
  String get analysisEmptySection;

  /// No description provided for @loadMoreAnalysisResults.
  ///
  /// In zh, this message translates to:
  /// **'加载更多（剩余 {count} 项）'**
  String loadMoreAnalysisResults(int count);

  /// No description provided for @highlightScoreLabel.
  ///
  /// In zh, this message translates to:
  /// **'评分'**
  String get highlightScoreLabel;

  /// No description provided for @articleKeyPointsTitle.
  ///
  /// In zh, this message translates to:
  /// **'核心观点'**
  String get articleKeyPointsTitle;

  /// No description provided for @articleClosingTitle.
  ///
  /// In zh, this message translates to:
  /// **'结语'**
  String get articleClosingTitle;

  /// No description provided for @articleLimitationsTitle.
  ///
  /// In zh, this message translates to:
  /// **'事实说明'**
  String get articleLimitationsTitle;

  /// No description provided for @articleEvidenceLabel.
  ///
  /// In zh, this message translates to:
  /// **'画面证据'**
  String get articleEvidenceLabel;

  /// No description provided for @assetTypePerson.
  ///
  /// In zh, this message translates to:
  /// **'人物'**
  String get assetTypePerson;

  /// No description provided for @assetTypeLocation.
  ///
  /// In zh, this message translates to:
  /// **'地点'**
  String get assetTypeLocation;

  /// No description provided for @assetTypeObject.
  ///
  /// In zh, this message translates to:
  /// **'物体'**
  String get assetTypeObject;

  /// No description provided for @assetTypeProduct.
  ///
  /// In zh, this message translates to:
  /// **'产品'**
  String get assetTypeProduct;

  /// No description provided for @assetTypeLogo.
  ///
  /// In zh, this message translates to:
  /// **'标志'**
  String get assetTypeLogo;

  /// No description provided for @assetTypeOnScreenText.
  ///
  /// In zh, this message translates to:
  /// **'画面文字'**
  String get assetTypeOnScreenText;

  /// No description provided for @adminCenterTitle.
  ///
  /// In zh, this message translates to:
  /// **'管理中心'**
  String get adminCenterTitle;

  /// No description provided for @adminAnalyticsTitle.
  ///
  /// In zh, this message translates to:
  /// **'使用统计'**
  String get adminAnalyticsTitle;

  /// No description provided for @adminFilesTitle.
  ///
  /// In zh, this message translates to:
  /// **'文件管理'**
  String get adminFilesTitle;

  /// No description provided for @adminUsersTitle.
  ///
  /// In zh, this message translates to:
  /// **'用户管理'**
  String get adminUsersTitle;

  /// No description provided for @adminProvidersTitle.
  ///
  /// In zh, this message translates to:
  /// **'平台目录'**
  String get adminProvidersTitle;

  /// No description provided for @adminAiProvidersTitle.
  ///
  /// In zh, this message translates to:
  /// **'AI 服务'**
  String get adminAiProvidersTitle;

  /// No description provided for @adminDays.
  ///
  /// In zh, this message translates to:
  /// **'{days} 天'**
  String adminDays(int days);

  /// No description provided for @adminSuccessRate.
  ///
  /// In zh, this message translates to:
  /// **'成功率'**
  String get adminSuccessRate;

  /// No description provided for @adminDownloadedBytes.
  ///
  /// In zh, this message translates to:
  /// **'下载量'**
  String get adminDownloadedBytes;

  /// No description provided for @adminSourceBreakdown.
  ///
  /// In zh, this message translates to:
  /// **'来源分布'**
  String get adminSourceBreakdown;

  /// No description provided for @adminFilesEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无持久文件'**
  String get adminFilesEmpty;

  /// No description provided for @adminRoleLabel.
  ///
  /// In zh, this message translates to:
  /// **'角色'**
  String get adminRoleLabel;

  /// No description provided for @adminRoleUser.
  ///
  /// In zh, this message translates to:
  /// **'普通用户'**
  String get adminRoleUser;

  /// No description provided for @adminRoleAdmin.
  ///
  /// In zh, this message translates to:
  /// **'管理员'**
  String get adminRoleAdmin;

  /// No description provided for @adminAccountActive.
  ///
  /// In zh, this message translates to:
  /// **'允许登录和访问服务'**
  String get adminAccountActive;

  /// No description provided for @adminAccountEnabled.
  ///
  /// In zh, this message translates to:
  /// **'已启用'**
  String get adminAccountEnabled;

  /// No description provided for @adminAccountDisabled.
  ///
  /// In zh, this message translates to:
  /// **'已停用'**
  String get adminAccountDisabled;

  /// No description provided for @adminCurrentUser.
  ///
  /// In zh, this message translates to:
  /// **'当前账户'**
  String get adminCurrentUser;

  /// No description provided for @saveAction.
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get saveAction;

  /// No description provided for @editAction.
  ///
  /// In zh, this message translates to:
  /// **'编辑'**
  String get editAction;

  /// No description provided for @adminSystemRegistered.
  ///
  /// In zh, this message translates to:
  /// **'系统已注册'**
  String get adminSystemRegistered;

  /// No description provided for @adminSystemMissing.
  ///
  /// In zh, this message translates to:
  /// **'仅目录'**
  String get adminSystemMissing;

  /// No description provided for @adminAgentAvailable.
  ///
  /// In zh, this message translates to:
  /// **'本机分析 Agent 可用。'**
  String get adminAgentAvailable;

  /// No description provided for @adminAgentUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'本机分析 Agent 当前不可用。'**
  String get adminAgentUnavailable;

  /// No description provided for @adminCredentialReady.
  ///
  /// In zh, this message translates to:
  /// **'凭据已配置'**
  String get adminCredentialReady;

  /// No description provided for @adminCredentialMissing.
  ///
  /// In zh, this message translates to:
  /// **'凭据未配置'**
  String get adminCredentialMissing;

  /// No description provided for @adminActiveLine.
  ///
  /// In zh, this message translates to:
  /// **'当前线路'**
  String get adminActiveLine;

  /// No description provided for @adminActivateAction.
  ///
  /// In zh, this message translates to:
  /// **'设为当前'**
  String get adminActivateAction;

  /// No description provided for @adminActionFailed.
  ///
  /// In zh, this message translates to:
  /// **'管理操作未完成，请刷新后重试。'**
  String get adminActionFailed;

  /// No description provided for @cancelDownloadAction.
  ///
  /// In zh, this message translates to:
  /// **'取消任务'**
  String get cancelDownloadAction;

  /// No description provided for @retryDownloadAction.
  ///
  /// In zh, this message translates to:
  /// **'重新下载'**
  String get retryDownloadAction;

  /// No description provided for @deleteDownloadAction.
  ///
  /// In zh, this message translates to:
  /// **'删除任务'**
  String get deleteDownloadAction;

  /// No description provided for @deleteDownloadTitle.
  ///
  /// In zh, this message translates to:
  /// **'删除任务与文件？'**
  String get deleteDownloadTitle;

  /// No description provided for @deleteDownloadDescription.
  ///
  /// In zh, this message translates to:
  /// **'下载记录、视频文件、本地上传源文件和私有封面将永久删除。此操作不可撤销。'**
  String get deleteDownloadDescription;

  /// No description provided for @deleteDownloadActiveDescription.
  ///
  /// In zh, this message translates to:
  /// **'当前任务会先被取消。下载记录、视频文件、本地上传源文件和私有封面将永久删除。此操作不可撤销。'**
  String get deleteDownloadActiveDescription;

  /// No description provided for @keepDownloadAction.
  ///
  /// In zh, this message translates to:
  /// **'保留任务'**
  String get keepDownloadAction;

  /// No description provided for @deleteDocumentAction.
  ///
  /// In zh, this message translates to:
  /// **'删除文档'**
  String get deleteDocumentAction;

  /// No description provided for @deleteDocumentTitle.
  ///
  /// In zh, this message translates to:
  /// **'删除剧本文档？'**
  String get deleteDocumentTitle;

  /// No description provided for @deleteDocumentDescription.
  ///
  /// In zh, this message translates to:
  /// **'原始文件、规范化剧本和当前文档记录将永久删除。正在使用该文档的分析需先结束。此操作不可撤销。'**
  String get deleteDocumentDescription;

  /// No description provided for @keepDocumentAction.
  ///
  /// In zh, this message translates to:
  /// **'保留文档'**
  String get keepDocumentAction;

  /// No description provided for @confirmDeleteAction.
  ///
  /// In zh, this message translates to:
  /// **'确认删除'**
  String get confirmDeleteAction;

  /// No description provided for @verificationCodeLabel.
  ///
  /// In zh, this message translates to:
  /// **'邮箱验证码'**
  String get verificationCodeLabel;

  /// No description provided for @invalidVerificationCode.
  ///
  /// In zh, this message translates to:
  /// **'验证码错误、已过期或已使用，请检查邮箱和验证码，或重新获取。'**
  String get invalidVerificationCode;

  /// No description provided for @emailUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'注册邮件暂不可用，请稍后重试或联系支持。'**
  String get emailUnavailable;

  /// No description provided for @emailSendFailed.
  ///
  /// In zh, this message translates to:
  /// **'邮件发送未能确认，请稍后重新获取验证码。'**
  String get emailSendFailed;

  /// No description provided for @sendVerificationCode.
  ///
  /// In zh, this message translates to:
  /// **'获取验证码'**
  String get sendVerificationCode;

  /// No description provided for @sendingVerificationCode.
  ///
  /// In zh, this message translates to:
  /// **'正在发送…'**
  String get sendingVerificationCode;

  /// No description provided for @verificationCodeSent.
  ///
  /// In zh, this message translates to:
  /// **'验证码已发送，10 分钟内有效。未收到时请检查垃圾邮件。'**
  String get verificationCodeSent;

  /// No description provided for @verificationCodeCooldown.
  ///
  /// In zh, this message translates to:
  /// **'{seconds} 秒后可重发'**
  String verificationCodeCooldown(int seconds);

  /// No description provided for @verificationCodeRequired.
  ///
  /// In zh, this message translates to:
  /// **'请输入邮件中的 6 位验证码'**
  String get verificationCodeRequired;

  /// No description provided for @verificationRateLimited.
  ///
  /// In zh, this message translates to:
  /// **'请等待 60 秒后再获取验证码。'**
  String get verificationRateLimited;

  /// No description provided for @passwordTooLong.
  ///
  /// In zh, this message translates to:
  /// **'密码不能超过 128 个字符'**
  String get passwordTooLong;

  /// No description provided for @requiredEmail.
  ///
  /// In zh, this message translates to:
  /// **'请输入邮箱地址'**
  String get requiredEmail;

  /// No description provided for @requiredPassword.
  ///
  /// In zh, this message translates to:
  /// **'请输入密码'**
  String get requiredPassword;

  /// No description provided for @requiredNewPassword.
  ///
  /// In zh, this message translates to:
  /// **'请设置密码'**
  String get requiredNewPassword;

  /// No description provided for @requiredConfirmPassword.
  ///
  /// In zh, this message translates to:
  /// **'请再次输入密码'**
  String get requiredConfirmPassword;

  /// No description provided for @requiredUsername.
  ///
  /// In zh, this message translates to:
  /// **'请设置用户名'**
  String get requiredUsername;

  /// No description provided for @usernameTooShort.
  ///
  /// In zh, this message translates to:
  /// **'用户名至少需要 2 个字符'**
  String get usernameTooShort;

  /// No description provided for @usernameTooLong.
  ///
  /// In zh, this message translates to:
  /// **'用户名不能超过 32 个字符'**
  String get usernameTooLong;

  /// No description provided for @usernameInvalidCharacters.
  ///
  /// In zh, this message translates to:
  /// **'用户名仅支持字母、数字、中文以及 _-. 字符'**
  String get usernameInvalidCharacters;

  /// No description provided for @previousPage.
  ///
  /// In zh, this message translates to:
  /// **'上一页'**
  String get previousPage;

  /// No description provided for @nextPage.
  ///
  /// In zh, this message translates to:
  /// **'下一页'**
  String get nextPage;

  /// No description provided for @profileSaved.
  ///
  /// In zh, this message translates to:
  /// **'个人资料已更新。'**
  String get profileSaved;

  /// No description provided for @saveProfile.
  ///
  /// In zh, this message translates to:
  /// **'保存资料'**
  String get saveProfile;

  /// No description provided for @savingProfile.
  ///
  /// In zh, this message translates to:
  /// **'正在保存'**
  String get savingProfile;

  /// No description provided for @profileTitle.
  ///
  /// In zh, this message translates to:
  /// **'个人资料'**
  String get profileTitle;

  /// No description provided for @searchAction.
  ///
  /// In zh, this message translates to:
  /// **'搜索'**
  String get searchAction;

  /// No description provided for @allStatuses.
  ///
  /// In zh, this message translates to:
  /// **'全部状态'**
  String get allStatuses;

  /// No description provided for @currentPageAvailable.
  ///
  /// In zh, this message translates to:
  /// **'本页可用'**
  String get currentPageAvailable;

  /// No description provided for @searchDownloads.
  ///
  /// In zh, this message translates to:
  /// **'搜索下载记录'**
  String get searchDownloads;

  /// No description provided for @searchUsers.
  ///
  /// In zh, this message translates to:
  /// **'搜索用户名或邮箱'**
  String get searchUsers;

  /// No description provided for @statusLabel.
  ///
  /// In zh, this message translates to:
  /// **'状态'**
  String get statusLabel;

  /// No description provided for @deleteConfiguration.
  ///
  /// In zh, this message translates to:
  /// **'删除配置？'**
  String get deleteConfiguration;

  /// No description provided for @deleteConfigurationDescription.
  ///
  /// In zh, this message translates to:
  /// **'此操作不可撤销。删除配置不会删除已有任务和报告。'**
  String get deleteConfigurationDescription;

  /// No description provided for @createPlatform.
  ///
  /// In zh, this message translates to:
  /// **'新增平台'**
  String get createPlatform;

  /// No description provided for @configurationKey.
  ///
  /// In zh, this message translates to:
  /// **'配置标识'**
  String get configurationKey;

  /// No description provided for @displayName.
  ///
  /// In zh, this message translates to:
  /// **'显示名称'**
  String get displayName;

  /// No description provided for @sortOrder.
  ///
  /// In zh, this message translates to:
  /// **'排序值'**
  String get sortOrder;

  /// No description provided for @platformVisible.
  ///
  /// In zh, this message translates to:
  /// **'用户侧可见'**
  String get platformVisible;

  /// No description provided for @invalidConfiguration.
  ///
  /// In zh, this message translates to:
  /// **'请检查此字段的格式和取值。'**
  String get invalidConfiguration;

  /// No description provided for @createAiProvider.
  ///
  /// In zh, this message translates to:
  /// **'新增 AI 服务'**
  String get createAiProvider;

  /// No description provided for @engineLabel.
  ///
  /// In zh, this message translates to:
  /// **'执行引擎'**
  String get engineLabel;

  /// No description provided for @authModeLabel.
  ///
  /// In zh, this message translates to:
  /// **'认证方式'**
  String get authModeLabel;

  /// No description provided for @modelLabel.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get modelLabel;

  /// No description provided for @baseUrlLabel.
  ///
  /// In zh, this message translates to:
  /// **'服务地址'**
  String get baseUrlLabel;

  /// No description provided for @apiKeyLabel.
  ///
  /// In zh, this message translates to:
  /// **'API Key'**
  String get apiKeyLabel;

  /// No description provided for @apiKeyKeepHint.
  ///
  /// In zh, this message translates to:
  /// **'留空保留已有凭据'**
  String get apiKeyKeepHint;

  /// No description provided for @localCodexRestriction.
  ///
  /// In zh, this message translates to:
  /// **'系统兜底线路，仅可修改名称和模型。'**
  String get localCodexRestriction;

  /// No description provided for @hostLoginLabel.
  ///
  /// In zh, this message translates to:
  /// **'本机账号登录 · 免 Key'**
  String get hostLoginLabel;

  /// No description provided for @deleteAction.
  ///
  /// In zh, this message translates to:
  /// **'删除'**
  String get deleteAction;

  /// No description provided for @cancelAction.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get cancelAction;

  /// No description provided for @exportDocx.
  ///
  /// In zh, this message translates to:
  /// **'导出 DOCX'**
  String get exportDocx;

  /// No description provided for @videoFile.
  ///
  /// In zh, this message translates to:
  /// **'视频文件'**
  String get videoFile;

  /// No description provided for @analysisReport.
  ///
  /// In zh, this message translates to:
  /// **'分析报告'**
  String get analysisReport;

  /// No description provided for @uniqueUsers.
  ///
  /// In zh, this message translates to:
  /// **'独立用户'**
  String get uniqueUsers;

  /// No description provided for @averageDuration.
  ///
  /// In zh, this message translates to:
  /// **'平均视频时长（秒）'**
  String get averageDuration;

  /// No description provided for @cancelledLabel.
  ///
  /// In zh, this message translates to:
  /// **'已取消'**
  String get cancelledLabel;

  /// No description provided for @allRoles.
  ///
  /// In zh, this message translates to:
  /// **'全部身份'**
  String get allRoles;

  /// No description provided for @searchPlatforms.
  ///
  /// In zh, this message translates to:
  /// **'搜索平台'**
  String get searchPlatforms;

  /// No description provided for @visiblePlatform.
  ///
  /// In zh, this message translates to:
  /// **'公开显示'**
  String get visiblePlatform;

  /// No description provided for @hiddenPlatform.
  ///
  /// In zh, this message translates to:
  /// **'已隐藏'**
  String get hiddenPlatform;

  /// No description provided for @previousAnalysisResult.
  ///
  /// In zh, this message translates to:
  /// **'上一版已完成的结果'**
  String get previousAnalysisResult;

  /// No description provided for @catalogScopeDescription.
  ///
  /// In zh, this message translates to:
  /// **'新增目录条目不会增加下载支持。'**
  String get catalogScopeDescription;

  /// No description provided for @analysisRateLimited.
  ///
  /// In zh, this message translates to:
  /// **'AI 服务请求过于频繁，请稍后重试。'**
  String get analysisRateLimited;

  /// No description provided for @providerChallengeError.
  ///
  /// In zh, this message translates to:
  /// **'平台要求验证，当前无法继续读取媒体。'**
  String get providerChallengeError;

  /// No description provided for @providerExtractorError.
  ///
  /// In zh, this message translates to:
  /// **'平台页面结构已变化，当前无法读取媒体。'**
  String get providerExtractorError;

  /// No description provided for @providerEgressError.
  ///
  /// In zh, this message translates to:
  /// **'当前出口无法连接媒体平台。'**
  String get providerEgressError;

  /// No description provided for @providerNetworkError.
  ///
  /// In zh, this message translates to:
  /// **'连接媒体平台时发生临时网络故障。'**
  String get providerNetworkError;

  /// No description provided for @providerRuntimeError.
  ///
  /// In zh, this message translates to:
  /// **'解析执行环境暂不可用。'**
  String get providerRuntimeError;

  /// No description provided for @providerRegistered.
  ///
  /// In zh, this message translates to:
  /// **'已接入'**
  String get providerRegistered;

  /// No description provided for @providerIdentityRequired.
  ///
  /// In zh, this message translates to:
  /// **'需要登录'**
  String get providerIdentityRequired;

  /// No description provided for @providerIdentityPrefer.
  ///
  /// In zh, this message translates to:
  /// **'优先登录'**
  String get providerIdentityPrefer;

  /// No description provided for @providerIdentityNone.
  ///
  /// In zh, this message translates to:
  /// **'无需登录'**
  String get providerIdentityNone;

  /// No description provided for @providerLoginRequiredError.
  ///
  /// In zh, this message translates to:
  /// **'该内容需要登录，请确认部署主机已登录对应平台。'**
  String get providerLoginRequiredError;

  /// No description provided for @providerContentProtectedError.
  ///
  /// In zh, this message translates to:
  /// **'该内容受加密保护，无法下载；可导入已取得的文件。'**
  String get providerContentProtectedError;

  /// No description provided for @providerUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'未开放'**
  String get providerUnavailable;

  /// No description provided for @providerIdentityUnavailableError.
  ///
  /// In zh, this message translates to:
  /// **'平台登录材料暂不可用，请检查部署主机的登录状态后重新解析。'**
  String get providerIdentityUnavailableError;

  /// No description provided for @providerContextChangedError.
  ///
  /// In zh, this message translates to:
  /// **'媒体执行上下文已变化，请重新解析链接并确认下载规格。'**
  String get providerContextChangedError;

  /// No description provided for @reparseDownloadAction.
  ///
  /// In zh, this message translates to:
  /// **'重新解析'**
  String get reparseDownloadAction;

  /// No description provided for @inspectionContainerLabel.
  ///
  /// In zh, this message translates to:
  /// **'容器'**
  String get inspectionContainerLabel;

  /// No description provided for @inspectionCompatibilityLabel.
  ///
  /// In zh, this message translates to:
  /// **'兼容策略'**
  String get inspectionCompatibilityLabel;

  /// No description provided for @inspectionVideoCodecLabel.
  ///
  /// In zh, this message translates to:
  /// **'视频编码'**
  String get inspectionVideoCodecLabel;

  /// No description provided for @inspectionAudioCodecLabel.
  ///
  /// In zh, this message translates to:
  /// **'音频编码'**
  String get inspectionAudioCodecLabel;

  /// No description provided for @compatibilityQuality.
  ///
  /// In zh, this message translates to:
  /// **'画质优先'**
  String get compatibilityQuality;

  /// No description provided for @compatibilitySmallest.
  ///
  /// In zh, this message translates to:
  /// **'体积优先'**
  String get compatibilitySmallest;

  /// No description provided for @compatibilityBalanced.
  ///
  /// In zh, this message translates to:
  /// **'均衡'**
  String get compatibilityBalanced;

  /// No description provided for @analysisPriorityRevisions.
  ///
  /// In zh, this message translates to:
  /// **'优先修改'**
  String get analysisPriorityRevisions;

  /// No description provided for @analysisStrengths.
  ///
  /// In zh, this message translates to:
  /// **'值得保留'**
  String get analysisStrengths;

  /// No description provided for @analysisStructure.
  ///
  /// In zh, this message translates to:
  /// **'幕结构'**
  String get analysisStructure;

  /// No description provided for @analysisTurningPoints.
  ///
  /// In zh, this message translates to:
  /// **'关键转折'**
  String get analysisTurningPoints;

  /// No description provided for @analysisCharacters.
  ///
  /// In zh, this message translates to:
  /// **'人物'**
  String get analysisCharacters;

  /// No description provided for @analysisDialogue.
  ///
  /// In zh, this message translates to:
  /// **'对白发现'**
  String get analysisDialogue;

  /// No description provided for @analysisConflict.
  ///
  /// In zh, this message translates to:
  /// **'冲突'**
  String get analysisConflict;

  /// No description provided for @analysisTurn.
  ///
  /// In zh, this message translates to:
  /// **'变化'**
  String get analysisTurn;

  /// No description provided for @analysisPacing.
  ///
  /// In zh, this message translates to:
  /// **'节奏'**
  String get analysisPacing;

  /// No description provided for @analysisGoal.
  ///
  /// In zh, this message translates to:
  /// **'目标'**
  String get analysisGoal;

  /// No description provided for @analysisCharacterArc.
  ///
  /// In zh, this message translates to:
  /// **'人物弧'**
  String get analysisCharacterArc;

  /// No description provided for @analysisVisualRules.
  ///
  /// In zh, this message translates to:
  /// **'视觉规则'**
  String get analysisVisualRules;

  /// No description provided for @analysisContinuityRisks.
  ///
  /// In zh, this message translates to:
  /// **'连续性风险'**
  String get analysisContinuityRisks;

  /// No description provided for @analysisNarrativeFunction.
  ///
  /// In zh, this message translates to:
  /// **'叙事作用'**
  String get analysisNarrativeFunction;

  /// No description provided for @analysisTransition.
  ///
  /// In zh, this message translates to:
  /// **'转场'**
  String get analysisTransition;

  /// No description provided for @analysisRecommendedExtensions.
  ///
  /// In zh, this message translates to:
  /// **'建议延展'**
  String get analysisRecommendedExtensions;

  /// No description provided for @analysisPriorityShots.
  ///
  /// In zh, this message translates to:
  /// **'优先分镜'**
  String get analysisPriorityShots;

  /// No description provided for @analysisEvidenceShots.
  ///
  /// In zh, this message translates to:
  /// **'依据分镜'**
  String get analysisEvidenceShots;

  /// No description provided for @analysisReportSections.
  ///
  /// In zh, this message translates to:
  /// **'报告章节'**
  String get analysisReportSections;

  /// No description provided for @activityHistoryTitle.
  ///
  /// In zh, this message translates to:
  /// **'我的处理记录'**
  String get activityHistoryTitle;

  /// No description provided for @activityHistorySearch.
  ///
  /// In zh, this message translates to:
  /// **'搜索处理记录'**
  String get activityHistorySearch;

  /// No description provided for @activityHistoryLink.
  ///
  /// In zh, this message translates to:
  /// **'链接解析'**
  String get activityHistoryLink;

  /// No description provided for @activityHistoryVideo.
  ///
  /// In zh, this message translates to:
  /// **'视频 AI'**
  String get activityHistoryVideo;

  /// No description provided for @activityHistoryScreenplay.
  ///
  /// In zh, this message translates to:
  /// **'剧本解析'**
  String get activityHistoryScreenplay;

  /// No description provided for @activityHistoryBasic.
  ///
  /// In zh, this message translates to:
  /// **'基础解析'**
  String get activityHistoryBasic;

  /// No description provided for @activityHistoryRewrite.
  ///
  /// In zh, this message translates to:
  /// **'AI 改写'**
  String get activityHistoryRewrite;

  /// No description provided for @activityHistoryAll.
  ///
  /// In zh, this message translates to:
  /// **'全部类型'**
  String get activityHistoryAll;

  /// No description provided for @pageSizeLabel.
  ///
  /// In zh, this message translates to:
  /// **'每页条数'**
  String get pageSizeLabel;

  /// No description provided for @profileAvatarUpload.
  ///
  /// In zh, this message translates to:
  /// **'上传头像'**
  String get profileAvatarUpload;

  /// No description provided for @profileAvatarRemove.
  ///
  /// In zh, this message translates to:
  /// **'移除头像'**
  String get profileAvatarRemove;

  /// No description provided for @profileAvatarBusy.
  ///
  /// In zh, this message translates to:
  /// **'正在处理头像'**
  String get profileAvatarBusy;

  /// No description provided for @profileAvatarHelp.
  ///
  /// In zh, this message translates to:
  /// **'JPEG、PNG、WebP · 最大 4 MB · 自动裁切为方形'**
  String get profileAvatarHelp;

  /// No description provided for @profileAvatarInvalidType.
  ///
  /// In zh, this message translates to:
  /// **'请选择 JPEG、PNG 或 WebP 图片。'**
  String get profileAvatarInvalidType;

  /// No description provided for @profileAvatarInvalidSize.
  ///
  /// In zh, this message translates to:
  /// **'头像文件不能超过 4 MB，且不能为空。'**
  String get profileAvatarInvalidSize;

  /// No description provided for @profileAvatarSaved.
  ///
  /// In zh, this message translates to:
  /// **'头像已更新。'**
  String get profileAvatarSaved;

  /// No description provided for @profileAvatarRemoved.
  ///
  /// In zh, this message translates to:
  /// **'头像已移除。'**
  String get profileAvatarRemoved;

  /// No description provided for @profileRoleLabel.
  ///
  /// In zh, this message translates to:
  /// **'账户身份'**
  String get profileRoleLabel;

  /// No description provided for @profileRoleAdminHelp.
  ///
  /// In zh, this message translates to:
  /// **'更改为普通用户前，必须保留另一位启用的管理员。'**
  String get profileRoleAdminHelp;

  /// No description provided for @profilePartialSave.
  ///
  /// In zh, this message translates to:
  /// **'用户名已保存；账户身份修改失败。'**
  String get profilePartialSave;

  /// No description provided for @selfHostingNavigation.
  ///
  /// In zh, this message translates to:
  /// **'自托管部署'**
  String get selfHostingNavigation;

  /// No description provided for @aboutNavigation.
  ///
  /// In zh, this message translates to:
  /// **'关于帧取'**
  String get aboutNavigation;

  /// No description provided for @resourcesNavigation.
  ///
  /// In zh, this message translates to:
  /// **'资源'**
  String get resourcesNavigation;

  /// No description provided for @adminDownloadsTab.
  ///
  /// In zh, this message translates to:
  /// **'下载'**
  String get adminDownloadsTab;

  /// No description provided for @adminAnalysisTab.
  ///
  /// In zh, this message translates to:
  /// **'AI 分析'**
  String get adminAnalysisTab;

  /// No description provided for @adminAnalysisExecutions.
  ///
  /// In zh, this message translates to:
  /// **'执行次数'**
  String get adminAnalysisExecutions;

  /// No description provided for @adminAnalysisDuration.
  ///
  /// In zh, this message translates to:
  /// **'平均完成耗时'**
  String get adminAnalysisDuration;

  /// No description provided for @adminAnalysisDurationCount.
  ///
  /// In zh, this message translates to:
  /// **'有效完成记录'**
  String get adminAnalysisDurationCount;

  /// No description provided for @adminAnalysisStatus.
  ///
  /// In zh, this message translates to:
  /// **'执行状态'**
  String get adminAnalysisStatus;

  /// No description provided for @adminAnalysisInput.
  ///
  /// In zh, this message translates to:
  /// **'输入类型'**
  String get adminAnalysisInput;

  /// No description provided for @adminAnalysisEmpty.
  ///
  /// In zh, this message translates to:
  /// **'当前周期还没有 AI 分析记录'**
  String get adminAnalysisEmpty;

  /// No description provided for @adminTrendDetails.
  ///
  /// In zh, this message translates to:
  /// **'精确数据'**
  String get adminTrendDetails;

  /// No description provided for @adminOperationLogsTitle.
  ///
  /// In zh, this message translates to:
  /// **'系统操作日志'**
  String get adminOperationLogsTitle;

  /// No description provided for @adminOperationLogSearch.
  ///
  /// In zh, this message translates to:
  /// **'操作人或操作名称'**
  String get adminOperationLogSearch;

  /// No description provided for @adminOperationScope.
  ///
  /// In zh, this message translates to:
  /// **'操作范围'**
  String get adminOperationScope;

  /// No description provided for @adminAllOperations.
  ///
  /// In zh, this message translates to:
  /// **'全部操作'**
  String get adminAllOperations;

  /// No description provided for @adminRequestOperations.
  ///
  /// In zh, this message translates to:
  /// **'接口请求'**
  String get adminRequestOperations;

  /// No description provided for @adminTaskOperations.
  ///
  /// In zh, this message translates to:
  /// **'系统任务'**
  String get adminTaskOperations;

  /// No description provided for @adminAdminOperations.
  ///
  /// In zh, this message translates to:
  /// **'管理员操作'**
  String get adminAdminOperations;

  /// No description provided for @adminOperationOutcome.
  ///
  /// In zh, this message translates to:
  /// **'执行结果'**
  String get adminOperationOutcome;

  /// No description provided for @adminAllOutcomes.
  ///
  /// In zh, this message translates to:
  /// **'全部结果'**
  String get adminAllOutcomes;

  /// No description provided for @adminOperationStarted.
  ///
  /// In zh, this message translates to:
  /// **'结果未确认'**
  String get adminOperationStarted;

  /// No description provided for @adminOperationSucceeded.
  ///
  /// In zh, this message translates to:
  /// **'请求成功'**
  String get adminOperationSucceeded;

  /// No description provided for @adminOperationFailed.
  ///
  /// In zh, this message translates to:
  /// **'请求失败'**
  String get adminOperationFailed;

  /// No description provided for @adminOperationSucceededFilter.
  ///
  /// In zh, this message translates to:
  /// **'成功 / 状态更新'**
  String get adminOperationSucceededFilter;

  /// No description provided for @adminOperationFrom.
  ///
  /// In zh, this message translates to:
  /// **'开始时间'**
  String get adminOperationFrom;

  /// No description provided for @adminOperationTo.
  ///
  /// In zh, this message translates to:
  /// **'结束时间'**
  String get adminOperationTo;

  /// No description provided for @adminOperationDateHint.
  ///
  /// In zh, this message translates to:
  /// **'YYYY-MM-DD HH:mm'**
  String get adminOperationDateHint;

  /// No description provided for @adminOperationInvalidDates.
  ///
  /// In zh, this message translates to:
  /// **'结束时间不能早于开始时间，时间格式为 YYYY-MM-DD HH:mm。'**
  String get adminOperationInvalidDates;

  /// No description provided for @adminOperationLogsEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无操作日志'**
  String get adminOperationLogsEmpty;

  /// No description provided for @adminOperationDetails.
  ///
  /// In zh, this message translates to:
  /// **'操作详情'**
  String get adminOperationDetails;

  /// No description provided for @adminOperationActor.
  ///
  /// In zh, this message translates to:
  /// **'操作人'**
  String get adminOperationActor;

  /// No description provided for @adminUnknownAccount.
  ///
  /// In zh, this message translates to:
  /// **'未识别账户'**
  String get adminUnknownAccount;

  /// No description provided for @adminOperationObject.
  ///
  /// In zh, this message translates to:
  /// **'对象'**
  String get adminOperationObject;

  /// No description provided for @adminOperationId.
  ///
  /// In zh, this message translates to:
  /// **'日志 ID'**
  String get adminOperationId;

  /// No description provided for @adminActorId.
  ///
  /// In zh, this message translates to:
  /// **'账户 ID'**
  String get adminActorId;

  /// No description provided for @adminOperationLabel.
  ///
  /// In zh, this message translates to:
  /// **'操作'**
  String get adminOperationLabel;

  /// No description provided for @adminOperationKey.
  ///
  /// In zh, this message translates to:
  /// **'操作标识'**
  String get adminOperationKey;

  /// No description provided for @adminOperationEndpoint.
  ///
  /// In zh, this message translates to:
  /// **'接口'**
  String get adminOperationEndpoint;

  /// No description provided for @adminOperationFinished.
  ///
  /// In zh, this message translates to:
  /// **'结束时间'**
  String get adminOperationFinished;

  /// No description provided for @adminOperationStatusCode.
  ///
  /// In zh, this message translates to:
  /// **'HTTP 状态'**
  String get adminOperationStatusCode;

  /// No description provided for @adminOperationErrorCode.
  ///
  /// In zh, this message translates to:
  /// **'错误码'**
  String get adminOperationErrorCode;

  /// No description provided for @adminDeleteUserDescription.
  ///
  /// In zh, this message translates to:
  /// **'账户、登录凭据、角色、配额和会话会一并移除；历史下载文件与任务记录不会自动删除。'**
  String get adminDeleteUserDescription;

  /// No description provided for @adminDeleteFileDescription.
  ///
  /// In zh, this message translates to:
  /// **'文件及其持久对象将永久删除。正在分析的源文件无法删除。'**
  String get adminDeleteFileDescription;

  /// No description provided for @adminUsersEmpty.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的账户'**
  String get adminUsersEmpty;

  /// No description provided for @adminQuotaTitle.
  ///
  /// In zh, this message translates to:
  /// **'用量限制'**
  String get adminQuotaTitle;

  /// No description provided for @adminQuotaExempt.
  ///
  /// In zh, this message translates to:
  /// **'豁免用量限制'**
  String get adminQuotaExempt;

  /// No description provided for @adminQuotaActive.
  ///
  /// In zh, this message translates to:
  /// **'同时活跃任务'**
  String get adminQuotaActive;

  /// No description provided for @adminQuotaDailyTasks.
  ///
  /// In zh, this message translates to:
  /// **'24 小时任务数'**
  String get adminQuotaDailyTasks;

  /// No description provided for @adminQuotaDailyGiB.
  ///
  /// In zh, this message translates to:
  /// **'24 小时处理量（GiB）'**
  String get adminQuotaDailyGiB;

  /// No description provided for @adminQuotaStorageGiB.
  ///
  /// In zh, this message translates to:
  /// **'保留存储（GiB）'**
  String get adminQuotaStorageGiB;

  /// No description provided for @adminQuotaAnalysis.
  ///
  /// In zh, this message translates to:
  /// **'24 小时分析尝试'**
  String get adminQuotaAnalysis;

  /// No description provided for @adminUseSystemDefault.
  ///
  /// In zh, this message translates to:
  /// **'使用系统默认'**
  String get adminUseSystemDefault;

  /// No description provided for @adminPlatformsEmpty.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的平台'**
  String get adminPlatformsEmpty;

  /// No description provided for @adminAiSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜索 AI 配置'**
  String get adminAiSearch;

  /// No description provided for @adminAiEmpty.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的 AI 配置'**
  String get adminAiEmpty;

  /// No description provided for @adminEngineCodex.
  ///
  /// In zh, this message translates to:
  /// **'Codex CLI · Responses'**
  String get adminEngineCodex;

  /// No description provided for @adminEngineClaude.
  ///
  /// In zh, this message translates to:
  /// **'Claude CLI · Messages'**
  String get adminEngineClaude;

  /// No description provided for @adminEngineOpenRouter.
  ///
  /// In zh, this message translates to:
  /// **'OpenRouter API'**
  String get adminEngineOpenRouter;

  /// No description provided for @adminEngineOpenAi.
  ///
  /// In zh, this message translates to:
  /// **'OpenAI 兼容 API'**
  String get adminEngineOpenAi;

  /// No description provided for @adminEngineDeepSeek.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek API · LangChain 视觉'**
  String get adminEngineDeepSeek;

  /// No description provided for @adminApiUrlHint.
  ///
  /// In zh, this message translates to:
  /// **'公网地址必须使用 HTTPS；本机 localhost 可使用 HTTP。'**
  String get adminApiUrlHint;

  /// No description provided for @adminHostLoginHint.
  ///
  /// In zh, this message translates to:
  /// **'使用服务端已登录的 CLI 账号。'**
  String get adminHostLoginHint;

  /// No description provided for @adminReadModels.
  ///
  /// In zh, this message translates to:
  /// **'读取 OpenRouter 模型'**
  String get adminReadModels;

  /// No description provided for @adminModelSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜索模型名称或 ID'**
  String get adminModelSearch;

  /// No description provided for @adminModelsHint.
  ///
  /// In zh, this message translates to:
  /// **'视频分析请选择支持图像的模型。'**
  String get adminModelsHint;

  /// No description provided for @adminImageSupported.
  ///
  /// In zh, this message translates to:
  /// **'支持图像'**
  String get adminImageSupported;

  /// No description provided for @adminTextOnly.
  ///
  /// In zh, this message translates to:
  /// **'仅文本'**
  String get adminTextOnly;

  /// No description provided for @adminModelsEmpty.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的模型'**
  String get adminModelsEmpty;

  /// No description provided for @adminModelDirectory.
  ///
  /// In zh, this message translates to:
  /// **'目录中的模型'**
  String get adminModelDirectory;

  /// No description provided for @pageSizeOption.
  ///
  /// In zh, this message translates to:
  /// **'每页 {size} 条'**
  String pageSizeOption(int size);

  /// No description provided for @aboutContent.
  ///
  /// In zh, this message translates to:
  /// **'## 帧取为谁而做？\n\n### 创作者\n\n整理自己拥有或已获授权的素材，用分镜、场景与关键帧证据复盘作品结构。\n\n### 内容研究者\n\n把视频与剧本文档组织为可追踪的任务，并导出 Markdown / DOCX 报告用于审阅。\n\n### 开发者与团队\n\n在自己的基础设施上运行 FastAPI、Next.js 与 Worker，通过 OpenAPI 契约扩展 Web 或移动端。\n\n## 为什么采用异步工作流架构？\n\n### 可恢复\n\nPostgreSQL 保存任务事实，Transactional Outbox 保证数据库状态与消息意图一致；实时连接只用于展示进度。\n\n### 可隔离\n\n下载、媒体命令与 AI 长任务不在 HTTP 请求进程中执行，Runner 经过阻断私网的受控出口代理。\n\n### 可验证\n\nProvider 返回值不会直接成为最终文件；Worker 重新解析并校验格式、时长、大小与 SHA-256 后才写入存储。\n\n### 可自托管\n\n数据保存在部署者配置的基础设施中，项目不依赖官方托管服务，也不内置第三方追踪器。\n\n## 帧取不做什么？\n\n帧取不是规避平台限制的下载脚本。默认只处理用户有权使用、公开、免费且非 DRM 的 HTTP(S) 内容；受保护、会员、私密、购买或地域限制内容不属于项目目标。私网 URL、任意 yt-dlp 参数和 shell 输入始终禁止。\n\nMIT 许可证授予软件的使用、修改和分发权，不代表授予任何第三方媒体内容的下载、复制或分析权。项目不提供官方 SaaS、公共演示站或服务可用性 SLA。\n\n## 源码在哪里？\n\n[framefetch-server](https://github.com/StephenQiu30/framefetch-server)：FastAPI API、Next.js Web、下载 / 文档 / 报告 Worker、隔离 Media Runner 与 Docker Compose 部署。\n\n[framefetch-app](https://github.com/StephenQiu30/framefetch-app)：连接自托管 framefetch-server 的 Flutter iOS / Android 客户端；媒体处理与 AI 推理仍在服务端执行。\n\n项目由 [StephenQiu](https://github.com/StephenQiu30) 维护，欢迎通过 Issue 或 Pull Request 参与。安全问题请按[安全策略](https://github.com/StephenQiu30/framefetch-server/blob/main/SECURITY.md)私下报告。'**
  String get aboutContent;

  /// No description provided for @selfHostingContent.
  ///
  /// In zh, this message translates to:
  /// **'本页摘录当前部署流程。命令与配置以仓库 README 为准；平台登录、换机与故障恢复请阅读对应设计文档。\n\n## 运行帧取需要准备什么？\n\n- Docker Engine 与 Docker Compose。\n- 部署者已有的 PostgreSQL、RabbitMQ、Redis 与 MinIO；Compose 只管理帧取自身的业务服务并复用这些基础环境。\n- macOS 平台会话来源需要 uv（Python 3.12）、日常 Chrome 与帧取扩展。\n- 生产部署需要强随机密钥、稳定的 HTTPS 访问地址和规划好的对象存储容量。\n\n## 如何用 Docker Compose 部署？\n\n### 克隆仓库并准备环境文件\n\n复制示例配置后，把 .env 中的连接信息改为本机已运行的 PostgreSQL、RabbitMQ、Redis 与 MinIO。真实密钥只写入未提交的 .env 或 Secret Manager。\n\n```sh\ngit clone https://github.com/StephenQiu30/framefetch-server.git\ncd framefetch-server\ntest -f .env || cp .env.example .env\n```\n\n### 为空数据库加载当前态结构\n\n首次使用空项目数据库时，以该库的 DDL 账号加载 schema.sql。已有数据库升级前先备份。\n\n```sh\npsql -X -v ON_ERROR_STOP=1 -W -h 127.0.0.1 -U video -d video \\\n  -f backend/sql/schema.sql\n```\n\n### 安装登录来源并启动业务服务\n\nmacOS 上安装 Chrome 会话来源，并在 chrome://extensions 加载命令输出目录中的扩展。复用日常 Chrome 已有平台登录；Compose 启动 Web、API、Worker、Runner 与出口代理。公开链接优先匿名解析。生产配置见 README。\n\n```sh\nuv run --project backend python -m app.workers.session.source_cli install --env-file .env\ndocker compose up -d --build --wait --remove-orphans\n```\n\n### 初始化首个管理员\n\n全新空库在部署机终端执行一次，密码交互输入。命令只在用户表为空时创建管理员，不开放 HTTP 初始化接口。\n\n```sh\nuv run --project backend python -m app.workers.bootstrap_admin \\\n  --env-file .env --username your-admin --email you@example.com\n```\n\n### 检查服务健康状态\n\n默认 Web 端口为 8101，API 端口为 8111，Swagger UI 位于 :8111/docs。健康检查只证明服务可运行，不代表每个平台都有可下载的媒体。\n\n```sh\ncurl --fail http://127.0.0.1:8111/health/live\ncurl --fail http://127.0.0.1:8111/health/ready\ncurl --fail --head http://127.0.0.1:8101/\n```\n\n## AI 视频分析是否必须启用？\n\n不是。AI Worker 独立于业务 Compose 运行，可复用宿主机已登录的 Codex App Server，或由管理员配置受支持的模型 Provider。只需要下载与剧本文档导入时，在 .env 中设置 ANALYSIS_ENABLED=false；关闭 AI 不影响下载和文档导入。\n\n使用外部模型时，分析所需内容会发送到该服务，并可能产生费用。启用前应确认素材授权和模型服务的数据处理约定。\n\n## 公开上线前应检查什么？\n\n- 替换 .env.prod 中所有占位凭据，并确认密钥来源可在换机时恢复。\n- 外部媒体访问必须经过阻断私网的出口代理；入口 URL 校验不能替代网络隔离。\n- 为 MinIO 规划容量、备份与显式清理策略；预签名链接过期不会删除最终文件。\n- 只在计划公开介绍项目的网站设置 SITE_INDEXABLE=true，并把 SITE_URL 设为稳定的 HTTPS 域名。\n- 更新代码后执行 git pull --ff-only 并按 README 重新安装来源并执行 Compose 构建启动；docker compose restart 不会应用新镜像或环境配置。\n\n[README 快速开始](https://github.com/StephenQiu30/framefetch-server#快速开始) · [系统设计](https://github.com/StephenQiu30/framefetch-server/blob/main/docs/design/README.md)'**
  String get selfHostingContent;

  /// No description provided for @activityHistoryFrom.
  ///
  /// In zh, this message translates to:
  /// **'起始日期'**
  String get activityHistoryFrom;

  /// No description provided for @activityHistoryTo.
  ///
  /// In zh, this message translates to:
  /// **'结束日期'**
  String get activityHistoryTo;

  /// No description provided for @activityHistorySkill.
  ///
  /// In zh, this message translates to:
  /// **'分析 Skill'**
  String get activityHistorySkill;

  /// No description provided for @activitySourceUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'源文件不可用，已有结果仍可查看。'**
  String get activitySourceUnavailable;

  /// No description provided for @analysisRunsTitle.
  ///
  /// In zh, this message translates to:
  /// **'运行记录'**
  String get analysisRunsTitle;

  /// No description provided for @verifyRegistrationEmail.
  ///
  /// In zh, this message translates to:
  /// **'验证邮箱'**
  String get verifyRegistrationEmail;

  /// No description provided for @verifyingRegistrationEmail.
  ///
  /// In zh, this message translates to:
  /// **'验证中…'**
  String get verifyingRegistrationEmail;

  /// No description provided for @registrationEmailVerified.
  ///
  /// In zh, this message translates to:
  /// **'邮箱已验证'**
  String get registrationEmailVerified;

  /// No description provided for @registrationEmailVerificationSuccess.
  ///
  /// In zh, this message translates to:
  /// **'邮箱已验证，可以设置密码。'**
  String get registrationEmailVerificationSuccess;

  /// No description provided for @currentPageLabel.
  ///
  /// In zh, this message translates to:
  /// **'第 {page} 页'**
  String currentPageLabel(int page);

  /// No description provided for @adminAnalysisRateFormula.
  ///
  /// In zh, this message translates to:
  /// **'成功 ÷（成功 + 失败）'**
  String get adminAnalysisRateFormula;

  /// No description provided for @adminAnalysisTrendTitle.
  ///
  /// In zh, this message translates to:
  /// **'每日分析趋势'**
  String get adminAnalysisTrendTitle;

  /// No description provided for @adminDownloadTrendTitle.
  ///
  /// In zh, this message translates to:
  /// **'每日下载趋势'**
  String get adminDownloadTrendTitle;

  /// No description provided for @adminStatusDistribution.
  ///
  /// In zh, this message translates to:
  /// **'状态分布'**
  String get adminStatusDistribution;

  /// No description provided for @adminSourcePerformance.
  ///
  /// In zh, this message translates to:
  /// **'各视频源下载表现'**
  String get adminSourcePerformance;

  /// No description provided for @adminCompletionTrend.
  ///
  /// In zh, this message translates to:
  /// **'完成率走势'**
  String get adminCompletionTrend;

  /// No description provided for @adminOperationDeleted.
  ///
  /// In zh, this message translates to:
  /// **'已删除'**
  String get adminOperationDeleted;

  /// No description provided for @adminDeleteAiDescription.
  ///
  /// In zh, this message translates to:
  /// **'所选 AI 配置与凭据将永久删除。当前线路和系统兜底线路不可删除。'**
  String get adminDeleteAiDescription;

  /// No description provided for @adminDeleteCatalogDescription.
  ///
  /// In zh, this message translates to:
  /// **'该条目会从平台目录和公开状态页移除。系统下载 Profile 不会因此被删除。'**
  String get adminDeleteCatalogDescription;

  /// No description provided for @exportMarkdown.
  ///
  /// In zh, this message translates to:
  /// **'导出 Markdown'**
  String get exportMarkdown;

  /// No description provided for @publicWorkflowEyebrow.
  ///
  /// In zh, this message translates to:
  /// **'工作流'**
  String get publicWorkflowEyebrow;

  /// No description provided for @adminObjectCount.
  ///
  /// In zh, this message translates to:
  /// **'对象数'**
  String get adminObjectCount;

  /// No description provided for @analysisRunNumber.
  ///
  /// In zh, this message translates to:
  /// **'第 {run} 次执行'**
  String analysisRunNumber(int run);

  /// No description provided for @analysisRetryTitle.
  ///
  /// In zh, this message translates to:
  /// **'按原配置重新运行'**
  String get analysisRetryTitle;

  /// No description provided for @analysisRetryDescription.
  ///
  /// In zh, this message translates to:
  /// **'将保留任务编号并增加执行次数，可能消耗模型额度。修改配置请从源文件新建分析。'**
  String get analysisRetryDescription;

  /// No description provided for @confirmRetryAnalysis.
  ///
  /// In zh, this message translates to:
  /// **'确认执行'**
  String get confirmRetryAnalysis;

  /// No description provided for @adminPeriodLabel.
  ///
  /// In zh, this message translates to:
  /// **'统计周期'**
  String get adminPeriodLabel;

  /// No description provided for @analysisOutcomeUnknown.
  ///
  /// In zh, this message translates to:
  /// **'执行回执未知，请先刷新或在处理记录中核对；暂不能重复执行。'**
  String get analysisOutcomeUnknown;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
