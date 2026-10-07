import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_colors.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

bool isActiveDownloadStatus(String status) =>
    status == 'queued' || status == 'running' || status == 'retryWait';

enum DownloadRecovery { retry, reimport, reparse }

DownloadRecovery? downloadRecovery({
  required DownloadSourceKind sourceKind,
  required DownloadStatus status,
  required bool fileAvailable,
  DownloadErrorCode? errorCode,
}) {
  if (status != DownloadStatus.failed &&
      status != DownloadStatus.cancelled &&
      !(status == DownloadStatus.succeeded && !fileAvailable)) {
    return null;
  }
  if (sourceKind == DownloadSourceKind.remoteProvider &&
      errorCode == DownloadErrorCode.contextChanged) {
    return DownloadRecovery.reparse;
  }
  return sourceKind == DownloadSourceKind.remoteProvider
      ? DownloadRecovery.retry
      : DownloadRecovery.reimport;
}

Color downloadStatusColor(BuildContext context, String status) =>
    switch (status) {
      'succeeded' => context.appColors.success,
      'failed' => Theme.of(context).colorScheme.error,
      'queued' || 'running' || 'retryWait' => context.appColors.warning,
      _ => Theme.of(context).colorScheme.onSurfaceVariant,
    };

String downloadStatusLabel(AppLocalizations l10n, String status) =>
    switch (status) {
      'queued' => l10n.downloadStatusQueued,
      'running' => l10n.downloadStatusRunning,
      'retryWait' => l10n.downloadStatusRetryWait,
      'succeeded' => l10n.downloadStatusSucceeded,
      'failed' => l10n.downloadStatusFailed,
      'cancelled' => l10n.downloadStatusCancelled,
      _ => l10n.downloadStatusUnknown,
    };

String downloadStageLabel(AppLocalizations l10n, String stage) =>
    switch (stage) {
      'revalidating' => l10n.downloadStageRevalidating,
      'downloading' => l10n.downloadStageDownloading,
      'remuxing' => l10n.downloadStageRemuxing,
      'verifying' => l10n.downloadStageVerifying,
      'uploading' => l10n.downloadStageUploading,
      _ => l10n.downloadStageUnknown,
    };

String downloadFailureLabel(AppLocalizations l10n, DownloadErrorCode code) =>
    switch (code) {
      DownloadErrorCode.cancelled => l10n.failureCancelled,
      DownloadErrorCode.downloadTimeout ||
      DownloadErrorCode.networkBlocked => l10n.providerEgressError,
      DownloadErrorCode.challenge => l10n.providerChallengeError,
      DownloadErrorCode.loginRequired => l10n.providerLoginRequiredError,
      DownloadErrorCode.identityUnavailable =>
        l10n.providerIdentityUnavailableError,
      DownloadErrorCode.rateLimited => l10n.rateLimitedError,
      DownloadErrorCode.contextChanged => l10n.providerContextChangedError,
      DownloadErrorCode.contentUnavailable => l10n.providerLinkError,
      DownloadErrorCode.contentProtected => l10n.providerContentProtectedError,
      DownloadErrorCode.extractorBroken => l10n.providerExtractorError,
      DownloadErrorCode.formatUnavailable => l10n.noFormatsAvailable,
      DownloadErrorCode.transient => l10n.providerNetworkError,
      DownloadErrorCode.invalidInput => l10n.mediaUrlError,
      DownloadErrorCode.runtimeUnavailable => l10n.providerRuntimeError,
      DownloadErrorCode.storageUnavailable ||
      DownloadErrorCode.tempSpaceExhausted => l10n.failureStorage,
      _ => l10n.failureGeneric,
    };

String downloadFormatLabel(
  AppLocalizations localizations,
  SemanticPlanResponse? format,
) {
  if (format == null) return localizations.formatUnavailable;
  final container = format.containerPreference.name.toUpperCase();
  final codec = format.videoCodecFamily.name.toUpperCase();
  return '${format.width}×${format.height} · $container · $codec';
}
