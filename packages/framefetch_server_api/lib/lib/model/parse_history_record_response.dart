//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:framefetch_server_api/lib/model/intent_status.dart';
import 'package:built_collection/built_collection.dart';
import 'package:framefetch_server_api/lib/model/intent_failure_response.dart';
import 'package:framefetch_server_api/lib/model/history_availability.dart';
import 'package:framefetch_server_api/lib/model/history_status_group.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'parse_history_record_response.g.dart';

/// ParseHistoryRecordResponse
///
/// Properties:
/// * [updatedAt]
/// * [statusGroup]
/// * [sourceAvailability]
/// * [resultAvailability]
/// * [id]
/// * [version]
/// * [status]
/// * [reasonCode]
/// * [failure]
/// * [nextAction]
/// * [deadline]
/// * [inspectionId]
/// * [jobId]
/// * [createdAt]
/// * [title]
/// * [recordType]
@BuiltValue()
abstract class ParseHistoryRecordResponse
    implements
        Built<ParseHistoryRecordResponse, ParseHistoryRecordResponseBuilder> {
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

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'version')
  int get version;

  @BuiltValueField(wireName: r'status')
  IntentStatus get status;
  // enum statusEnum {  queued,  resolving,  ready,  handed_off,  cancelling,  cancelled,  expired,  failed,  };

  @BuiltValueField(wireName: r'reason_code')
  String? get reasonCode;

  @BuiltValueField(wireName: r'failure')
  IntentFailureResponse? get failure;

  @BuiltValueField(wireName: r'next_action')
  ParseHistoryRecordResponseNextActionEnum? get nextAction;
  // enum nextActionEnum {  none,  wait,  refresh_result,  import_file,  };

  @BuiltValueField(wireName: r'deadline')
  DateTime get deadline;

  @BuiltValueField(wireName: r'inspection_id')
  String? get inspectionId;

  @BuiltValueField(wireName: r'job_id')
  String? get jobId;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'record_type')
  ParseHistoryRecordResponseRecordTypeEnum get recordType;
  // enum recordTypeEnum {  parse,  };

  ParseHistoryRecordResponse._();

  factory ParseHistoryRecordResponse(
          [void updates(ParseHistoryRecordResponseBuilder b)]) =
      _$ParseHistoryRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ParseHistoryRecordResponseBuilder b) =>
      b..nextAction = ParseHistoryRecordResponseNextActionEnum.valueOf('none');

  @BuiltValueSerializer(custom: true)
  static Serializer<ParseHistoryRecordResponse> get serializer =>
      _$ParseHistoryRecordResponseSerializer();
}

class _$ParseHistoryRecordResponseSerializer
    implements PrimitiveSerializer<ParseHistoryRecordResponse> {
  @override
  final Iterable<Type> types = const [
    ParseHistoryRecordResponse,
    _$ParseHistoryRecordResponse
  ];

  @override
  final String wireName = r'ParseHistoryRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ParseHistoryRecordResponse object, {
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
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(int),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(IntentStatus),
    );
    yield r'reason_code';
    yield object.reasonCode == null
        ? null
        : serializers.serialize(
            object.reasonCode,
            specifiedType: const FullType.nullable(String),
          );
    yield r'failure';
    yield object.failure == null
        ? null
        : serializers.serialize(
            object.failure,
            specifiedType: const FullType.nullable(IntentFailureResponse),
          );
    if (object.nextAction != null) {
      yield r'next_action';
      yield serializers.serialize(
        object.nextAction,
        specifiedType: const FullType(ParseHistoryRecordResponseNextActionEnum),
      );
    }
    yield r'deadline';
    yield serializers.serialize(
      object.deadline,
      specifiedType: const FullType(DateTime),
    );
    yield r'inspection_id';
    yield object.inspectionId == null
        ? null
        : serializers.serialize(
            object.inspectionId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'job_id';
    yield object.jobId == null
        ? null
        : serializers.serialize(
            object.jobId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'title';
    yield object.title == null
        ? null
        : serializers.serialize(
            object.title,
            specifiedType: const FullType.nullable(String),
          );
    yield r'record_type';
    yield serializers.serialize(
      object.recordType,
      specifiedType: const FullType(ParseHistoryRecordResponseRecordTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ParseHistoryRecordResponse object, {
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
    required ParseHistoryRecordResponseBuilder result,
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
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.version = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(IntentStatus),
          ) as IntentStatus;
          result.status = valueDes;
          break;
        case r'reason_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reasonCode = valueDes;
          break;
        case r'failure':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(IntentFailureResponse),
          ) as IntentFailureResponse?;
          if (valueDes == null) continue;
          result.failure.replace(valueDes);
          break;
        case r'next_action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(ParseHistoryRecordResponseNextActionEnum),
          ) as ParseHistoryRecordResponseNextActionEnum;
          result.nextAction = valueDes;
          break;
        case r'deadline':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.deadline = valueDes;
          break;
        case r'inspection_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.inspectionId = valueDes;
          break;
        case r'job_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.jobId = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'record_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(ParseHistoryRecordResponseRecordTypeEnum),
          ) as ParseHistoryRecordResponseRecordTypeEnum;
          result.recordType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ParseHistoryRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ParseHistoryRecordResponseBuilder();
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

class ParseHistoryRecordResponseNextActionEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'none')
  static const ParseHistoryRecordResponseNextActionEnum none =
      _$parseHistoryRecordResponseNextActionEnum_none;
  @BuiltValueEnumConst(wireName: r'wait')
  static const ParseHistoryRecordResponseNextActionEnum wait =
      _$parseHistoryRecordResponseNextActionEnum_wait;
  @BuiltValueEnumConst(wireName: r'refresh_result')
  static const ParseHistoryRecordResponseNextActionEnum refreshResult =
      _$parseHistoryRecordResponseNextActionEnum_refreshResult;
  @BuiltValueEnumConst(wireName: r'import_file')
  static const ParseHistoryRecordResponseNextActionEnum importFile =
      _$parseHistoryRecordResponseNextActionEnum_importFile;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ParseHistoryRecordResponseNextActionEnum unknownDefaultOpenApi =
      _$parseHistoryRecordResponseNextActionEnum_unknownDefaultOpenApi;

  static Serializer<ParseHistoryRecordResponseNextActionEnum> get serializer =>
      _$parseHistoryRecordResponseNextActionEnumSerializer;

  const ParseHistoryRecordResponseNextActionEnum._(String name) : super(name);

  static BuiltSet<ParseHistoryRecordResponseNextActionEnum> get values =>
      _$parseHistoryRecordResponseNextActionEnumValues;
  static ParseHistoryRecordResponseNextActionEnum valueOf(String name) =>
      _$parseHistoryRecordResponseNextActionEnumValueOf(name);
}

class ParseHistoryRecordResponseRecordTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'parse')
  static const ParseHistoryRecordResponseRecordTypeEnum parse =
      _$parseHistoryRecordResponseRecordTypeEnum_parse;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ParseHistoryRecordResponseRecordTypeEnum unknownDefaultOpenApi =
      _$parseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;

  static Serializer<ParseHistoryRecordResponseRecordTypeEnum> get serializer =>
      _$parseHistoryRecordResponseRecordTypeEnumSerializer;

  const ParseHistoryRecordResponseRecordTypeEnum._(String name) : super(name);

  static BuiltSet<ParseHistoryRecordResponseRecordTypeEnum> get values =>
      _$parseHistoryRecordResponseRecordTypeEnumValues;
  static ParseHistoryRecordResponseRecordTypeEnum valueOf(String name) =>
      _$parseHistoryRecordResponseRecordTypeEnumValueOf(name);
}
