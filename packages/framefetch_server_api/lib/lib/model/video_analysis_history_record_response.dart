//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:framefetch_server_api/lib/model/analysis_result_contract.dart';
import 'package:framefetch_server_api/lib/model/analysis_stage.dart';
import 'package:built_collection/built_collection.dart';
import 'package:framefetch_server_api/lib/model/analysis_status.dart';
import 'package:framefetch_server_api/lib/model/history_availability.dart';
import 'package:framefetch_server_api/lib/model/analysis_error_code.dart';
import 'package:framefetch_server_api/lib/model/history_status_group.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_analysis_history_record_response.g.dart';

/// VideoAnalysisHistoryRecordResponse
///
/// Properties:
/// * [updatedAt]
/// * [statusGroup]
/// * [sourceAvailability]
/// * [resultAvailability]
/// * [recordType]
/// * [documentId]
/// * [artifactId]
/// * [outputLanguage]
/// * [resultContract]
/// * [currentRunNo]
/// * [cancelRequestedAt]
/// * [version]
/// * [allowedActions]
/// * [actionUnavailableReason]
/// * [id]
/// * [downloadId]
/// * [title]
/// * [skillId]
/// * [createdAt]
/// * [status]
/// * [progress]
/// * [stage]
/// * [errorCode]
@BuiltValue()
abstract class VideoAnalysisHistoryRecordResponse
    implements
        Built<VideoAnalysisHistoryRecordResponse,
            VideoAnalysisHistoryRecordResponseBuilder> {
  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'status_group')
  HistoryStatusGroup get statusGroup;
  // enum statusGroupEnum {  processing,  completed,  failed,  cancelled,  expired,  };

  @BuiltValueField(wireName: r'source_availability')
  HistoryAvailability get sourceAvailability;
  // enum sourceAvailabilityEnum {  available,  unavailable,  unknown,  not_applicable,  };

  @BuiltValueField(wireName: r'result_availability')
  HistoryAvailability get resultAvailability;
  // enum resultAvailabilityEnum {  available,  unavailable,  unknown,  not_applicable,  };

  @BuiltValueField(wireName: r'record_type')
  VideoAnalysisHistoryRecordResponseRecordTypeEnum get recordType;
  // enum recordTypeEnum {  video_analysis,  };

  @BuiltValueField(wireName: r'document_id')
  String? get documentId;

  @BuiltValueField(wireName: r'artifact_id')
  String? get artifactId;

  @BuiltValueField(wireName: r'output_language')
  String get outputLanguage;

  @BuiltValueField(wireName: r'result_contract')
  AnalysisResultContract get resultContract;
  // enum resultContractEnum {  video-visual-analysis,  video-article,  screenplay-analysis,  screenplay-rewrite,  structured-report,  content-document,  skill-report,  };

  @BuiltValueField(wireName: r'current_run_no')
  int get currentRunNo;

  @BuiltValueField(wireName: r'cancel_requested_at')
  DateTime? get cancelRequestedAt;

  @BuiltValueField(wireName: r'version')
  int get version;

  @BuiltValueField(wireName: r'allowed_actions')
  BuiltList<VideoAnalysisHistoryRecordResponseAllowedActionsEnum>
      get allowedActions;
  // enum allowedActionsEnum {  view,  retry,  cancel,  delete,  };

  @BuiltValueField(wireName: r'action_unavailable_reason')
  String? get actionUnavailableReason;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'download_id')
  String? get downloadId;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'skill_id')
  String get skillId;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'status')
  AnalysisStatus get status;
  // enum statusEnum {  queued,  running,  retry_wait,  succeeded,  failed,  cancelled,  };

  @BuiltValueField(wireName: r'progress')
  int get progress;

  @BuiltValueField(wireName: r'stage')
  AnalysisStage? get stage;
  // enum stageEnum {  preparing,  analyzing,  drafting,  reviewing,  revising,  validating,  publishing,  };

  @BuiltValueField(wireName: r'error_code')
  AnalysisErrorCode? get errorCode;
  // enum errorCodeEnum {  cancelled,  analysis_cli_unavailable,  analysis_cli_unsupported,  analysis_cli_not_authenticated,  analysis_sandbox_unavailable,  analysis_media_invalid,  analysis_provider_rate_limited,  analysis_provider_usage_limited,  analysis_cli_timeout,  analysis_cli_failed,  invalid_model_output,  analysis_resource_limit,  input_artifact_unavailable,  analysis_input_expired,  screenplay_output_incomplete,  analysis_report_unavailable,  internal_error,  worker_lost,  analysis_outcome_unknown,  analysis_needs_material,  analysis_configuration_changed,  };

  VideoAnalysisHistoryRecordResponse._();

  factory VideoAnalysisHistoryRecordResponse(
          [void updates(VideoAnalysisHistoryRecordResponseBuilder b)]) =
      _$VideoAnalysisHistoryRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VideoAnalysisHistoryRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VideoAnalysisHistoryRecordResponse> get serializer =>
      _$VideoAnalysisHistoryRecordResponseSerializer();
}

