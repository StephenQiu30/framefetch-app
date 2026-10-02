import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/documents/application/document_bulk_delete.dart';

void main() {
  test(
    'bulk delete preserves failed documents and continues with the rest',
    () async {
      final ids = <String>[];
      final operation = DocumentBulkDelete(
        sessionGeneration: () => 0,
        delete: (id) async {
          ids.add(id);
          if (id == 'analysing') {
            throw const DataRequestFailure(
              DataRequestFailureKind.unknown,
              code: 'invalid_state',
              statusCode: 409,
            );
          }
        },
      );
      final result = await operation.run(['ready', 'analysing', 'other']);
      expect(ids, ['ready', 'analysing', 'other']);
      expect(result.completed, ['ready', 'other']);
      expect(result.errors.keys, ['analysing']);
    },
  );

  test(
    'account change stops remaining deletes and invalidates completion',
    () async {
      var generation = 0;
      final first = Completer<void>();
      final ids = <String>[];
      final operation = DocumentBulkDelete(
        sessionGeneration: () => generation,
        delete: (id) {
          ids.add(id);
          return first.future;
        },
      );
      final pending = operation.run(['one', 'two']);
      generation++;
      first.complete();
      final result = await pending;
      expect(ids, ['one']);
      expect(result.current, false);
      expect(result.completed, isEmpty);
    },
  );
}
