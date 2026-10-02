final class OpenApiOperationSelection {
  const OpenApiOperationSelection({
    required this.method,
    required this.path,
    this.queryParameters,
  });

  final String method;
  final String path;
  final Set<String>? queryParameters;
}

final class AppOpenApiConfig {
  const AppOpenApiConfig({
    required this.defaultSchemaUrl,
    required this.generatorVersion,
    required this.operations,
  });

  final String defaultSchemaUrl;
  final String generatorVersion;
  final List<OpenApiOperationSelection> operations;
}

const appOpenApiConfig = AppOpenApiConfig(
  defaultSchemaUrl: 'http://127.0.0.1:8111/openapi.json',
  generatorVersion: '7.22.0',
  operations: [
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/analyses/{analysis_id}/report.docx',
    ),
    OpenApiOperationSelection(method: 'patch', path: '/api/users/me'),
    OpenApiOperationSelection(method: 'get', path: '/api/users/me/avatar'),
    OpenApiOperationSelection(method: 'put', path: '/api/users/me/avatar'),
    OpenApiOperationSelection(method: 'delete', path: '/api/users/me/avatar'),
    OpenApiOperationSelection(method: 'post', path: '/api/admin/providers'),
    OpenApiOperationSelection(
      method: 'delete',
      path: '/api/admin/providers/{provider_key}',
    ),
    OpenApiOperationSelection(method: 'post', path: '/api/admin/ai-providers'),
    OpenApiOperationSelection(
      method: 'patch',
      path: '/api/admin/ai-providers/{provider_key}',
    ),
    OpenApiOperationSelection(
      method: 'delete',
      path: '/api/admin/ai-providers/{provider_key}',
    ),

    OpenApiOperationSelection(
      method: 'post',
      path: '/api/app/v1/auth/register',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/app/v1/auth/registration-code',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/app/v1/auth/registration-code/verify',
    ),
    OpenApiOperationSelection(method: 'post', path: '/api/app/v1/auth/login'),
    OpenApiOperationSelection(method: 'get', path: '/api/app/v1/auth/me'),
    OpenApiOperationSelection(method: 'post', path: '/api/app/v1/auth/refresh'),
    OpenApiOperationSelection(method: 'post', path: '/api/app/v1/auth/logout'),
    OpenApiOperationSelection(method: 'post', path: '/api/source-discoveries'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/source-discoveries/{discovery_id}',
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/download-intents'),
    OpenApiOperationSelection(method: 'post', path: '/api/download-intents'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/download-intents/history',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/download-intents/history/records',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/download-intents/{intent_id}',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/download-intents/{intent_id}/refresh',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/download-intents/{intent_id}/cancel',
    ),
    OpenApiOperationSelection(method: 'post', path: '/api/inspections'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/inspections/{inspection_id}',
    ),
    OpenApiOperationSelection(method: 'post', path: '/api/downloads'),
    OpenApiOperationSelection(method: 'get', path: '/api/downloads/history'),
    OpenApiOperationSelection(method: 'get', path: '/api/downloads/{job_id}'),
    OpenApiOperationSelection(
      method: 'delete',
      path: '/api/downloads/{job_id}',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/downloads/{job_id}/thumbnail',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/inspections/{inspection_id}/thumbnail',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/downloads/{job_id}/download-url',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/downloads/{job_id}/file',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/downloads/{job_id}/cancel',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/downloads/{job_id}/retry',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/analysis-skills',
      queryParameters: {'input_kind'},
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/downloads/{download_id}/analyses',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/downloads/{download_id}/analysis',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/analyses/{analysis_id}',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/analyses/{analysis_id}/history-record',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/analyses/{analysis_id}/runs',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/analyses/{analysis_id}/report.md',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/analyses/{analysis_id}/cancel',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/analyses/{analysis_id}/retry',
    ),
    OpenApiOperationSelection(
      method: 'delete',
      path: '/api/analyses/{analysis_id}',
    ),
    OpenApiOperationSelection(method: 'post', path: '/api/media-imports'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/media-imports/{resource_id}',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/media-imports/{resource_id}/upload-sessions',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/media-imports/{resource_id}/complete',
    ),
    OpenApiOperationSelection(method: 'post', path: '/api/documents'),
    OpenApiOperationSelection(method: 'get', path: '/api/documents'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/documents/{document_id}',
    ),
    OpenApiOperationSelection(
      method: 'delete',
      path: '/api/documents/{document_id}',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/documents/{document_id}/analyses',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/documents/{document_id}/analysis',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/documents/{document_id}/upload-sessions',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/documents/{document_id}/complete',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/documents/{document_id}/cancel',
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/providers'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/admin/downloads/analytics',
      queryParameters: {'days'},
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/admin/analyses/analytics',
      queryParameters: {'days'},
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/admin/operation-logs'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/admin/provider-runtime/engine-catalog',
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/admin/files'),
    OpenApiOperationSelection(
      method: 'delete',
      path: '/api/admin/files/{category}/{file_id}',
    ),
    OpenApiOperationSelection(method: 'post', path: '/api/admin/files/cleanup'),
    OpenApiOperationSelection(method: 'get', path: '/api/admin/users'),
    OpenApiOperationSelection(
      method: 'patch',
      path: '/api/admin/users/{user_id}',
    ),
    OpenApiOperationSelection(
      method: 'delete',
      path: '/api/admin/users/{user_id}',
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/admin/providers'),
    OpenApiOperationSelection(
      method: 'patch',
      path: '/api/admin/providers/{provider_key}',
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/admin/ai-providers'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/admin/ai-providers/models/openrouter',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/admin/ai-providers/{provider_key}/activate',
    ),
  ],
);