class _$VideoAnalysisHistoryRecordResponseSerializer
    implements PrimitiveSerializer<VideoAnalysisHistoryRecordResponse> {
  @override
  final Iterable<Type> types = const [
    VideoAnalysisHistoryRecordResponse,
    _$VideoAnalysisHistoryRecordResponse
  ];

  @override
  final String wireName = r'VideoAnalysisHistoryRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VideoAnalysisHistoryRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'status_group';
    yield serializers.serialize(
      object.statusGroup,
      specifiedType: const FullType(HistoryStatusGroup),
    );
    yield r'source_availability';
    yield serializers.serialize(
      object.sourceAvailability,
      specifiedType: const FullType(HistoryAvailability),
    );
    yield r'result_availability';
    yield serializers.serialize(
      object.resultAvailability,
      specifiedType: const FullType(HistoryAvailability),
    );
    yield r'record_type';
    yield serializers.serialize(
      object.recordType,
      specifiedType:
          const FullType(VideoAnalysisHistoryRecordResponseRecordTypeEnum),
    );
    yield r'document_id';
    yield object.documentId == null
        ? null
        : serializers.serialize(
            object.documentId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'artifact_id';
    yield object.artifactId == null
        ? null
        : serializers.serialize(
            object.artifactId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'output_language';
    yield serializers.serialize(
      object.outputLanguage,
      specifiedType: const FullType(String),
    );
    yield r'result_contract';
    yield serializers.serialize(
      object.resultContract,
      specifiedType: const FullType(AnalysisResultContract),
    );
    yield r'current_run_no';
    yield serializers.serialize(
      object.currentRunNo,
      specifiedType: const FullType(int),
    );
    yield r'cancel_requested_at';
    yield object.cancelRequestedAt == null
        ? null
        : serializers.serialize(
            object.cancelRequestedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(int),
    );
    yield r'allowed_actions';
    yield serializers.serialize(
      object.allowedActions,
      specifiedType: const FullType(BuiltList,
          [FullType(VideoAnalysisHistoryRecordResponseAllowedActionsEnum)]),
    );
    yield r'action_unavailable_reason';
    yield object.actionUnavailableReason == null
        ? null
        : serializers.serialize(
            object.actionUnavailableReason,
            specifiedType: const FullType.nullable(String),
          );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'download_id';
    yield object.downloadId == null
        ? null
        : serializers.serialize(
            object.downloadId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'skill_id';
    yield serializers.serialize(
      object.skillId,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(AnalysisStatus),
    );
    yield r'progress';
    yield serializers.serialize(
      object.progress,
      specifiedType: const FullType(int),
    );
    yield r'stage';
    yield object.stage == null
        ? null
        : serializers.serialize(
            object.stage,
            specifiedType: const FullType.nullable(AnalysisStage),
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
    VideoAnalysisHistoryRecordResponse object, {
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
    required VideoAnalysisHistoryRecordResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'status_group':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HistoryStatusGroup),
          ) as HistoryStatusGroup;
          result.statusGroup = valueDes;
          break;
        case r'source_availability':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HistoryAvailability),
          ) as HistoryAvailability;
          result.sourceAvailability = valueDes;
          break;
        case r'result_availability':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HistoryAvailability),
          ) as HistoryAvailability;
          result.resultAvailability = valueDes;
          break;
        case r'record_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                VideoAnalysisHistoryRecordResponseRecordTypeEnum),
          ) as VideoAnalysisHistoryRecordResponseRecordTypeEnum;
          result.recordType = valueDes;
          break;
        case r'document_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.documentId = valueDes;
          break;
        case r'artifact_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.artifactId = valueDes;
          break;
        case r'output_language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.outputLanguage = valueDes;
          break;
        case r'result_contract':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisResultContract),
          ) as AnalysisResultContract;
          result.resultContract = valueDes;
          break;
        case r'current_run_no':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.currentRunNo = valueDes;
          break;
        case r'cancel_requested_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.cancelRequestedAt = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.version = valueDes;
          break;
        case r'allowed_actions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [
              FullType(VideoAnalysisHistoryRecordResponseAllowedActionsEnum)
            ]),
          ) as BuiltList<VideoAnalysisHistoryRecordResponseAllowedActionsEnum>;
          result.allowedActions.replace(valueDes);
          break;
        case r'action_unavailable_reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actionUnavailableReason = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'download_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.downloadId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'skill_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.skillId = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisStatus),
          ) as AnalysisStatus;
          result.status = valueDes;
          break;
        case r'progress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.progress = valueDes;
          break;
        case r'stage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AnalysisStage),
          ) as AnalysisStage?;
          if (valueDes == null) continue;
          result.stage = valueDes;
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
  VideoAnalysisHistoryRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VideoAnalysisHistoryRecordResponseBuilder();
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

