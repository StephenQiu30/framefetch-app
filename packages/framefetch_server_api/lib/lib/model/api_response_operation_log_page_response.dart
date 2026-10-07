//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:framefetch_server_api/lib/model/error_code.dart';
import 'package:framefetch_server_api/lib/model/operation_log_page_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_response_operation_log_page_response.g.dart';

/// ApiResponseOperationLogPageResponse
///
/// Properties:
/// * [code] - 稳定的业务结果码。
/// * [message] - 安全的结果说明。
/// * [data] - 成功时为业务数据，错误时为 null。
@BuiltValue()
abstract class ApiResponseOperationLogPageResponse
    implements
        Built<ApiResponseOperationLogPageResponse,
            ApiResponseOperationLogPageResponseBuilder> {
  /// 稳定的业务结果码。
  @BuiltValueField(wireName: r'code')
  ErrorCode get code;
  // enum codeEnum {  network_blocked,  challenge,  login_required,  identity_unavailable,  context_changed,  content_unavailable,  content_protected,  extractor_broken,  transient,  invalid_input,  runtime_unavailable,  active_ai_provider_delete,  active_task_quota_exceeded,  admin_bootstrap_required,  ai_model_catalog_unavailable,  ai_provider_conflict,  ai_provider_not_found,  analysis_already_active,  analysis_artifact_unavailable,  analysis_budget_exceeded,  analysis_report_not_ready,  analysis_report_unavailable,  analysis_retry_limited,  analysis_skill_outdated,  analysis_unavailable,  article_access_restricted,  article_discovery_failed,  artifact_not_ready,  daily_byte_quota_exceeded,  daily_task_quota_exceeded,  download_not_ready,  duration_limit_exceeded,  email_already_registered,  email_send_failed,  email_unavailable,  forbidden,  format_unavailable,  http_error,  idempotency_conflict,  import_disabled,  import_size_mismatch,  import_storage_unavailable,  internal_error,  invalid_ai_provider_profile,  invalid_credentials,  invalid_model_output,  invalid_provider_catalog_entry,  invalid_request,  invalid_state,  invalid_url,  invalid_username,  invalid_verification_code,  last_admin_change,  job_conflict,  method_not_allowed,  metrics_unavailable,  not_found,  ok,  provider_catalog_conflict,  provider_catalog_not_found,  provider_failure,  rate_limited,  rate_limiter_unavailable,  refresh_in_progress,  request_timeout,  request_too_large,  reserved_ai_provider_mutation,  resource_expired,  self_admin_change,  service_unavailable,  storage_quota_exceeded,  storage_file_in_use,  storage_unavailable,  unauthenticated,  upload_incomplete,  upload_session_expired,  user_not_found,  username_already_registered,  verification_rate_limited,  };

  /// 安全的结果说明。
  @BuiltValueField(wireName: r'message')
  String get message;

  /// 成功时为业务数据，错误时为 null。
  @BuiltValueField(wireName: r'data')
  OperationLogPageResponse get data;

  ApiResponseOperationLogPageResponse._();

  factory ApiResponseOperationLogPageResponse(
          [void updates(ApiResponseOperationLogPageResponseBuilder b)]) =
      _$ApiResponseOperationLogPageResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiResponseOperationLogPageResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiResponseOperationLogPageResponse> get serializer =>
      _$ApiResponseOperationLogPageResponseSerializer();
}

class _$ApiResponseOperationLogPageResponseSerializer
    implements PrimitiveSerializer<ApiResponseOperationLogPageResponse> {
  @override
  final Iterable<Type> types = const [
    ApiResponseOperationLogPageResponse,
    _$ApiResponseOperationLogPageResponse
  ];

  @override
  final String wireName = r'ApiResponseOperationLogPageResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiResponseOperationLogPageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(ErrorCode),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(OperationLogPageResponse),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiResponseOperationLogPageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiResponseOperationLogPageResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ErrorCode),
          ) as ErrorCode;
          result.code = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(OperationLogPageResponse),
          ) as OperationLogPageResponse;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiResponseOperationLogPageResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiResponseOperationLogPageResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
