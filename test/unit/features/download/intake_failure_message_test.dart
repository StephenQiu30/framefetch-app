import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/download/presentation/intake_failure_message.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/intake_fakes.dart';

void main() {
  test('deserializes Unicode gates and safe evidence without losing types', () {
    final failure = standardSerializers.deserializeWith(
      IntentFailureResponse.serializer,
      {
        'code': 'rate_limited',
        'failure_class': 'rate_limited',
        'layer': 'L1',
        'stage': 'publish',
        'gate': '①',
        'evidence': {
          'kind': 'upstream_response',
          'http_status': 429,
          'stderr_truncated': false,
          'cause_code': null,
        },
        'summary': 'The upstream is rate limited.',
      },
    )!;
    expect(failure.gate, IntentFailureResponseGateEnum.gateOne);
    expect(failure.stage, IntentFailureResponseStageEnum.publish);
    expect(failure.failureClass, FailureClass.rateLimited);
    final encoded =
        standardSerializers.serializeWith(
              IntentFailureResponse.serializer,
              failure,
            )
            as Map<String, dynamic>;
    expect(encoded['gate'], '①');
    expect(encoded['evidence'], {
      'kind': 'upstream_response',
      'http_status': 429,
      'stderr_truncated': false,
      'cause_code': null,
    });
  });

  for (final locale in [const Locale('zh'), const Locale('en')]) {
    final localizations = lookupAppLocalizations(locale);
    final expected = {
      'network_blocked': localizations.providerEgressError,
      'challenge': localizations.providerChallengeError,
      'login_required': localizations.providerLoginRequiredError,
      'identity_unavailable': localizations.providerIdentityUnavailableError,
      'rate_limited': localizations.rateLimitedError,
      'content_unavailable': localizations.providerLinkError,
      'content_protected': localizations.providerContentProtectedError,
      'extractor_broken': localizations.providerExtractorError,
      'format_unavailable': localizations.noFormatsAvailable,
      'transient': localizations.providerNetworkError,
      'runtime_unavailable': localizations.providerRuntimeError,
      'invalid_input': localizations.mediaUrlError,
      'context_changed': localizations.providerContextChangedError,
    };
    for (final entry in expected.entries) {
      test('${locale.languageCode} preserves ${entry.key} remediation', () {
        expect(
          intakeFailureMessage(
            localizations,
            DataRequestFailure(
              DataRequestFailureKind.unknown,
              code: entry.key,
              detail: 'unsafe upstream detail',
            ),
          ),
          entry.value,
        );
      });
    }
    final classes = {
      FailureClass.identityUnavailable:
          localizations.providerIdentityUnavailableError,
      FailureClass.rateLimited: localizations.rateLimitedError,
      FailureClass.contextChanged: localizations.providerContextChangedError,
    };
    for (final entry in classes.entries) {
      test(
        '${locale.languageCode} renders typed ${entry.key.name} failures',
        () {
          final failure = IntentFailureResponse(
            (b) => b
              ..code = 'internal_error'
              ..failureClass = entry.key
              ..layer = 'L1'
              ..stage = IntentFailureResponseStageEnum.resolve
              ..gate = IntentFailureResponseGateEnum.none
              ..evidence.replace({})
              ..summary = 'unsafe upstream detail',
          );
          final intent = intentFixture(
            status: IntentStatus.failed,
          ).rebuild((b) => b..failure.replace(failure));
          expect(intentFailureMessage(localizations, intent), entry.value);
        },
      );
    }
  }
}
