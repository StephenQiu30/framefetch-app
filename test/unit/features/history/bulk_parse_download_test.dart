import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/history/application/bulk_parse_download.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/intake_fakes.dart';

void main() {
  test('validates expiry and access for every selected record', () async {
    final creates = <String>[];
    final operation = BulkParseDownload(
      sessionGeneration: () => 0,
      inspect: (id) async => id == 'expired'
          ? inspectionFixture().rebuild(
              (b) => b..expiresAt = DateTime.utc(2020),
            )
          : id == 'blocked'
          ? inspectionFixture().rebuild(
              (b) => b..accessDecision = AccessDecision.blocked,
            )
          : inspectionFixture(),
      create:
          ({
            required formatId,
            required idempotencyKey,
            required inspectionId,
          }) async {
            creates.add(formatId);
            return intakeDownloadFixture();
          },
    );
    final result = await operation.run([
      _record('good'),
      _record('expired'),
      _record('blocked'),
    ]);
    expect(result.completed, ['good']);
    expect(result.errors.keys, ['expired', 'blocked']);
    expect(creates, [inspectionFixture().formats.first.id]);
  });

  test(
    'response-unknown retries reuse the same operation idempotency key',
    () async {
      final keys = <String>[];
      final operation = BulkParseDownload(
        sessionGeneration: () => 0,
        inspect: (_) async => inspectionFixture(),
        newKey: () => 'stable-key',
        create:
            ({
              required formatId,
              required idempotencyKey,
              required inspectionId,
            }) async {
              keys.add(idempotencyKey);
              if (keys.length == 1) throw StateError('response unknown');
              return intakeDownloadFixture();
            },
      );
      expect((await operation.run([_record('one')])).errors, hasLength(1));
      expect((await operation.run([_record('one')])).completed, ['one']);
      expect(keys, ['stable-key', 'stable-key']);
    },
  );

  test(
    'account change during inspection prevents creation and progress',
    () async {
      var generation = 0;
      var creates = 0;
      final pending = Completer<InspectionResponse>();
      final progress = <int>[];
      final operation = BulkParseDownload(
        sessionGeneration: () => generation,
        inspect: (_) => pending.future,
        create:
            ({
              required formatId,
              required idempotencyKey,
              required inspectionId,
            }) async {
              creates++;
              return intakeDownloadFixture();
            },
      );
      final task = operation.run([
        _record('one'),
      ], onProgress: (done, _) => progress.add(done));
      generation++;
      pending.complete(inspectionFixture());
      final result = await task;
      expect(result.current, false);
      expect(creates, 0);
      expect(progress, isEmpty);
    },
  );
}

ParseHistoryRecordResponse _record(String id) => ParseHistoryRecordResponse(
  (b) => b
    ..id = id
    ..inspectionId = id
    ..title = id
    ..version = 1
    ..status = IntentStatus.ready
    ..statusGroup = HistoryStatusGroup.completed
    ..sourceAvailability = HistoryAvailability.available
    ..resultAvailability = HistoryAvailability.available
    ..createdAt = DateTime.utc(2026)
    ..updatedAt = DateTime.utc(2026)
    ..deadline = DateTime.utc(2100)
    ..recordType = ParseHistoryRecordResponseRecordTypeEnum.parse,
);
