import 'package:framefetch/features/auth/data/native_auth_gateway.dart';
import 'package:framefetch/l10n/app_localizations.dart';

String authFailureMessage(
  AppLocalizations localizations,
  AuthFailureKind failure,
) {
  return switch (failure) {
    AuthFailureKind.verificationRateLimited =>
      localizations.verificationRateLimited,
    AuthFailureKind.invalidVerificationCode =>
      localizations.invalidVerificationCode,
    AuthFailureKind.emailUnavailable => localizations.emailUnavailable,
    AuthFailureKind.emailSendFailed => localizations.emailSendFailed,
    AuthFailureKind.invalidCredentials => localizations.invalidCredentialsError,
    AuthFailureKind.emailRegistered => localizations.emailRegisteredError,
    AuthFailureKind.usernameRegistered => localizations.usernameRegisteredError,
    AuthFailureKind.unauthenticated => localizations.unauthenticatedError,
    AuthFailureKind.rateLimited => localizations.rateLimitedError,
    AuthFailureKind.unavailable => localizations.serviceUnavailableError,
    AuthFailureKind.unknown => localizations.unknownAuthError,
  };
}
