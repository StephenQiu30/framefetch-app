//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'operation_log_response.g.dart';

/// OperationLogResponse
///
/// Properties:
/// * [id]
/// * [createdAt]
/// * [finishedAt]
/// * [actorId]
/// * [actorName]
/// * [operation]
/// * [description]
/// * [method]
/// * [route]
/// * [resourceId]
/// * [resourceKey]
/// * [outcome]
/// * [source_]
/// * [taskState]
/// * [statusCode]
/// * [errorCode]
@BuiltValue()
abstract class OperationLogResponse
    implements Built<OperationLogResponse, OperationLogResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'finished_at')
  DateTime? get finishedAt;

  @BuiltValueField(wireName: r'actor_id')
  String? get actorId;

  @BuiltValueField(wireName: r'actor_name')
  String? get actorName;

  @BuiltValueField(wireName: r'operation')
  String get operation;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'method')
  String get method;

  @BuiltValueField(wireName: r'route')
  String get route;

  @BuiltValueField(wireName: r'resource_id')
  String? get resourceId;

  @BuiltValueField(wireName: r'resource_key')
  String? get resourceKey;

  @BuiltValueField(wireName: r'outcome')
  OperationLogResponseOutcomeEnum get outcome;
  // enum outcomeEnum {  started,  succeeded,  failed,  };

  @BuiltValueField(wireName: r'source')
  OperationLogResponseSource_Enum get source_;
  // enum source_Enum {  request,  task,  };

  @BuiltValueField(wireName: r'task_state')
  String? get taskState;

  @BuiltValueField(wireName: r'status_code')
  int? get statusCode;

  @BuiltValueField(wireName: r'error_code')
  String? get errorCode;

  OperationLogResponse._();

  factory OperationLogResponse([void updates(OperationLogResponseBuilder b)]) =
      _$OperationLogResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OperationLogResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OperationLogResponse> get serializer =>
      _$OperationLogResponseSerializer();
}

class _$OperationLogResponseSerializer
    implements PrimitiveSerializer<OperationLogResponse> {
  @override
  final Iterable<Type> types = const [
    OperationLogResponse,
    _$OperationLogResponse
  ];

  @override
  final String wireName = r'OperationLogResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OperationLogResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'finished_at';
    yield object.finishedAt == null
        ? null
        : serializers.serialize(
            object.finishedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'actor_id';
    yield object.actorId == null
        ? null
        : serializers.serialize(
            object.actorId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'actor_name';
    yield object.actorName == null
        ? null
        : serializers.serialize(
            object.actorName,
            specifiedType: const FullType.nullable(String),
          );
    yield r'operation';
    yield serializers.serialize(
      object.operation,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'method';
    yield serializers.serialize(
      object.method,
      specifiedType: const FullType(String),
    );
    yield r'route';
    yield serializers.serialize(
      object.route,
      specifiedType: const FullType(String),
    );
    yield r'resource_id';
    yield object.resourceId == null
        ? null
        : serializers.serialize(
            object.resourceId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'resource_key';
    yield object.resourceKey == null
        ? null
        : serializers.serialize(
            object.resourceKey,
            specifiedType: const FullType.nullable(String),
          );
    yield r'outcome';
    yield serializers.serialize(
      object.outcome,
      specifiedType: const FullType(OperationLogResponseOutcomeEnum),
    );
    yield r'source';
    yield serializers.serialize(
      object.source_,
      specifiedType: const FullType(OperationLogResponseSource_Enum),
    );
    yield r'task_state';
    yield object.taskState == null
        ? null
        : serializers.serialize(
            object.taskState,
            specifiedType: const FullType.nullable(String),
          );
    yield r'status_code';
    yield object.statusCode == null
        ? null
        : serializers.serialize(
            object.statusCode,
            specifiedType: const FullType.nullable(int),
          );
    yield r'error_code';
    yield object.errorCode == null
        ? null
        : serializers.serialize(
            object.errorCode,
            specifiedType: const FullType.nullable(String),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    OperationLogResponse object, {
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
    required OperationLogResponseBuilder result,
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
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'finished_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.finishedAt = valueDes;
          break;
        case r'actor_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actorId = valueDes;
          break;
        case r'actor_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actorName = valueDes;
          break;
        case r'operation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.operation = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'method':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.method = valueDes;
          break;
        case r'route':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.route = valueDes;
          break;
        case r'resource_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.resourceId = valueDes;
          break;
        case r'resource_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.resourceKey = valueDes;
          break;
        case r'outcome':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(OperationLogResponseOutcomeEnum),
          ) as OperationLogResponseOutcomeEnum;
          result.outcome = valueDes;
          break;
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(OperationLogResponseSource_Enum),
          ) as OperationLogResponseSource_Enum;
          result.source_ = valueDes;
          break;
        case r'task_state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.taskState = valueDes;
          break;
        case r'status_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.statusCode = valueDes;
          break;
        case r'error_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
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
  OperationLogResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OperationLogResponseBuilder();
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

class OperationLogResponseOutcomeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'started')
  static const OperationLogResponseOutcomeEnum started =
      _$operationLogResponseOutcomeEnum_started;
  @BuiltValueEnumConst(wireName: r'succeeded')
  static const OperationLogResponseOutcomeEnum succeeded =
      _$operationLogResponseOutcomeEnum_succeeded;
  @BuiltValueEnumConst(wireName: r'failed')
  static const OperationLogResponseOutcomeEnum failed =
      _$operationLogResponseOutcomeEnum_failed;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const OperationLogResponseOutcomeEnum unknownDefaultOpenApi =
      _$operationLogResponseOutcomeEnum_unknownDefaultOpenApi;

  static Serializer<OperationLogResponseOutcomeEnum> get serializer =>
      _$operationLogResponseOutcomeEnumSerializer;

  const OperationLogResponseOutcomeEnum._(String name) : super(name);

  static BuiltSet<OperationLogResponseOutcomeEnum> get values =>
      _$operationLogResponseOutcomeEnumValues;
  static OperationLogResponseOutcomeEnum valueOf(String name) =>
      _$operationLogResponseOutcomeEnumValueOf(name);
}

class OperationLogResponseSource_Enum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'request')
  static const OperationLogResponseSource_Enum request =
      _$operationLogResponseSourceEnum_request;
  @BuiltValueEnumConst(wireName: r'task')
  static const OperationLogResponseSource_Enum task =
      _$operationLogResponseSourceEnum_task;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const OperationLogResponseSource_Enum unknownDefaultOpenApi =
      _$operationLogResponseSourceEnum_unknownDefaultOpenApi;

  static Serializer<OperationLogResponseSource_Enum> get serializer =>
      _$operationLogResponseSourceEnumSerializer;

  const OperationLogResponseSource_Enum._(String name) : super(name);

  static BuiltSet<OperationLogResponseSource_Enum> get values =>
      _$operationLogResponseSourceEnumValues;
  static OperationLogResponseSource_Enum valueOf(String name) =>
      _$operationLogResponseSourceEnumValueOf(name);
}
