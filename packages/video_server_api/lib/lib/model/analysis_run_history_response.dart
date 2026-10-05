//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/analysis_error_code.dart';
import 'package:video_server_api/lib/model/analysis_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_run_history_response.g.dart';

/// AnalysisRunHistoryResponse
///
/// Properties:
/// * [id]
/// * [runNo]
/// * [trigger]
/// * [status]
/// * [createdAt]
/// * [startedAt]
/// * [finishedAt]
/// * [errorCode]
@BuiltValue()
abstract class AnalysisRunHistoryResponse
    implements
        Built<AnalysisRunHistoryResponse, AnalysisRunHistoryResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'run_no')
  int get runNo;

  @BuiltValueField(wireName: r'trigger')
  String get trigger;

  @BuiltValueField(wireName: r'status')
  AnalysisStatus get status;
  // enum statusEnum {  queued,  running,  retry_wait,  succeeded,  failed,  cancelled,  };

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'started_at')
  DateTime? get startedAt;

  @BuiltValueField(wireName: r'finished_at')
  DateTime? get finishedAt;

  @BuiltValueField(wireName: r'error_code')
  AnalysisErrorCode? get errorCode;
  // enum errorCodeEnum {  cancelled,  analysis_cli_unavailable,  analysis_cli_unsupported,  analysis_cli_not_authenticated,  analysis_sandbox_unavailable,  analysis_media_invalid,  analysis_provider_rate_limited,  analysis_provider_usage_limited,  analysis_cli_timeout,  analysis_cli_failed,  invalid_model_output,  analysis_resource_limit,  input_artifact_unavailable,  analysis_input_expired,  screenplay_output_incomplete,  analysis_report_unavailable,  internal_error,  worker_lost,  analysis_outcome_unknown,  analysis_needs_material,  analysis_configuration_changed,  };

  AnalysisRunHistoryResponse._();

  factory AnalysisRunHistoryResponse(
          [void updates(AnalysisRunHistoryResponseBuilder b)]) =
      _$AnalysisRunHistoryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisRunHistoryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisRunHistoryResponse> get serializer =>
      _$AnalysisRunHistoryResponseSerializer();
}

class _$AnalysisRunHistoryResponseSerializer
    implements PrimitiveSerializer<AnalysisRunHistoryResponse> {
  @override
  final Iterable<Type> types = const [
    AnalysisRunHistoryResponse,
    _$AnalysisRunHistoryResponse
  ];

  @override
  final String wireName = r'AnalysisRunHistoryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisRunHistoryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'run_no';
    yield serializers.serialize(
      object.runNo,
      specifiedType: const FullType(int),
    );
    yield r'trigger';
    yield serializers.serialize(
      object.trigger,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(AnalysisStatus),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'started_at';
    yield object.startedAt == null
        ? null
        : serializers.serialize(
            object.startedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'finished_at';
    yield object.finishedAt == null
        ? null
        : serializers.serialize(
            object.finishedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'error_code';
    yield object.errorCode == null
        ? null
        : serializers.serialize(
            object.errorCode,
            specifiedType: const FullType.nullable(AnalysisErrorCode),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisRunHistoryResponse object, {
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
    required AnalysisRunHistoryResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'run_no':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.runNo = valueDes;
          break;
        case r'trigger':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.trigger = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisStatus),
          ) as AnalysisStatus;
          result.status = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'started_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startedAt = valueDes;
          break;
        case r'finished_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.finishedAt = valueDes;
          break;
        case r'error_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AnalysisErrorCode),
          ) as AnalysisErrorCode?;
          if (valueDes == null) continue;
          result.errorCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisRunHistoryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisRunHistoryResponseBuilder();
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
