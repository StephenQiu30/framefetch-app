import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/auth/application/auth_session_controller.dart';
import 'package:framefetch/features/auth/data/native_auth_gateway.dart';
import 'package:framefetch/features/auth/data/refresh_credential_store.dart';
import 'package:framefetch/features/download/application/download_intake_controller.dart';
import 'package:framefetch/features/download/data/download_intake_repository.dart';
import 'package:framefetch/features/download/data/download_intent_repository.dart';
import 'package:framefetch/features/download/data/source_discovery_repository.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/auth_fakes.dart';
import '../../../support/intake_fakes.dart';

void main() {
  test(
    'restoring discovery and inspection performs only stored-resource reads',
    () async {
      final intake = FakeDownloadIntakeRepository();
      final intents = FakeDownloadIntentRepository(intake);
      final source = _SourceRepository();
      final container = ProviderContainer(
        overrides: [
          downloadIntakeRepositoryProvider.overrideWithValue(intake),
          downloadIntentRepositoryProvider.overrideWithValue(intents),
          sourceDiscoveryRepositoryProvider.overrideWithValue(source),
          nativeAuthGatewayProvider.overrideWithValue(FakeAuthGateway()),
          refreshCredentialStoreProvider.overrideWithValue(
            MemoryCredentialStore(),
          ),
        ],
      );
      addTearDown(container.dispose);
      final auth = container.read(authSessionProvider.notifier);
      await auth.restore();
      await auth.login(email: 'member@example.com', password: 'password');
      final controller = container.read(
        downloadIntakeControllerProvider.notifier,
      );
      await controller.resumeDiscovery('stored-discovery');
      expect(source.reads, ['stored-discovery']);
      expect(
        container.read(downloadIntakeControllerProvider).discovery,
        isNotNull,
      );
      await controller.resumeInspection('stored-inspection');
      expect(
        container.read(downloadIntakeControllerProvider).selectedFormatId,
        inspectionFixture().formats.first.id,
      );
      expect(intents.inputs, isEmpty);
      expect(intake.discoveryUrls, isEmpty);
      expect(intake.publicUrls, isEmpty);
    },
  );
}

final class _SourceRepository implements SourceDiscoveryRepository {
  final List<String> reads = [];
  @override
  Future<SourceDiscoveryResponse> get(String id) async {
    reads.add(id);
    return sourceDiscoveryFixture();
  }
}
