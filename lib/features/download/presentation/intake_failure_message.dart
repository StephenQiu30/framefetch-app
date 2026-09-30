import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

String? intentFailureMessage(
  AppLocalizations localizations,
  IntentResponse intent,
) {
  final failure = intent.failure;
  if (intent.status == IntentStatus.retryWait &&
      failure?.scope == FailureScope.session) {
    return localizations.intentAutomaticSessionRecovery;
  }
  if (intent.status == IntentStatus.queued ||
      intent.status == IntentStatus.preparing ||
      intent.status == IntentStatus.resolving ||
      intent.status == IntentStatus.retryWait) {
    return null;
  }
  final message = switch (failure?.failureClass) {
    FailureClass.authRequired ||
    FailureClass.sessionExpired => localizations.providerSessionError,
    FailureClass.challengeRequired => localizations.providerChallengeError,
    FailureClass.tokenUnavailable ||
    FailureClass.tokenRejected => localizations.providerTokenError,
    FailureClass.extractorChanged => localizations.providerExtractorError,
    FailureClass.mediaProbeFailed => localizations.providerMediaProbeError,
    FailureClass.egressDenied => localizations.providerEgressError,
    FailureClass.networkTransient => localizations.providerNetworkError,
    FailureClass.runtimeUnavailable =>
      failure?.scope == FailureScope.session
          ? localizations.providerSessionSourceError
          : localizations.providerRuntimeError,
    FailureClass.capacityExhausted => localizations.providerCapacityError,
    FailureClass.contextChanged => localizations.intentContextChangedError,
    FailureClass.outcomeUnknown => localizations.providerUnknownOutcomeError,
    FailureClass.contentRestricted => localizations.providerRestrictedError,
    FailureClass.contentUnavailable => localizations.providerLinkError,
    FailureClass.sourceUnsupported => localizations.providerUnsupportedError,
    FailureClass.protocolUnavailable ||
    FailureClass.formatUnavailable => localizations.noFormatsAvailable,
    FailureClass.rateLimited => localizations.rateLimitedError,
    _ => null,
  };
  if (message != null) return message;
  final code = intent.reasonCode;
  return code == null
      ? null
      : intakeFailureMessage(
          localizations,
          DataRequestFailure(DataRequestFailureKind.unknown, code: code),
        );
}

String intakeFailureMessage(AppLocalizations localizations, Object error) {
  if (error is! DataRequestFailure) return localizations.operationFailed;
  return switch (error.code) {
    'invalid_url' => localizations.mediaUrlError,
    'inspection_failed' => localizations.inspectionFailedError,
    'inspection_timeout' => localizations.inspectionTimeoutError,
    'provider_auth_required' ||
    'provider_session_expired' => localizations.providerSessionError,
    'provider_configuration_missing' =>
      localizations.providerConfigurationMissing,
    'provider_access_policy_not_allowed' =>
      localizations.providerPolicyNotAllowed,
    'provider_geo_restricted' => localizations.providerRegionError,
    'provider_content_restricted' => localizations.providerRestrictedError,
    'provider_drm_protected' => localizations.providerDrmError,
    'provider_link_unavailable' => localizations.providerLinkError,
    'provider_verification_failed' => localizations.providerChallengeError,
    'provider_session_not_ready' => localizations.providerSessionSourceError,
    'provider_temporarily_unavailable' => localizations.providerTemporaryError,
    'provider_media_unsupported' ||
    'provider_unsupported' => localizations.providerUnsupportedError,
    'duration_limit_exceeded' => localizations.durationLimitError,
    'format_unavailable' => localizations.noFormatsAvailable,
    'resource_expired' => localizations.intentExpired,
    'article_access_restricted' => localizations.articleRestrictedError,
    'article_discovery_failed' => localizations.articleDiscoveryError,
    _ => switch (error.kind) {
      DataRequestFailureKind.unauthenticated =>
        localizations.unauthenticatedError,
      DataRequestFailureKind.forbidden => localizations.providerRestrictedError,
      DataRequestFailureKind.rateLimited => localizations.rateLimitedError,
      DataRequestFailureKind.unavailable =>
        localizations.serviceUnavailableError,
      _ => localizations.operationFailed,
    },
  };
}
