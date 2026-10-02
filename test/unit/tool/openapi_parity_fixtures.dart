const fixtureId = '00000000-0000-0000-0000-000000000001';
const fixtureDate = '2026-10-02T00:00:00Z';

Map<String, Object?> envelope(Object data) => {
  'code': 'ok',
  'message': 'ok',
  'data': data,
};

const userResponse = {
  'id': fixtureId,
  'username': 'fixture',
  'email': 'fixture@example.com',
  'role': 'user',
  'created_at': fixtureDate,
  'updated_at': fixtureDate,
  'avatar_version': fixtureId,
};

const commonRecord = {
  'id': fixtureId,
  'title': 'fixture',
  'version': 1,
  'created_at': fixtureDate,
  'updated_at': fixtureDate,
  'status_group': 'completed',
  'source_availability': 'available',
  'result_availability': 'available',
};

const analysisRecord = {
  ...commonRecord,
  'status': 'succeeded',
  'document_id': null,
  'artifact_id': null,
  'output_language': 'zh-CN',
  'result_contract': 'video-visual-analysis',
  'current_run_no': 1,
  'cancel_requested_at': null,
  'allowed_actions': ['view', 'delete'],
  'action_unavailable_reason': null,
  'download_id': fixtureId,
  'skill_id': 'video-visual-analysis',
  'progress': 100,
  'stage': null,
  'error_code': null,
};

final historyRecords = <Map<String, Object?>>[
  {
    ...commonRecord,
    'record_type': 'parse',
    'status': 'ready',
    'reason_code': null,
    'failure': null,
    'next_action': 'none',
    'deadline': fixtureDate,
    'inspection_id': fixtureId,
    'job_id': null,
  },
  {
    ...commonRecord,
    'record_type': 'document_parse',
    'document_id': fixtureId,
    'status': 'available',
    'source_format': 'txt',
    'error_code': null,
  },
  {...analysisRecord, 'record_type': 'video_analysis'},
  {
    ...analysisRecord,
    'record_type': 'screenplay_analysis',
    'result_contract': 'screenplay-analysis',
    'document_id': fixtureId,
    'download_id': null,
  },
];
