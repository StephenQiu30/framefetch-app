import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// Native screenshots stay outside the checkout. Set FRAMEFETCH_QA_OUTPUT to
/// retain them at a chosen absolute path; otherwise use the system temp folder.
Future<void> main() async {
  final output = Directory(
    Platform.environment['FRAMEFETCH_QA_OUTPUT'] ??
        '${Directory.systemTemp.path}/framefetch-native-visuals',
  );
  await output.create(recursive: true);
  await integrationDriver(
    responseDataCallback: (_) async {},
    onScreenshot: (name, bytes, [args]) async {
      final safeName = name.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '-');
      await File('${output.path}/$safeName.png').writeAsBytes(bytes);
      return true;
    },
  );
}
