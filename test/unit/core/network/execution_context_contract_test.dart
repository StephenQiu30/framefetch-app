import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

void main() {
  const context = <String, Object?>{
    'provider_key': 'tiktok',
    'registry_revision': 'registry-fixture',
    'resolved_layer': 'L3',
    'client': 'browser:fixture',
    'engine_revision': 'engine-fixture',
    'egress_route': 'global_residential',
    'egress_revision': 'egress-fixture',
    'egress_class': 'residential',
    'egress_observed_ip': '203.0.113.7',
    'identity_used': false,
    'identity_digest': null,
    'browser_context_kind': 'anonymous',
  };

  group('P1 generated execution context', () {
    test('deserializes all twelve non-secret fields', () {
      final value = standardSerializers.deserializeWith(
        ExecutionContext.serializer,
        context,
      )!;
      expect(value.providerKey, 'tiktok');
      expect(value.registryRevision, 'registry-fixture');
      expect(value.resolvedLayer, 'L3');
      expect(value.client, 'browser:fixture');
      expect(value.engineRevision, 'engine-fixture');
      expect(value.egressRoute, 'global_residential');
      expect(value.egressRevision, 'egress-fixture');
      expect(value.egressClass, 'residential');
      expect(value.egressObservedIp, '203.0.113.7');
      expect(value.identityUsed, isFalse);
      expect(value.identityDigest, isNull);
      expect(value.browserContextKind, 'anonymous');
    });

    test('reads actual context from a download response', () {
      final value = standardSerializers
          .deserializeWith(DownloadResponse.serializer, {
            'id': '00000000-0000-0000-0000-000000000001',
            'inspection_id': null,
            'format_id': null,
            'source_kind': 'remote_provider',
            'source_label': 'fixture',
            'status': 'succeeded',
            'stage': null,
            'progress': 100,
            'attempt': 1,
            'version': 1,
            'error_code': null,
            'error_message': null,
            'created_at': '2026-10-01T00:00:00Z',
            'updated_at': '2026-10-01T00:00:00Z',
            'finished_at': '2026-10-01T00:00:00Z',
            'file_available': true,
            'title': 'fixture',
            'extractor_key': 'TikTok',
            'duration_seconds': 30,
            'media_kind': 'video',
            'asset_count': 0,
            'thumbnail_url': null,
            'format': null,
            'execution_context': context,
          })!;
      expect(value.executionContext?.resolvedLayer, 'L3');
      expect(value.executionContext?.client, 'browser:fixture');
    });
  });
}
