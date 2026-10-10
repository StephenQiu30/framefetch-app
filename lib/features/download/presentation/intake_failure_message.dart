import 'package:framefetch/core/network/data_request_failure.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

String? intentFailureMessage(
  AppLocalizations localizations,
  IntentResponse intent,
) {
  final failure = intent.failure;
  if (intent.status == IntentStatus.queued ||
      intent.status == IntentStatus.resolving ||
      intent.status == IntentStatus.cancelling) {
    return null;
  }
  final message = switch (failure?.failureClass) {
    FailureClass.networkBlocked => localizations.providerEgressError,
    FailureClass.challenge => localizations.providerChallengeError,
    FailureClass.loginRequired => localizations.providerLoginRequiredError,
    FailureClass.identityUnavailable =>
      localizations.providerIdentityUnavailableError,
    FailureClass.rateLimited => localizations.providerRateLimitedError,
    FailureClass.contextChanged => localizations.providerContextChangedError,
    FailureClass.contentUnavailable => localizations.providerLinkError,
    FailureClass.contentProtected =>
      localizations.providerContentProtectedError,
    FailureClass.extractorBroken => localizations.providerExtractorError,
    FailureClass.formatUnavailable => localizations.noFormatsAvailable,
    FailureClass.transient => localizations.providerNetworkError,
    FailureClass.invalidInput => localizations.mediaUrlError,
    FailureClass.runtimeUnavailable => localizations.providerRuntimeError,
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
    'network_blocked' => localizations.providerEgressError,
    'challenge' => localizations.providerChallengeError,
    'login_required' => localizations.providerLoginRequiredError,
    'identity_unavailable' => localizations.providerIdentityUnavailableError,
    'rate_limited' => localizations.providerRateLimitedError,
    'operation_rate_limited' => localizations.rateLimitedError,
    'context_changed' => localizations.providerContextChangedError,
    'content_unavailable' => localizations.providerLinkError,
    'content_protected' => localizations.providerContentProtectedError,
    'extractor_broken' => localizations.providerExtractorError,
    'transient' => localizations.providerNetworkError,
    'invalid_input' => localizations.mediaUrlError,
    'runtime_unavailable' => localizations.providerRuntimeError,
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
