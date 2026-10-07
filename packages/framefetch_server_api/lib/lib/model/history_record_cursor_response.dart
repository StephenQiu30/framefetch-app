//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:framefetch_server_api/lib/model/history_record_kind.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_record_cursor_response.g.dart';

/// HistoryRecordCursorResponse
///
/// Properties:
/// * [createdAt]
/// * [recordType]
/// * [id]
@BuiltValue()
abstract class HistoryRecordCursorResponse
    implements
        Built<HistoryRecordCursorResponse, HistoryRecordCursorResponseBuilder> {
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'record_type')
  HistoryRecordKind get recordType;
  // enum recordTypeEnum {  parse,  video_analysis,  document_parse,  screenplay_analysis,  content_creation,  skill_analysis,  };

  @BuiltValueField(wireName: r'id')
  String get id;

  HistoryRecordCursorResponse._();

  factory HistoryRecordCursorResponse(
          [void updates(HistoryRecordCursorResponseBuilder b)]) =
      _$HistoryRecordCursorResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HistoryRecordCursorResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HistoryRecordCursorResponse> get serializer =>
      _$HistoryRecordCursorResponseSerializer();
}

class _$HistoryRecordCursorResponseSerializer
    implements PrimitiveSerializer<HistoryRecordCursorResponse> {
  @override
  final Iterable<Type> types = const [
    HistoryRecordCursorResponse,
    _$HistoryRecordCursorResponse
  ];

  @override
  final String wireName = r'HistoryRecordCursorResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HistoryRecordCursorResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'record_type';
    yield serializers.serialize(
      object.recordType,
      specifiedType: const FullType(HistoryRecordKind),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HistoryRecordCursorResponse object, {
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
    required HistoryRecordCursorResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'record_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HistoryRecordKind),
          ) as HistoryRecordKind;
          result.recordType = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HistoryRecordCursorResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HistoryRecordCursorResponseBuilder();
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
