import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../../tool/openapi/openapi_config.dart';
import '../../../tool/openapi/openapi_contract.dart';

void main() {
  test('freezes the 13 failure classes and safe execution evidence', () {
    final source =
        jsonDecode(
              File(
                'contracts/openapi/video-server.openapi.json',
              ).readAsStringSync(),
            )
            as Map<String, dynamic>;
    final schemas =
        (source['components'] as Map<String, dynamic>)['schemas']
            as Map<String, dynamic>;
    final classes = schemas['FailureClass'] as Map<String, dynamic>;
    expect(
      classes['enum'],
      unorderedEquals([
        'network_blocked',
        'challenge',
        'login_required',
        'identity_unavailable',
        'rate_limited',
        'content_unavailable',
        'content_protected',
        'extractor_broken',
        'format_unavailable',
        'transient',
        'runtime_unavailable',
        'invalid_input',
        'context_changed',
      ]),
    );
    final failure = schemas['IntentFailureResponse'] as Map<String, dynamic>;
    final properties = failure['properties'] as Map<String, dynamic>;
    expect(properties, contains('gate'));
    expect(properties, contains('evidence'));
    final evidence = properties['evidence'] as Map<String, dynamic>;
    final evidenceValues =
        evidence['additionalProperties'] as Map<String, dynamic>;
    expect(
      evidenceValues['oneOf'],
      unorderedEquals([
        {'type': 'string'},
        {'type': 'integer'},
        {'type': 'boolean'},
        {'type': 'null'},
      ]),
    );
    final gate = properties['gate'] as Map<String, dynamic>;
    expect(gate['enum'], ['①', '②', '③', 'none']);
    expect(gate['x-enum-varnames'], [
      'gateOne',
      'gateTwo',
      'gateThree',
      'none',
    ]);
    final stages = properties['stage'] as Map<String, dynamic>;
    expect(stages['enum'], contains('publish'));
    final codes = schemas['DownloadErrorCode'] as Map<String, dynamic>;
    expect(
      codes['enum'],
      containsAll(['identity_unavailable', 'rate_limited', 'context_changed']),
    );
  });

  test('retains business filters and all reviewed App operations', () {
    final decoded =
        jsonDecode(
              File(
                'contracts/openapi/video-server.openapi.json',
              ).readAsStringSync(),
            )
            as Map<String, dynamic>;

    final contract = buildAppOpenApi(decoded, appOpenApiConfig);
    final selectedPaths = contract['paths'] as Map<String, dynamic>;
    final selectedHistory =
        selectedPaths['/api/downloads/history'] as Map<String, dynamic>;
    final selectedGet = selectedHistory['get'] as Map<String, dynamic>;
    final selectedParameters = selectedGet['parameters'] as List<dynamic>;
    final selectedUsers =
        selectedPaths['/api/admin/users'] as Map<String, dynamic>;
    final selectedUserParameters =
        (selectedUsers['get'] as Map<String, dynamic>)['parameters']
            as List<dynamic>;

    expect(selectedPaths, hasLength(65));
    expect(
      selectedPaths.values.cast<Map<String, dynamic>>().fold<int>(
        0,
        (total, path) => total + path.length,
      ),
      77,
    );
    expect(selectedPaths['/api/users/me'], contains('patch'));
    expect(
      (selectedPaths['/api/users/me/avatar'] as Map<String, dynamic>).keys,
      containsAll(['get', 'put', 'delete']),
    );
    expect(selectedPaths['/api/admin/ai-providers'], contains('post'));
    expect(selectedPaths, isNot(contains('/api/admin/provider-runtime')));
    expect(
      selectedPaths['/api/admin/ai-providers/{provider_key}'],
      contains('delete'),
    );
    expect(selectedPaths, contains('/api/analyses/{analysis_id}/report.docx'));
    expect(selectedPaths, contains('/api/source-discoveries'));
    expect(selectedPaths, contains('/api/source-discoveries/{discovery_id}'));
    expect(selectedPaths, contains('/api/inspections'));
    expect(selectedPaths['/api/download-intents'], contains('post'));
    expect(selectedPaths['/api/download-intents'], contains('get'));
    expect(selectedPaths, contains('/api/download-intents/history'));
    expect(selectedPaths, contains('/api/download-intents/{intent_id}'));
    expect(
      selectedPaths,
      contains('/api/download-intents/{intent_id}/refresh'),
    );
    expect(selectedPaths, contains('/api/download-intents/{intent_id}/cancel'));
    expect(selectedPaths, contains('/api/inspections/{inspection_id}'));
    expect(selectedPaths, contains('/api/downloads'));
    expect(selectedPaths, contains('/api/downloads/{job_id}'));
    expect(selectedPaths['/api/downloads/{job_id}'], contains('delete'));
    expect(selectedPaths, contains('/api/downloads/{job_id}/download-url'));
    expect(selectedPaths, contains('/api/analysis-skills'));
    expect(selectedPaths, contains('/api/downloads/{download_id}/analyses'));
    expect(selectedPaths, contains('/api/downloads/{download_id}/analysis'));
    expect(selectedPaths, contains('/api/analyses/{analysis_id}'));
    expect(selectedPaths, contains('/api/media-imports'));
    expect(
      selectedPaths,
      contains('/api/media-imports/{resource_id}/upload-sessions'),
    );
    expect(
      selectedPaths,
      contains('/api/media-imports/{resource_id}/complete'),
    );
    expect(selectedPaths['/api/documents'], contains('post'));
    expect(selectedPaths['/api/documents/{document_id}'], contains('delete'));
    expect(selectedPaths['/api/documents/{document_id}'], contains('get'));
    expect(selectedPaths, contains('/api/documents/{document_id}/analyses'));
    expect(selectedPaths, contains('/api/documents/{document_id}/analysis'));
    expect(
      selectedPaths,
      contains('/api/documents/{document_id}/upload-sessions'),
    );
    expect(selectedPaths, contains('/api/documents/{document_id}/complete'));
    expect(selectedPaths, contains('/api/documents/{document_id}/cancel'));
    expect(
      selectedPaths['/api/analyses/{analysis_id}'],
      containsPair('get', isA<Map<String, dynamic>>()),
    );
    expect(
      selectedPaths['/api/analyses/{analysis_id}'],
      containsPair('delete', isA<Map<String, dynamic>>()),
    );
    expect(selectedPaths, contains('/api/admin/users'));
    expect(selectedPaths['/api/admin/users/{user_id}'], contains('delete'));
    expect(selectedPaths, contains('/api/admin/files/{category}/{file_id}'));
    expect(selectedPaths, contains('/api/admin/operation-logs'));
    expect(selectedPaths, contains('/api/admin/analyses/analytics'));
    expect(
      selectedPaths,
      contains('/api/admin/ai-providers/models/openrouter'),
    );
    expect(
      selectedPaths,
      contains('/api/admin/provider-runtime/engine-catalog'),
    );
    expect(selectedPaths, contains('/api/download-intents/history/records'));
    expect(
      selectedPaths,
      contains('/api/analyses/{analysis_id}/history-record'),
    );
    expect(selectedPaths, contains('/api/analyses/{analysis_id}/runs'));
    expect(selectedPaths, contains('/api/analyses/{analysis_id}/report.md'));
    expect(selectedPaths, contains('/api/media-imports/{resource_id}'));
    expect(selectedPaths, contains('/api/downloads/{job_id}/file'));
    expect(
      selectedPaths,
      contains('/api/app/v1/auth/registration-code/verify'),
    );
    expect(
      selectedParameters.map((value) {
        return (value as Map<String, dynamic>)['name'];
      }),
      ['page', 'page_size', 'status', 'search'],
    );
    expect(
      selectedUserParameters.map((value) {
        return (value as Map<String, dynamic>)['name'];
      }),
      ['page', 'page_size', 'search', 'role', 'is_active'],
    );
    final components = contract['components'] as Map<String, dynamic>;
    final schemas = components['schemas'] as Map<String, dynamic>;
    expect(schemas, contains('DownloadHistoryItemResponse'));
    expect(schemas, contains('DownloadResponse'));
    expect(schemas, contains('DocumentResponse'));
    expect(schemas, contains('ProviderStatusResponse'));
    expect(schemas, contains('DownloadUrlResponse'));
    expect(schemas, contains('InspectionRequest'));
    expect(schemas, contains('InspectionResponse'));
    expect(schemas, contains('SourceDiscoveryResponse'));
    expect(schemas, contains('DownloadRequest'));
    expect(schemas, contains('ManagedUserResponse'));
    expect(schemas, contains('AnalysisRequest'));
    expect(schemas, contains('AnalysisResponse'));
    expect(schemas, contains('AnalysisSkillResponse'));
    expect(schemas, contains('VideoAnalysisResultResponse'));
    expect(schemas, contains('VideoArticleResultResponse'));
    expect(schemas, contains('MediaImportRequest'));
    expect(schemas, contains('MediaUploadSessionResponse'));
    expect(schemas, contains('DocumentImportRequest'));
    expect(schemas, contains('DocumentDetailResponse'));
    expect(schemas, contains('DocumentParseSummaryResponse'));
    expect(schemas, contains('DocumentUploadSessionResponse'));
    expect(schemas, contains('AnalysisAnalyticsResponse'));
    expect(schemas, contains('OperationLogPageResponse'));
    expect(schemas, contains('AiModelListResponse'));
    expect(schemas, contains('EngineCatalogResponse'));
    expect(schemas, contains('HistoryRecordPageResponse'));
    expect(schemas, contains('AnalysisRunHistoryPageResponse'));
    expect(schemas, contains('RegistrationCodeVerificationRequest'));
    final errorResponse = schemas['ErrorResponse'] as Map<String, dynamic>;
    final errorProperties = errorResponse['properties'] as Map<String, dynamic>;
    expect(errorProperties['data'], {
      'type': 'string',
      'title': 'Data',
      'nullable': true,
    });
    final thumbnail =
        selectedPaths['/api/downloads/{job_id}/thumbnail']
            as Map<String, dynamic>;
    final thumbnailGet = thumbnail['get'] as Map<String, dynamic>;
    final thumbnailResponses =
        thumbnailGet['responses'] as Map<String, dynamic>;
    final thumbnailSuccess = thumbnailResponses['200'] as Map<String, dynamic>;
    final thumbnailContent =
        thumbnailSuccess['content'] as Map<String, dynamic>;
    final jpeg = thumbnailContent['image/jpeg'] as Map<String, dynamic>;
    expect(jpeg['schema'], {'type': 'string', 'format': 'binary'});
  });

  test('keeps native history and log filters typed and absent when unset', () {
    final source =
        jsonDecode(
              File(
                'contracts/openapi/video-server.openapi.json',
              ).readAsStringSync(),
            )
            as Map<String, dynamic>;
    final contract = buildAppOpenApi(source, appOpenApiConfig);
    final paths = contract['paths'] as Map<String, dynamic>;
    for (final path in [
      '/api/download-intents/history/records',
      '/api/admin/operation-logs',
    ]) {
      final operation =
          (paths[path] as Map<String, dynamic>)['get'] as Map<String, dynamic>;
      final parameters = operation['parameters'] as List<dynamic>;
      for (final value in parameters) {
        final parameter = value as Map<String, dynamic>;
        if (parameter['in'] != 'query' || parameter['required'] == true) {
          continue;
        }
        final schema = parameter['schema'] as Map<String, dynamic>;
        expect(
          schema,
          isNot(contains('anyOf')),
          reason: parameter['name'] as String,
        );
      }
    }
    final history =
        (paths['/api/download-intents/history/records']
                as Map<String, dynamic>)['get']
            as Map<String, dynamic>;
    final parameters = history['parameters'] as List<dynamic>;
    final recordTypes = parameters.cast<Map<String, dynamic>>().firstWhere(
      (parameter) => parameter['name'] == 'record_type',
    );
    expect(recordTypes['schema'], containsPair('type', 'array'));
  });

  test('freezes avatar and media streaming as binary responses', () {
    final source =
        jsonDecode(
              File(
                'contracts/openapi/video-server.openapi.json',
              ).readAsStringSync(),
            )
            as Map<String, dynamic>;
    final paths =
        buildAppOpenApi(source, appOpenApiConfig)['paths']
            as Map<String, dynamic>;
    for (final path in [
      '/api/users/me/avatar',
      '/api/downloads/{job_id}/file',
      '/api/analyses/{analysis_id}/report.md',
    ]) {
      final operation =
          (paths[path] as Map<String, dynamic>)['get'] as Map<String, dynamic>;
      final responses = operation['responses'] as Map<String, dynamic>;
      final success = responses['200'] as Map<String, dynamic>;
      final content = success['content'] as Map<String, dynamic>;
      expect(content, isNotEmpty);
      for (final media in content.values.cast<Map<String, dynamic>>()) {
        expect(media['schema'], {'type': 'string', 'format': 'binary'});
      }
      expect(operation['security'], [
        {'NativeBearerAuth': <String>[]},
      ]);
    }
  });
}