class VideoAnalysisHistoryRecordResponseRecordTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'video_analysis')
  static const VideoAnalysisHistoryRecordResponseRecordTypeEnum videoAnalysis =
      _$videoAnalysisHistoryRecordResponseRecordTypeEnum_videoAnalysis;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const VideoAnalysisHistoryRecordResponseRecordTypeEnum
      unknownDefaultOpenApi =
      _$videoAnalysisHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;

  static Serializer<VideoAnalysisHistoryRecordResponseRecordTypeEnum>
      get serializer =>
          _$videoAnalysisHistoryRecordResponseRecordTypeEnumSerializer;

  const VideoAnalysisHistoryRecordResponseRecordTypeEnum._(String name)
      : super(name);

  static BuiltSet<VideoAnalysisHistoryRecordResponseRecordTypeEnum>
      get values => _$videoAnalysisHistoryRecordResponseRecordTypeEnumValues;
  static VideoAnalysisHistoryRecordResponseRecordTypeEnum valueOf(
          String name) =>
      _$videoAnalysisHistoryRecordResponseRecordTypeEnumValueOf(name);
}

class VideoAnalysisHistoryRecordResponseAllowedActionsEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'view')
  static const VideoAnalysisHistoryRecordResponseAllowedActionsEnum view =
      _$videoAnalysisHistoryRecordResponseAllowedActionsEnum_view;
  @BuiltValueEnumConst(wireName: r'retry')
  static const VideoAnalysisHistoryRecordResponseAllowedActionsEnum retry =
      _$videoAnalysisHistoryRecordResponseAllowedActionsEnum_retry;
  @BuiltValueEnumConst(wireName: r'cancel')
  static const VideoAnalysisHistoryRecordResponseAllowedActionsEnum cancel =
      _$videoAnalysisHistoryRecordResponseAllowedActionsEnum_cancel;
  @BuiltValueEnumConst(wireName: r'delete')
  static const VideoAnalysisHistoryRecordResponseAllowedActionsEnum delete =
      _$videoAnalysisHistoryRecordResponseAllowedActionsEnum_delete;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const VideoAnalysisHistoryRecordResponseAllowedActionsEnum
      unknownDefaultOpenApi =
      _$videoAnalysisHistoryRecordResponseAllowedActionsEnum_unknownDefaultOpenApi;

  static Serializer<VideoAnalysisHistoryRecordResponseAllowedActionsEnum>
      get serializer =>
          _$videoAnalysisHistoryRecordResponseAllowedActionsEnumSerializer;

  const VideoAnalysisHistoryRecordResponseAllowedActionsEnum._(String name)
      : super(name);

  static BuiltSet<VideoAnalysisHistoryRecordResponseAllowedActionsEnum>
      get values =>
          _$videoAnalysisHistoryRecordResponseAllowedActionsEnumValues;
  static VideoAnalysisHistoryRecordResponseAllowedActionsEnum valueOf(
          String name) =>
      _$videoAnalysisHistoryRecordResponseAllowedActionsEnumValueOf(name);
}
