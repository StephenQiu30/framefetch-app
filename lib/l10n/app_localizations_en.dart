// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Framefetch';

  @override
  String get homeNavigation => 'Home';

  @override
  String get downloadHistoryNavigation => 'Download history';

  @override
  String get historyTab => 'History';

  @override
  String get screenplayDocumentsNavigation => 'Screenplays';

  @override
  String get documentsTab => 'Documents';

  @override
  String get providerStatusNavigation => 'Provider status';

  @override
  String get statusTab => 'Status';

  @override
  String get accountNavigation => 'Me';

  @override
  String get downloadRowActionsHint => 'Swipe left to reveal task actions.';

  @override
  String get loadingData => 'Loading…';

  @override
  String get loadFailedTitle => 'Data is temporarily unavailable';

  @override
  String get invalidResponseError =>
      'The service response is incompatible with this app version. Update the app or contact the service administrator.';

  @override
  String get forbiddenError =>
      'Your account does not have permission to perform this action.';

  @override
  String get retryAction => 'Reload';

  @override
  String get refreshAction => 'Refresh';

  @override
  String get totalLabel => 'Total';

  @override
  String get succeededLabel => 'Completed';

  @override
  String get activeLabel => 'Active';

  @override
  String get failedLabel => 'Failed';

  @override
  String get downloadHistoryEmptyTitle => 'No download records yet';

  @override
  String get createDownloadFromHomeAction => 'Create from Home';

  @override
  String get downloadStatusQueued => 'Queued';

  @override
  String get downloadStatusRunning => 'Downloading';

  @override
  String get downloadStatusRetryWait => 'Waiting to retry';

  @override
  String get downloadStatusSucceeded => 'Completed';

  @override
  String get downloadStatusFailed => 'Failed';

  @override
  String get downloadStatusCancelled => 'Cancelled';

  @override
  String get downloadStatusUnknown => 'Unknown status';

  @override
  String get updatedAtLabel => 'Updated';

  @override
  String get failureCancelled => 'The task was cancelled';

  @override
  String get failureStorage => 'Storage is temporarily unavailable';

  @override
  String get failureGeneric => 'Processing did not complete';

  @override
  String get documentEmptyTitle => 'No screenplay documents yet';

  @override
  String get goToScreenplayUploadAction => 'Upload from Home';

  @override
  String get documentStatusUploading => 'Waiting for upload';

  @override
  String get documentStatusVerifying => 'Parsing';

  @override
  String get documentStatusReady => 'Ready to review';

  @override
  String get documentStatusFailed => 'Parsing failed';

  @override
  String get documentStatusCancelled => 'Cancelled';

  @override
  String get documentStatusExpired => 'Expired';

  @override
  String get documentStatusUnknown => 'Unknown status';

  @override
  String get openDocumentDetailsHint => 'Open screenplay document details';

  @override
  String get screenplayDocumentDetailNavigation => 'Document details';

  @override
  String get documentInformationTitle => 'Import information';

  @override
  String documentImportSummary(int attempt, int version) {
    return 'Import attempt $attempt · Version $version';
  }

  @override
  String get documentStoragePolicyLabel => 'Storage';

  @override
  String get documentStoragePersistent => 'Persistent';

  @override
  String get documentBasicParsingTitle => 'Basic parsing';

  @override
  String get documentPageCountLabel => 'Pages';

  @override
  String get documentParagraphCountLabel => 'Paragraphs';

  @override
  String get documentHeadingCountLabel => 'Headings';

  @override
  String get documentListItemCountLabel => 'List items';

  @override
  String get documentTableCountLabel => 'Tables';

  @override
  String get documentDialogueBlockCountLabel => 'Dialogue blocks';

  @override
  String get waitingForParsing => 'Waiting for parsing';

  @override
  String get chineseLanguage => 'Chinese';

  @override
  String get englishLanguage => 'English';

  @override
  String get mixedLanguage => 'Chinese and English';

  @override
  String get unknownLanguage => 'Unknown';

  @override
  String get normalizedScreenplayTitle => 'Normalized screenplay';

  @override
  String get markdownPreviewLabel => 'Markdown screenplay preview';

  @override
  String get documentPreviewUploading =>
      'The file upload is not complete. Parsing will start automatically afterward.';

  @override
  String get documentPreviewVerifying =>
      'The service is extracting structure and text. This page will update automatically.';

  @override
  String get documentPreviewEmpty =>
      'Parsing finished, but there is no screenplay text to display.';

  @override
  String get documentPreviewFailed =>
      'The screenplay could not be parsed. Review the error and upload it again.';

  @override
  String get documentPreviewCancelled =>
      'This screenplay import was cancelled.';

  @override
  String get documentPreviewExpired =>
      'The upload session expired. Return Home and upload the file again.';

  @override
  String get documentPreviewTruncatedTitle => 'Showing an excerpt';

  @override
  String get documentPreviewTruncatedDescription =>
      'This screenplay is long, so this page shows the normalized preview returned by the service.';

  @override
  String get documentParsingIncompleteTitle => 'Parsing is not complete';

  @override
  String get documentManualReviewTitle => 'Manual review recommended';

  @override
  String get documentStorageUnavailable =>
      'File storage is temporarily unavailable. Try again later.';

  @override
  String get documentUploadSessionExpired =>
      'The upload session expired. Upload the file again.';

  @override
  String get documentUploadIncomplete =>
      'The file upload is incomplete. Upload it again.';

  @override
  String get documentSizeMismatch =>
      'The file size check failed. Choose the original file again.';

  @override
  String get documentIntegrityMismatch =>
      'The file integrity check failed. Upload it again.';

  @override
  String get documentFormatUnsupported =>
      'The service does not support this document format.';

  @override
  String get documentEncrypted =>
      'Password-protected documents cannot be parsed.';

  @override
  String get documentArchiveUnsafe =>
      'The document archive structure is unsafe, so processing stopped.';

  @override
  String get documentTextUnavailable =>
      'No extractable text was found in the document.';

  @override
  String get documentStructureInvalid =>
      'The document structure could not be recognized.';

  @override
  String get documentSceneHeadingMissing =>
      'Some scenes do not have standard scene headings.';

  @override
  String get documentManualReviewRequired =>
      'The parsing result needs manual review.';

  @override
  String get fileSizeLabel => 'File size';

  @override
  String get sceneCountLabel => 'Scenes';

  @override
  String get characterCountLabel => 'Characters';

  @override
  String get languageLabel => 'Language';

  @override
  String get providerEmptyTitle => 'No provider status';

  @override
  String get providerStatusUnsupported => 'Unsupported';

  @override
  String get capabilitySingleVideo => 'Single video';

  @override
  String get capabilityShortVideo => 'Short video';

  @override
  String get capabilityClipOrVod => 'Clip or VOD';

  @override
  String get capabilityAudioVideoSplit => 'Separate audio/video';

  @override
  String get capabilitySubtitles => 'Subtitles';

  @override
  String get capabilityImageOrCarousel => 'Images or carousel';

  @override
  String get capabilityLive => 'Live';

  @override
  String get capabilityPlaylist => 'Playlist';

  @override
  String get guideNavigation => 'User guide';

  @override
  String get switchToDarkTheme => 'Switch to dark theme';

  @override
  String get switchToLightTheme => 'Switch to light theme';

  @override
  String get publicHomeEyebrow => 'Framefetch · Open-source video workflow';

  @override
  String get publicHomeTitle => 'Bring content\nback to your device.';

  @override
  String get publicHomeDescription =>
      'Parse public media, import local videos and screenplay documents, manage artifacts, and run AI analysis with open-source, self-hosted workflows. You control the data and execution boundaries.';

  @override
  String get publicRegisterAction => 'Create a local account';

  @override
  String get publicSourceAction => 'View source code';

  @override
  String get publicWorkflowInspectTitle => 'Inspect';

  @override
  String get publicWorkflowInspectDescription =>
      'Identify candidate videos in public media or articles';

  @override
  String get publicWorkflowSelectTitle => 'Select';

  @override
  String get publicWorkflowSelectDescription =>
      'Confirm the target and format to avoid implicit downloads';

  @override
  String get publicWorkflowExecuteTitle => 'Execute';

  @override
  String get publicWorkflowExecuteDescription =>
      'Use isolated workers for downloads, imports, and analysis';

  @override
  String get publicWorkflowDeliverTitle => 'Deliver';

  @override
  String get publicWorkflowDeliverDescription =>
      'Preview or retrieve artifacts through authorized short-lived access';

  @override
  String get publicHomeCapabilitiesTitle =>
      'Video parsing, screenplay workflows, and AI analysis';

  @override
  String get publicVideoTitle => 'Public video workflows';

  @override
  String get publicVideoDescription =>
      'Parse authorized public links, select real available formats, and track downloads through their final artifacts.';

  @override
  String get publicDocumentTitle => 'Screenplay and document workflows';

  @override
  String get publicDocumentDescription =>
      'Import authorized screenplay documents, then normalize, analyze, and retain processing records in one workspace.';

  @override
  String get publicAnalysisTitle => 'Structured AI video analysis';

  @override
  String get publicAnalysisDescription =>
      'Generate structured results and execution evidence for scenes, shots, highlights, and content assets.';

  @override
  String get publicTrustEyebrow => 'Self-hosted architecture';

  @override
  String get publicTrustDescription =>
      'FastAPI, Next.js, PostgreSQL, RabbitMQ, MinIO, FFmpeg, and yt-dlp form an independently deployable workflow. The MIT license lets you inspect, modify, and self-host it for free.';

  @override
  String get publicSafeguardAuthorization =>
      'Public media is not automatically free to use. Only process content you are authorized to handle.';

  @override
  String get publicFaqEyebrow => 'Common questions';

  @override
  String get publicFaqWhatQuestion => 'What is Framefetch?';

  @override
  String get publicFaqWhatAnswer =>
      'Framefetch is an MIT-licensed, open-source, self-hosted video parsing and AI analysis platform for creators, content researchers, and developers. It organizes authorized media links, local videos, and screenplay documents into tasks with artifact management, structured analysis, and report exports.';

  @override
  String get publicFaqReportsQuestion => 'What can AI video analysis produce?';

  @override
  String get publicFaqReportsAnswer =>
      'Selected analysis capabilities can produce structured scenes, shots, timelines, and keyframe evidence, with Markdown and DOCX report exports. A configured model service and AI worker are required, and important conclusions should be checked against the original media.';

  @override
  String get publicFaqImportQuestion =>
      'Can I analyze local videos and screenplays directly?';

  @override
  String get publicFaqImportAnswer =>
      'Yes. Import local videos and screenplay documents that you are authorized to process. Screenplays support Markdown, Fountain, TXT, PDF, and DOCX, and can be read and analyzed without first supplying a third-party platform link.';

  @override
  String get publicFaqCostQuestion =>
      'Does open source mean there are no operating costs?';

  @override
  String get publicFaqCostAnswer =>
      'The source is available under the MIT license for self-hosting, use, and modification. Servers, object storage, network traffic, and external AI models may still incur costs; the project does not promise free hosting or model credits.';

  @override
  String get publicFaqPlatformsQuestion =>
      'Does it support every platform and link?';

  @override
  String get publicFaqPlatformsAnswer =>
      'No. Availability depends on the deployed instance, provider configuration, authorization, access conditions, and recent verification. Inspect a link before selecting a format. Public accessibility is not the same as permission to use the content.';

  @override
  String get publicFaqMobileQuestion =>
      'Can the mobile app run AI analysis by itself?';

  @override
  String get publicFaqMobileAnswer =>
      'The Flutter iOS and Android client connects to a self-hosted framefetch-server. Media processing and AI inference run on the server; the mobile client does not bundle an offline extractor or offline AI model.';

  @override
  String get publicGuideAction =>
      'Read the video analysis and self-hosting guide';

  @override
  String get publicStartTitle => 'Run Framefetch on your own infrastructure';

  @override
  String get publicDeploymentAction => 'Read deployment guide';

  @override
  String get publicGuideTitle => 'From source material to an analysis report';

  @override
  String get publicGuideVideoTitle =>
      'How do I produce a reviewable AI analysis report from a video?';

  @override
  String get publicGuideVideoParagraphOne =>
      'Import a local video you own or are authorized to process, or inspect a public media link, confirm an available format, and create a task. After processing finishes, choose an analysis capability from the task details and submit an AI analysis task.';

  @override
  String get publicGuideVideoParagraphTwo =>
      'The server-side AI worker produces structured scenes, shot timelines, and keyframe evidence. Outputs vary by capability, and reports can be exported as Markdown or DOCX for review and further editing. Check important conclusions against the original media and evidence.';

  @override
  String get publicGuideVideoParagraphThree =>
      'Successful media processing does not mean analysis is complete. If AI is unavailable, check the configured model provider and AI worker status.';

  @override
  String get publicGuideVideoSource =>
      'Review AI video analysis and report capabilities';

  @override
  String get publicGuideScreenplayTitle =>
      'How do I work with screenplay documents?';

  @override
  String get publicGuideScreenplayParagraphOne =>
      'Import Markdown, Fountain, TXT, PDF, or DOCX files into the screenplay workspace. You can read the normalized document, inspect its outline, and start analysis or rewriting while retaining the results and processing history in one workspace.';

  @override
  String get publicGuideScreenplayParagraphTwo =>
      'Extraction quality depends on the source structure. Scans, complex layouts, and files with missing text require manual review; a successful task alone does not prove that every part of the original document was preserved.';

  @override
  String get publicGuideScreenplaySource =>
      'Review current document processing capabilities';

  @override
  String get publicGuideDeploymentTitle =>
      'Which services are required for self-hosting?';

  @override
  String get publicGuideDeploymentParagraphOne =>
      'framefetch-server includes the Next.js Web interface, FastAPI API, and separate download, media-processing, and AI workers. Docker Compose manages the business services and connects to PostgreSQL, RabbitMQ, Redis, and MinIO. The default Web and API ports are 8101 and 8111.';

  @override
  String get publicGuideDeploymentParagraphTwo =>
      'Use the root README quick start to install and configure the system, then enable model services and media providers as needed. The MIT license opens the source; infrastructure, storage, traffic, and external model costs remain the deployer\'s responsibility.';

  @override
  String get publicGuideDeploymentParagraphThree =>
      'Self-hosting does not guarantee that data never leaves the device. When an external AI provider is enabled, required analysis content is sent to that service. Review its data terms and confirm that the material may be used for analysis.';

  @override
  String get publicGuideDeploymentSource =>
      'Read the self-hosting deployment steps';

  @override
  String get publicGuideClientsTitle =>
      'When should I use the Web or iOS / Android client?';

  @override
  String get publicGuideClientsParagraphOne =>
      'The Web UI ships with framefetch-server and is suited to managing media, tasks, analysis reports, and administrator configuration. framefetch-app is the separately maintained Flutter client for iOS and Android and connects to a reachable framefetch-server.';

  @override
  String get publicGuideClientsParagraphTwo =>
      'The mobile client handles uploads, task operations, and result presentation while media processing and AI inference remain server-side. It is currently built from source, with no App Store or Google Play package and no offline AI.';

  @override
  String get publicGuideClientsSource =>
      'Review the Flutter mobile client and build instructions';

  @override
  String get publicGuideAvailabilityTitle =>
      'Why can links from the same platform produce different results?';

  @override
  String get publicGuideAvailabilityParagraphOne =>
      'Platform support depends on the deployed instance, provider version, access conditions, and content authorization. The presence of a platform adapter does not mean every link is processable. Use current link inspection, provider status, and final-file verification as the source of truth.';

  @override
  String get publicGuideAvailabilityParagraphTwo =>
      'The default anonymous flow targets clearly public, free, non-DRM media. Only process material you are authorized to use; account access does not replace permission to download, export, or reuse content.';

  @override
  String get publicGuideAvailabilitySource =>
      'Review capability and execution boundaries';

  @override
  String get publicExternalLinkError => 'The external link could not be opened';

  @override
  String get downloadDetailNavigation => 'Task details';

  @override
  String get sourceLabel => 'Source';

  @override
  String get formatLabel => 'Format';

  @override
  String get stageLabel => 'Stage';

  @override
  String get attemptLabel => 'Attempt';

  @override
  String get fileAvailabilityLabel => 'File';

  @override
  String get createdAtLabel => 'Created';

  @override
  String get finishedAtLabel => 'Finished';

  @override
  String get durationLabel => 'Duration';

  @override
  String get fileAvailable => 'File available';

  @override
  String get fileCleared => 'File removed';

  @override
  String get downloadStageRevalidating => 'Revalidating';

  @override
  String get downloadStageDownloading => 'Downloading';

  @override
  String get downloadStageRemuxing => 'Remuxing';

  @override
  String get downloadStageVerifying => 'Verifying';

  @override
  String get downloadStageUploading => 'Saving';

  @override
  String get downloadStageUnknown => 'Unknown stage';

  @override
  String get formatUnavailable => 'Format information unavailable';

  @override
  String get loginAction => 'Sign in';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get createAccountTitle => 'Create your Framefetch account';

  @override
  String get emailLabel => 'Email';

  @override
  String get usernameLabel => 'Username';

  @override
  String get usernameHelp =>
      '2–32 characters using letters, numbers, and _-. only.';

  @override
  String get passwordLabel => 'Password';

  @override
  String get confirmPasswordLabel => 'Confirm password';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get loginSubmit => 'Sign in';

  @override
  String get loginSubmitting => 'Signing in…';

  @override
  String get registerSubmit => 'Register and sign in';

  @override
  String get registerSubmitting => 'Creating…';

  @override
  String get goRegister => 'Create account';

  @override
  String get goLogin => 'Back to sign in';

  @override
  String get invalidEmail => 'Enter a valid email address.';

  @override
  String get invalidUsername => 'Use 2–32 letters, numbers, or _-. characters.';

  @override
  String get invalidPassword => 'Password must contain at least 8 characters.';

  @override
  String get passwordMismatch => 'The passwords do not match.';

  @override
  String get invalidCredentialsError => 'The email or password is incorrect.';

  @override
  String get emailRegisteredError =>
      'That email is already registered. Sign in instead.';

  @override
  String get usernameRegisteredError => 'That username is already in use.';

  @override
  String get unauthenticatedError => 'Your session expired. Sign in again.';

  @override
  String get rateLimitedError => 'Too many attempts. Try again later.';

  @override
  String get serviceUnavailableError =>
      'The service is unavailable. Check your connection and retry.';

  @override
  String get unknownAuthError =>
      'The operation did not complete. Try again later.';

  @override
  String get logoutAction => 'Sign out';

  @override
  String get loggingOut => 'Signing out…';

  @override
  String get downloadHomeTitle => 'Bring content back to your device.';

  @override
  String get linkIntakeMode => 'Link';

  @override
  String get videoIntakeMode => 'Local video';

  @override
  String get screenplayIntakeMode => 'Screenplay';

  @override
  String get videoIntakeTitle => 'Import a local video';

  @override
  String get selectVideoFile => 'Choose video file';

  @override
  String get reimportDownloadAction => 'Return home to import again';

  @override
  String get screenplayIntakeTitle => 'Import a screenplay';

  @override
  String get selectScreenplayFile => 'Choose screenplay file';

  @override
  String get choosingUploadFile => 'Choosing file…';

  @override
  String get hashingUploadFile => 'Verifying file…';

  @override
  String get creatingUpload => 'Creating upload…';

  @override
  String get uploadingFile => 'Uploading…';

  @override
  String get cancelUploadAction => 'Cancel upload';

  @override
  String get completingUpload => 'Completing upload…';

  @override
  String get emptyUploadFileError => 'Choose a file that contains data.';

  @override
  String get invalidVideoFileError => 'Only MP4 video uploads are supported.';

  @override
  String get invalidDocumentFileError =>
      'DOCX, PDF, TXT, Markdown, and Fountain screenplays are supported.';

  @override
  String get documentTooLargeError =>
      'Screenplay documents must be 50 MB or smaller.';

  @override
  String get fileSelectionFailedError =>
      'The system file picker could not be opened. Try again.';

  @override
  String get inaccessibleFileError =>
      'The selected file could not be read. Choose it again.';

  @override
  String get fileUploadFailed =>
      'The file upload failed. Check your connection and retry.';

  @override
  String get mediaUrlHint => 'Paste a public link or full share message';

  @override
  String get mediaUrlLabel => 'Public content address';

  @override
  String get clearMediaUrl => 'Clear link';

  @override
  String get inspectMedia => 'Inspect media';

  @override
  String get activityHistoryEmpty => 'No processing records';

  @override
  String get clearFiltersAction => 'Clear filters';

  @override
  String get providerNoCapabilities => 'No registered capabilities';

  @override
  String get intentQueued => 'Waiting to inspect';

  @override
  String get intentResolving => 'Inspecting media';

  @override
  String get intentExpired => 'Inspection result expired';

  @override
  String get intentFailed => 'Inspection could not finish';

  @override
  String get intentCancelled => 'Inspection cancelled';

  @override
  String get intentRefreshAction => 'Update inspection';

  @override
  String get intentCancelling => 'Cancelling inspection';

  @override
  String get intentCancelAction => 'Cancel inspection';

  @override
  String get intentHandedOff => 'Download task created';

  @override
  String get intentRefreshHint =>
      'New download formats must be confirmed again.';

  @override
  String get inspectingMedia => 'Inspecting…';

  @override
  String get mediaUrlError => 'Enter a valid public HTTP(S) video address.';

  @override
  String get publicInputRequired =>
      'Enter a public link or full share message.';

  @override
  String get operationFailed =>
      'The operation did not complete. Try again later.';

  @override
  String get deletionBlockedByAnalysis =>
      'This resource is being used by an analysis. Finish the related analysis before deleting it.';

  @override
  String get inspectionResultTitle => 'Inspection result';

  @override
  String get formatSelectionTitle => 'Choose a download format';

  @override
  String get createDownloadAction => 'Create download task';

  @override
  String get creatingDownload => 'Creating…';

  @override
  String get sourceCandidatesTitle => 'Choose a video from the article';

  @override
  String get sourceCandidatesEmpty =>
      'No processable video was found in this article.';

  @override
  String get candidateUnavailable => 'This source cannot be processed';

  @override
  String get mediaUnavailableDescription =>
      'The server did not approve a download task. Follow the guidance or submit another public link.';

  @override
  String get noFormatsAvailable =>
      'Inspection succeeded, but no format is available for creating a download task.';

  @override
  String imageGalleryFormatDetails(Object count) {
    return '$count original images · ZIP';
  }

  @override
  String videoCollectionFormatDetails(Object count) {
    return '$count videos · ZIP';
  }

  @override
  String get providerRestrictedError =>
      'This media is private or access-restricted and cannot be processed.';

  @override
  String get providerLinkError =>
      'The sharing link has expired or no longer resolves to a video. Copy a fresh public link.';

  @override
  String get durationLimitError =>
      'This media exceeds the service duration limit.';

  @override
  String get articleRestrictedError =>
      'The article requires verification, following, or payment, so its media sources cannot be read safely.';

  @override
  String get articleDiscoveryError =>
      'Media sources could not be read from this article. Confirm that the article is public and the link is valid.';

  @override
  String get mediaCoverPending => 'Generating cover';

  @override
  String get mediaCoverUnavailable => 'No cover available';

  @override
  String get mediaCoverLabel => 'Video cover';

  @override
  String get watchVideoAction => 'Watch';

  @override
  String get getFileAction => 'Get file';

  @override
  String get playbackFailed =>
      'The video could not be played. Request a new playback URL and retry.';

  @override
  String get downloadOpenFailed =>
      'The system download could not be opened. Try again later.';

  @override
  String get aiAnalysisTitle => 'AI analysis';

  @override
  String get screenplayAnalysisTitle => 'Screenplay analysis and rewriting';

  @override
  String get analysisNewTask => 'New creative task';

  @override
  String get analysisCloseNewTask => 'Close new task';

  @override
  String get analysisSkillLabel => 'Creative task';

  @override
  String get analysisOutputLanguageLabel => 'Output language';

  @override
  String get simplifiedChineseLabel => '简体中文';

  @override
  String get englishLabel => 'English';

  @override
  String get analysisPromptLabel => 'Analysis focus';

  @override
  String get restoreDefaultPrompt => 'Restore default';

  @override
  String get startAnalysisAction => 'Start AI analysis';

  @override
  String get startingAnalysis => 'Creating analysis…';

  @override
  String get analysisSkillsEmpty =>
      'No creative tasks are available. Check the AI service configuration and retry.';

  @override
  String get analysisLoadFailed => 'AI analysis is temporarily unavailable.';

  @override
  String get analysisStatusQueued => 'Waiting for analysis';

  @override
  String get analysisStatusRunning => 'Analyzing';

  @override
  String get analysisStatusRetryWait => 'Waiting to retry';

  @override
  String get analysisStatusSucceeded => 'Analysis complete';

  @override
  String get analysisStatusFailed => 'Analysis failed';

  @override
  String get analysisStatusCancelled => 'Analysis cancelled';

  @override
  String get analysisStagePreparing => 'Preparing input';

  @override
  String get analysisStageAnalyzing => 'Running AI analysis';

  @override
  String get analysisStageValidating => 'Validating structured results';

  @override
  String get analysisStagePublishing => 'Publishing the report';

  @override
  String get analysisStagePending => 'Waiting to start';

  @override
  String analysisRunSummary(int run, int attempt) {
    return 'Run $run · technical attempt $attempt';
  }

  @override
  String analysisProgressSemantics(int progress) {
    return 'Analysis progress $progress%';
  }

  @override
  String get refreshAnalysisAction => 'Refresh analysis';

  @override
  String get cancelAnalysisAction => 'Cancel analysis';

  @override
  String get cancelAnalysisTitle => 'Cancel this analysis?';

  @override
  String get cancelAnalysisDescription =>
      'This stops the current run. You can start the analysis again later.';

  @override
  String get confirmCancelAnalysis => 'Cancel analysis';

  @override
  String get retryAnalysisAction => 'Retry analysis';

  @override
  String get retryingAnalysis => 'Retrying…';

  @override
  String get deleteAnalysisAction => 'Delete analysis';

  @override
  String get deletingAnalysis => 'Deleting…';

  @override
  String get deleteAnalysisTitle => 'Delete this analysis?';

  @override
  String get deleteAnalysisDescription =>
      'The result and report will be removed and cannot be recovered. The downloaded video is not affected.';

  @override
  String get confirmDeleteAnalysis => 'Delete';

  @override
  String get analysisOperationFailed =>
      'The AI analysis action did not complete. Try again later.';

  @override
  String get analysisExecutionFailed =>
      'AI analysis failed to run. Try again later.';

  @override
  String get analysisServiceUnavailable =>
      'AI analysis is temporarily unavailable. Check the local analysis service and retry.';

  @override
  String get analysisAuthenticationRequired =>
      'The AI analysis service is not signed in. Sign in to the service and retry.';

  @override
  String get analysisTimeoutError => 'AI analysis timed out. Try again later.';

  @override
  String get analysisInvalidResult =>
      'The AI result failed structure and evidence validation. Retry the analysis.';

  @override
  String get screenplayLoglineLabel => 'Logline';

  @override
  String get screenplaySynopsisLabel => 'Synopsis';

  @override
  String get screenplaySceneCoverageLabel => 'Scene coverage';

  @override
  String get screenplayMainCharactersLabel => 'Main characters';

  @override
  String get screenplaySourceScenesLabel => 'Source scenes';

  @override
  String get screenplayOutputScenesLabel => 'Output scenes';

  @override
  String get screenplayRewriteSummaryTitle => 'Change summary';

  @override
  String get screenplayGlossaryTitle => 'Terminology';

  @override
  String get screenplayFullReportTitle => 'Full report';

  @override
  String get screenplayStructuredResultTitle => 'Structured result';

  @override
  String get analysisResourceLimit =>
      'This video exceeds the current analysis limits. Use a shorter or smaller video.';

  @override
  String get analysisInputUnavailable =>
      'The source video is no longer available. Create a new download task.';

  @override
  String get screenplayAnalysisInputUnavailable =>
      'The screenplay document is no longer available. Upload the screenplay again.';

  @override
  String get analysisUsageLimited =>
      'The AI service is rate limited or has insufficient usage available. Try again later.';

  @override
  String get analysisWorkerLost =>
      'The analysis worker disconnected. Check the local service and retry.';

  @override
  String get shotCountLabel => 'Shots';

  @override
  String get visualAssetCountLabel => 'Visual assets';

  @override
  String get visualSummaryTitle => 'Visual summary';

  @override
  String get productionAdviceTitle => 'Production advice';

  @override
  String get analysisResultSectionLabel => 'Result section';

  @override
  String get screenplayTextUnitLabel => 'Text units';

  @override
  String get analysisScenesTab => 'Scenes';

  @override
  String get analysisShotsTab => 'Shots';

  @override
  String get analysisHighlightsTab => 'Highlights';

  @override
  String get analysisAssetsTab => 'Assets';

  @override
  String get analysisReportTab => 'Report preview';

  @override
  String get openAnalysisReportAction => 'Open report preview';

  @override
  String get analysisReportLoading => 'Preparing the report preview…';

  @override
  String get downloadAnalysisReportAction => 'Export Markdown';

  @override
  String get exportAnalysisReportAction => 'Share report';

  @override
  String get analysisReportDownloaded =>
      'The report was saved to your chosen location.';

  @override
  String get analysisReportDownloadFailed =>
      'The report could not be saved. Try again later.';

  @override
  String get analysisReportExportFailed =>
      'The report could not be exported. Try again later.';

  @override
  String get analysisEmptySection =>
      'No results were identified in this section.';

  @override
  String loadMoreAnalysisResults(int count) {
    return 'Load more ($count remaining)';
  }

  @override
  String get highlightScoreLabel => 'Score';

  @override
  String get articleKeyPointsTitle => 'Key points';

  @override
  String get articleClosingTitle => 'Closing';

  @override
  String get articleLimitationsTitle => 'Editorial notes';

  @override
  String get articleEvidenceLabel => 'Video evidence';

  @override
  String get assetTypePerson => 'Person';

  @override
  String get assetTypeLocation => 'Location';

  @override
  String get assetTypeObject => 'Object';

  @override
  String get assetTypeProduct => 'Product';

  @override
  String get assetTypeLogo => 'Logo';

  @override
  String get assetTypeOnScreenText => 'On-screen text';

  @override
  String get adminCenterTitle => 'Admin center';

  @override
  String get adminAnalyticsTitle => 'Usage analytics';

  @override
  String get adminFilesTitle => 'File management';

  @override
  String get adminUsersTitle => 'User management';

  @override
  String get adminProvidersTitle => 'Provider catalog';

  @override
  String get adminAiProvidersTitle => 'AI services';

  @override
  String adminDays(int days) {
    return '$days days';
  }

  @override
  String get adminSuccessRate => 'Success rate';

  @override
  String get adminDownloadedBytes => 'Downloaded';

  @override
  String get adminSourceBreakdown => 'Source breakdown';

  @override
  String get adminFilesEmpty => 'No persisted files';

  @override
  String get adminRoleLabel => 'Role';

  @override
  String get adminRoleUser => 'User';

  @override
  String get adminRoleAdmin => 'Administrator';

  @override
  String get adminAccountActive => 'Allow sign-in and service access';

  @override
  String get adminAccountEnabled => 'Enabled';

  @override
  String get adminAccountDisabled => 'Disabled';

  @override
  String get adminCurrentUser => 'Current account';

  @override
  String get saveAction => 'Save';

  @override
  String get editAction => 'Edit';

  @override
  String get adminSystemRegistered => 'Registered by system';

  @override
  String get adminSystemMissing => 'Catalog only';

  @override
  String get adminAgentAvailable => 'The local analysis agent is available.';

  @override
  String get adminAgentUnavailable =>
      'The local analysis agent is currently unavailable.';

  @override
  String get adminCredentialReady => 'Credential configured';

  @override
  String get adminCredentialMissing => 'Credential missing';

  @override
  String get adminActiveLine => 'Active route';

  @override
  String get adminActivateAction => 'Make active';

  @override
  String get adminActionFailed =>
      'The admin operation did not complete. Refresh and retry.';

  @override
  String get cancelDownloadAction => 'Cancel task';

  @override
  String get retryDownloadAction => 'Download again';

  @override
  String get deleteDownloadAction => 'Delete task';

  @override
  String get deleteDownloadTitle => 'Delete task and files?';

  @override
  String get deleteDownloadDescription =>
      'The download record, video file, local upload source, and private cover will be permanently deleted. This cannot be undone.';

  @override
  String get deleteDownloadActiveDescription =>
      'The active task will be cancelled first. The download record, video file, local upload source, and private cover will be permanently deleted. This cannot be undone.';

  @override
  String get keepDownloadAction => 'Keep task';

  @override
  String get deleteDocumentAction => 'Delete document';

  @override
  String get deleteDocumentTitle => 'Delete screenplay document?';

  @override
  String get deleteDocumentDescription =>
      'The original file, normalized screenplay, and current document record will be permanently deleted. Any analysis using it must finish first. This cannot be undone.';

  @override
  String get keepDocumentAction => 'Keep document';

  @override
  String get confirmDeleteAction => 'Confirm delete';

  @override
  String get verificationCodeLabel => 'Email verification code';

  @override
  String get invalidVerificationCode =>
      'Code is incorrect, expired or already used. Check your email and code, or request a new one.';

  @override
  String get emailUnavailable =>
      'Registration email is unavailable. Try again later or contact support.';

  @override
  String get emailSendFailed =>
      'Email delivery could not be confirmed. Request a new code later.';

  @override
  String get sendVerificationCode => 'Send code';

  @override
  String get sendingVerificationCode => 'Sending…';

  @override
  String get verificationCodeSent =>
      'Code sent, valid for 10 minutes. Check your spam folder if needed.';

  @override
  String verificationCodeCooldown(int seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get verificationCodeRequired =>
      'Enter the 6-digit code from your email';

  @override
  String get verificationRateLimited =>
      'Wait 60 seconds before requesting another code.';

  @override
  String get passwordTooLong => 'Password cannot exceed 128 characters';

  @override
  String get requiredEmail => 'Enter your email address';

  @override
  String get requiredPassword => 'Enter your password';

  @override
  String get requiredNewPassword => 'Set a password';

  @override
  String get requiredConfirmPassword => 'Enter your password again';

  @override
  String get requiredUsername => 'Set a username';

  @override
  String get usernameTooShort => 'Username must contain at least 2 characters';

  @override
  String get usernameTooLong => 'Username cannot exceed 32 characters';

  @override
  String get usernameInvalidCharacters =>
      'Use letters, numbers, Chinese characters, underscores, hyphens or periods';

  @override
  String get previousPage => 'Previous';

  @override
  String get nextPage => 'Next';

  @override
  String get profileSaved => 'Profile updated.';

  @override
  String get saveProfile => 'Save profile';

  @override
  String get savingProfile => 'Saving';

  @override
  String get profileTitle => 'Profile';

  @override
  String get searchAction => 'Search';

  @override
  String get allStatuses => 'All statuses';

  @override
  String get currentPageAvailable => 'Available on this page';

  @override
  String get searchDownloads => 'Search downloads';

  @override
  String get searchUsers => 'Search username or email';

  @override
  String get statusLabel => 'Status';

  @override
  String get deleteConfiguration => 'Delete configuration?';

  @override
  String get deleteConfigurationDescription =>
      'This cannot be undone. Existing tasks and reports will be retained.';

  @override
  String get createPlatform => 'Add platform';

  @override
  String get configurationKey => 'Configuration key';

  @override
  String get displayName => 'Display name';

  @override
  String get sortOrder => 'Sort order';

  @override
  String get platformVisible => 'Visible to users';

  @override
  String get invalidConfiguration => 'Check this field’s format and value.';

  @override
  String get createAiProvider => 'Add AI service';

  @override
  String get engineLabel => 'Engine';

  @override
  String get authModeLabel => 'Authentication';

  @override
  String get modelLabel => 'Model';

  @override
  String get baseUrlLabel => 'Service URL';

  @override
  String get apiKeyLabel => 'API Key';

  @override
  String get apiKeyKeepHint => 'Leave blank to keep the existing credential';

  @override
  String get localCodexRestriction =>
      'System fallback: only the name and model can be changed.';

  @override
  String get hostLoginLabel => 'Host login · no API key';

  @override
  String get deleteAction => 'Delete';

  @override
  String get cancelAction => 'Cancel';

  @override
  String get exportDocx => 'Export DOCX';

  @override
  String get videoFile => 'Video file';

  @override
  String get analysisReport => 'Analysis report';

  @override
  String get uniqueUsers => 'Unique users';

  @override
  String get averageDuration => 'Average video duration (seconds)';

  @override
  String get cancelledLabel => 'Cancelled';

  @override
  String get allRoles => 'All roles';

  @override
  String get searchPlatforms => 'Search platforms';

  @override
  String get visiblePlatform => 'Visible';

  @override
  String get hiddenPlatform => 'Hidden';

  @override
  String get previousAnalysisResult => 'Previous completed result';

  @override
  String get catalogScopeDescription =>
      'Adding a catalog entry does not add download support.';

  @override
  String get analysisRateLimited => 'Too many AI requests. Try again later.';

  @override
  String get providerChallengeError =>
      'The platform requires verification. Media cannot be read right now.';

  @override
  String get providerExtractorError =>
      'The platform page structure has changed. Media cannot be read with the current adapter.';

  @override
  String get providerEgressError =>
      'The configured egress cannot reach the media platform.';

  @override
  String get providerNetworkError =>
      'A temporary network failure occurred while connecting to the media platform.';

  @override
  String get providerRuntimeError =>
      'The inspection runtime is temporarily unavailable.';

  @override
  String get providerRegistered => 'Registered';

  @override
  String get providerIdentityRequired => 'Login required';

  @override
  String get providerIdentityPrefer => 'Prefer login';

  @override
  String get providerIdentityNone => 'No login required';

  @override
  String get providerLoginRequiredError =>
      'This content requires login. Confirm the deployment host is signed into the platform.';

  @override
  String get providerContentProtectedError =>
      'This content is protected and cannot be downloaded. Import a file you have already obtained.';

  @override
  String get providerUnavailable => 'Not enabled';

  @override
  String get providerIdentityUnavailableError =>
      'Platform login material is unavailable. Check the deployment host login and inspect the link again.';

  @override
  String get providerContextChangedError =>
      'The media execution context changed. Inspect the link again and confirm the download format.';

  @override
  String get reparseDownloadAction => 'Inspect link again';

  @override
  String get inspectionContainerLabel => 'Container';

  @override
  String get inspectionCompatibilityLabel => 'Compatibility';

  @override
  String get inspectionVideoCodecLabel => 'Video codec';

  @override
  String get inspectionAudioCodecLabel => 'Audio codec';

  @override
  String get compatibilityQuality => 'Quality first';

  @override
  String get compatibilitySmallest => 'Smallest file';

  @override
  String get compatibilityBalanced => 'Balanced';

  @override
  String get analysisPriorityRevisions => 'Priority revisions';

  @override
  String get analysisStrengths => 'Strengths';

  @override
  String get analysisStructure => 'Acts';

  @override
  String get analysisTurningPoints => 'Turning points';

  @override
  String get analysisCharacters => 'Characters';

  @override
  String get analysisDialogue => 'Dialogue findings';

  @override
  String get analysisConflict => 'Conflict';

  @override
  String get analysisTurn => 'Turn';

  @override
  String get analysisPacing => 'Pacing';

  @override
  String get analysisGoal => 'Goal';

  @override
  String get analysisCharacterArc => 'Character arc';

  @override
  String get analysisVisualRules => 'Visual rules';

  @override
  String get analysisContinuityRisks => 'Continuity risks';

  @override
  String get analysisNarrativeFunction => 'Narrative function';

  @override
  String get analysisTransition => 'Transition';

  @override
  String get analysisRecommendedExtensions => 'Recommended extensions';

  @override
  String get analysisPriorityShots => 'Priority shots';

  @override
  String get analysisEvidenceShots => 'Evidence shots';

  @override
  String get analysisReportSections => 'Report sections';

  @override
  String get activityHistoryTitle => 'My activity';

  @override
  String get activityHistorySearch => 'Search activity';

  @override
  String get activityHistoryLink => 'Link parsing';

  @override
  String get activityHistoryVideo => 'Video AI';

  @override
  String get activityHistoryScreenplay => 'Screenplay processing';

  @override
  String get activityHistoryBasic => 'Basic parsing';

  @override
  String get activityHistoryRewrite => 'AI rewrite';

  @override
  String get activityHistoryAll => 'All types';

  @override
  String get pageSizeLabel => 'Page size';

  @override
  String get profileAvatarUpload => 'Upload avatar';

  @override
  String get profileAvatarRemove => 'Remove avatar';

  @override
  String get profileAvatarBusy => 'Updating avatar';

  @override
  String get profileAvatarHelp =>
      'JPEG, PNG, WebP · Max 4 MB · Automatically cropped to a square';

  @override
  String get profileAvatarInvalidType => 'Choose a JPEG, PNG or WebP image.';

  @override
  String get profileAvatarInvalidSize =>
      'Avatar files must be nonempty and no larger than 4 MB.';

  @override
  String get profileAvatarSaved => 'Avatar updated.';

  @override
  String get profileAvatarRemoved => 'Avatar removed.';

  @override
  String get profileRoleLabel => 'Account role';

  @override
  String get profileRoleAdminHelp =>
      'Another active administrator must remain before changing to a regular user.';

  @override
  String get profilePartialSave =>
      'Username saved; account role could not be updated.';

  @override
  String get selfHostingNavigation => 'Self-hosting';

  @override
  String get aboutNavigation => 'About Framefetch';

  @override
  String get resourcesNavigation => 'Resources';

  @override
  String get adminDownloadsTab => 'Downloads';

  @override
  String get adminAnalysisTab => 'AI analysis';

  @override
  String get adminAnalysisExecutions => 'Executions';

  @override
  String get adminAnalysisDuration => 'Average completion duration';

  @override
  String get adminAnalysisDurationCount => 'Valid completion records';

  @override
  String get adminAnalysisStatus => 'Execution status';

  @override
  String get adminAnalysisInput => 'Input type';

  @override
  String get adminAnalysisEmpty => 'No AI analysis records in this period';

  @override
  String get adminTrendDetails => 'Exact data';

  @override
  String get adminOperationLogsTitle => 'System operation logs';

  @override
  String get adminOperationLogSearch => 'Actor or operation';

  @override
  String get adminOperationScope => 'Operation scope';

  @override
  String get adminAllOperations => 'All operations';

  @override
  String get adminRequestOperations => 'API requests';

  @override
  String get adminTaskOperations => 'System tasks';

  @override
  String get adminAdminOperations => 'Administrator operations';

  @override
  String get adminOperationOutcome => 'Outcome';

  @override
  String get adminAllOutcomes => 'All outcomes';

  @override
  String get adminOperationStarted => 'Outcome unconfirmed';

  @override
  String get adminOperationSucceeded => 'Request succeeded';

  @override
  String get adminOperationFailed => 'Request failed';

  @override
  String get adminOperationSucceededFilter => 'Success / state update';

  @override
  String get adminOperationFrom => 'Start time';

  @override
  String get adminOperationTo => 'End time';

  @override
  String get adminOperationDateHint => 'YYYY-MM-DD HH:mm';

  @override
  String get adminOperationInvalidDates =>
      'The end time cannot precede the start time. Use YYYY-MM-DD HH:mm.';

  @override
  String get adminOperationLogsEmpty => 'No operation logs';

  @override
  String get adminOperationDetails => 'Operation details';

  @override
  String get adminOperationActor => 'Actor';

  @override
  String get adminUnknownAccount => 'Unknown account';

  @override
  String get adminOperationObject => 'Resource';

  @override
  String get adminOperationId => 'Log ID';

  @override
  String get adminActorId => 'Account ID';

  @override
  String get adminOperationLabel => 'Operation';

  @override
  String get adminOperationKey => 'Operation key';

  @override
  String get adminOperationEndpoint => 'Endpoint';

  @override
  String get adminOperationFinished => 'Finished at';

  @override
  String get adminOperationStatusCode => 'HTTP status';

  @override
  String get adminOperationErrorCode => 'Error code';

  @override
  String get adminDeleteUserDescription =>
      'The account, credentials, role, quotas, and sessions are removed. Historical download files and task records are retained.';

  @override
  String get adminDeleteFileDescription =>
      'The file and its persistent objects are permanently deleted. Source files used by active analysis cannot be deleted.';

  @override
  String get adminUsersEmpty => 'No matching accounts';

  @override
  String get adminQuotaTitle => 'Usage limits';

  @override
  String get adminQuotaExempt => 'Exempt from usage limits';

  @override
  String get adminQuotaActive => 'Active tasks';

  @override
  String get adminQuotaDailyTasks => 'Tasks per 24 hours';

  @override
  String get adminQuotaDailyGiB => 'Processed per 24 hours (GiB)';

  @override
  String get adminQuotaStorageGiB => 'Retained storage (GiB)';

  @override
  String get adminQuotaAnalysis => 'Analysis attempts per 24 hours';

  @override
  String get adminUseSystemDefault => 'Use system default';

  @override
  String get adminPlatformsEmpty => 'No matching platforms';

  @override
  String get adminAiSearch => 'Search AI configurations';

  @override
  String get adminAiEmpty => 'No matching AI configurations';

  @override
  String get adminEngineCodex => 'Codex CLI · Responses';

  @override
  String get adminEngineClaude => 'Claude CLI · Messages';

  @override
  String get adminEngineOpenRouter => 'OpenRouter API';

  @override
  String get adminEngineOpenAi => 'OpenAI-compatible API';

  @override
  String get adminEngineDeepSeek => 'DeepSeek API · LangChain vision';

  @override
  String get adminApiUrlHint =>
      'Public endpoints require HTTPS; localhost endpoints may use HTTP.';

  @override
  String get adminHostLoginHint =>
      'Use the CLI account signed in on the server.';

  @override
  String get adminReadModels => 'Load OpenRouter models';

  @override
  String get adminModelSearch => 'Search model name or ID';

  @override
  String get adminModelsHint =>
      'Choose an image-capable model for video analysis.';

  @override
  String get adminImageSupported => 'Image input';

  @override
  String get adminTextOnly => 'Text only';

  @override
  String get adminModelsEmpty => 'No matching models';

  @override
  String get adminModelDirectory => 'Catalog models';

  @override
  String pageSizeOption(int size) {
    return '$size per page';
  }

  @override
  String get aboutContent =>
      '## Who is Framefetch for?\n\n### Creators\n\nOrganize media you own or are authorized to use. Review structure using shots, scenes and keyframe evidence.\n\n### Content researchers\n\nTrack videos and screenplay documents as tasks. Export Markdown and DOCX reports for review.\n\n### Developers and teams\n\nRun FastAPI, Next.js and workers on your infrastructure, and extend Web or mobile clients through OpenAPI.\n\n## Why asynchronous workflows?\n\n### Recoverable\n\nPostgreSQL stores task facts. Transactional Outbox keeps database state and message intent consistent. Realtime connections display progress.\n\n### Isolated\n\nDownloads, media commands and AI tasks run outside HTTP request processes. Runners use controlled egress that blocks private networks.\n\n### Verifiable\n\nProvider responses do not become final files directly. Workers resolve again and verify format, duration, size and SHA-256 before storage.\n\n### Self-hosted\n\nData stays on infrastructure configured by the deployer. No official hosted service or embedded third-party tracking is required.\n\n## Content and service boundaries\n\nProcess only authorized, public, free, non-DRM HTTP(S) content by default. Protected, paid, private or region-restricted content is outside that scope. Private-network URLs, arbitrary yt-dlp arguments and shell inputs are prohibited.\n\nThe MIT license grants software rights, not rights to download, copy or analyze third-party media. The project offers no official SaaS, public demo service or availability SLA.\n\n## Source repositories\n\n[framefetch-server](https://github.com/StephenQiu30/framefetch-server): FastAPI API, Next.js Web, download/document/report workers, isolated media runner and Compose deployment.\n\n[framefetch-app](https://github.com/StephenQiu30/framefetch-app): Flutter iOS and Android client. Media processing and AI inference run on the server.\n\nMaintained by [StephenQiu](https://github.com/StephenQiu30). Contributions through issues and pull requests are welcome. Report security issues privately using the [security policy](https://github.com/StephenQiu30/framefetch-server/blob/main/SECURITY.md).';

  @override
  String get selfHostingContent =>
      'Commands and configuration follow the repository README. Consult the design documents for platform sign-in and recovery.\n\n## Requirements\n\n- Docker Engine and Docker Compose.\n- Existing PostgreSQL, RabbitMQ, Redis and MinIO. Compose manages Framefetch business services and reuses this infrastructure.\n- macOS platform identity requires uv (Python 3.12), your regular Chrome profile and the Framefetch extension.\n- Production needs strong random secrets, a stable HTTPS address and planned object storage capacity.\n\n## Deploy with Docker Compose\n\n### Clone and configure\n\nConfigure .env to connect to your existing infrastructure. Store real secrets in an untracked .env or a secret manager.\n\n```sh\ngit clone https://github.com/StephenQiu30/framefetch-server.git\ncd framefetch-server\ntest -f .env || cp .env.example .env\n```\n\n### Load the current schema\n\nFor an empty project database, load schema.sql using the DDL account. Back up existing databases before upgrades.\n\n```sh\npsql -X -v ON_ERROR_STOP=1 -W -h 127.0.0.1 -U video -d video -f backend/sql/schema.sql\n```\n\n### Install identity source and start services\n\nOn macOS install the identity source and load the printed extension directory in chrome://extensions. Reuse your regular Chrome sign-in. Compose starts Web, API, workers, runner and egress proxy. Public links prefer anonymous parsing. See README for production.\n\n```sh\nuv run --project backend python -m app.workers.session.source_cli install --env-file .env\ndocker compose up -d --build --wait --remove-orphans\n```\n\n### Bootstrap the first administrator\n\nRun once on the deployment host for an empty user table. Enter the password interactively. There is no HTTP bootstrap endpoint.\n\n```sh\nuv run --project backend python -m app.workers.bootstrap_admin --env-file .env --username your-admin --email you@example.com\n```\n\n### Check health\n\nWeb defaults to port 8101, API to 8111 and Swagger to :8111/docs. Health does not prove platform media can be downloaded.\n\n```sh\ncurl --fail http://127.0.0.1:8111/health/live\ncurl --fail http://127.0.0.1:8111/health/ready\ncurl --fail --head http://127.0.0.1:8101/\n```\n\n## Is AI required?\n\nAI workers run independently of business Compose. Use a signed-in host Codex App Server or configure a supported model provider. Set ANALYSIS_ENABLED=false for download/document-only use. This does not disable downloads or document imports.\n\nExternal models receive analysis content and may incur fees. Check media authorization and provider data policies before enabling them.\n\n## Before publishing\n\n- Replace all placeholder .env.prod credentials and make secret recovery possible.\n- Route external media through egress that blocks private networks. URL validation alone is insufficient.\n- Plan MinIO capacity, backup and explicit cleanup. Expired signed URLs do not delete final files.\n- Use SITE_INDEXABLE=true only for a public project introduction site and set SITE_URL to a stable HTTPS domain.\n- Update with git pull --ff-only, reinstall identity source and rebuild/start Compose per README. Restart alone does not apply new images or environment settings.\n\n[Quick Start](https://github.com/StephenQiu30/framefetch-server#快速开始) · [System design](https://github.com/StephenQiu30/framefetch-server/blob/main/docs/design/README.md)';

  @override
  String get activityHistoryFrom => 'From date';

  @override
  String get activityHistoryTo => 'To date';

  @override
  String get activityHistorySkill => 'Creative task';

  @override
  String get activitySourceUnavailable =>
      'Source unavailable. Saved results remain available.';

  @override
  String get analysisRunsTitle => 'Run history';

  @override
  String get verifyRegistrationEmail => 'Verify email';

  @override
  String get verifyingRegistrationEmail => 'Verifying…';

  @override
  String get registrationEmailVerified => 'Email verified';

  @override
  String get registrationEmailVerificationSuccess =>
      'Email verified. You can set your password.';

  @override
  String currentPageLabel(int page) {
    return 'Page $page';
  }

  @override
  String get adminAnalysisRateFormula => 'Succeeded ÷ (succeeded + failed)';

  @override
  String get adminAnalysisTrendTitle => 'Daily analysis trend';

  @override
  String get adminDownloadTrendTitle => 'Daily download trend';

  @override
  String get adminStatusDistribution => 'Status distribution';

  @override
  String get adminSourcePerformance => 'Download performance by source';

  @override
  String get adminCompletionTrend => 'Completion rate trend';

  @override
  String get adminOperationDeleted => 'Deleted';

  @override
  String get adminDeleteAiDescription =>
      'Selected AI configurations and credentials will be permanently deleted. Active and fallback routes cannot be deleted.';

  @override
  String get adminDeleteCatalogDescription =>
      'Entries are removed from the catalog and public status page. System download profiles remain available.';

  @override
  String get exportMarkdown => 'Export Markdown';

  @override
  String get publicWorkflowEyebrow => 'Workflow';

  @override
  String get adminObjectCount => 'Object count';

  @override
  String analysisRunNumber(int run) {
    return 'Run $run';
  }

  @override
  String get analysisRetryTitle => 'Run again with the original settings';

  @override
  String get analysisRetryDescription =>
      'Keeps the analysis ID and starts another run, which may consume model quota. Create a new analysis from the source to change settings.';

  @override
  String get confirmRetryAnalysis => 'Confirm run';

  @override
  String get adminPeriodLabel => 'Period';

  @override
  String get contentCreationTitle => 'Content creation';

  @override
  String get contentReviewTitle => 'Review notes';

  @override
  String get contentSourceTitle => 'Source references';

  @override
  String get contentNeedsReview =>
      'Review found issues. Update the source material or writing requirements and create a new task.';

  @override
  String get contentNeedsMaterial =>
      'Some statements need more source material before use.';

  @override
  String get analysisStageDrafting => 'Drafting';

  @override
  String get analysisStageReviewing => 'Reviewing';

  @override
  String get analysisStageRevising => 'Revising';

  @override
  String get analysisConfigurationChanged =>
      'The generation settings changed. Create a new task.';

  @override
  String get contentHistoricalDraft =>
      'This is a retained historical draft. The automatic review does not apply to its manually changed prose.';

  @override
  String get analysisOutcomeUnknown =>
      'The execution receipt is unknown. Refresh or check activity history before running it again.';

  @override
  String get exportWechatHtml => 'Export WeChat HTML';

  @override
  String get exportNativeShotBundle => 'Download shot analysis bundle';
}
