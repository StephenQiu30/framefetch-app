//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:framefetch_server_api/lib/model/history_record_cursor_response.dart';
import 'package:framefetch_server_api/lib/model/items_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_record_page_response.g.dart';

/// HistoryRecordPageResponse
///
/// Properties:
/// * [items]
/// * [nextCursor]
@BuiltValue()
abstract class HistoryRecordPageResponse
    implements
        Built<HistoryRecordPageResponse, HistoryRecordPageResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<ItemsInner> get items;

  @BuiltValueField(wireName: r'next_cursor')
  HistoryRecordCursorResponse? get nextCursor;

  HistoryRecordPageResponse._();

  factory HistoryRecordPageResponse(
          [void updates(HistoryRecordPageResponseBuilder b)]) =
      _$HistoryRecordPageResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HistoryRecordPageResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HistoryRecordPageResponse> get serializer =>
      _$HistoryRecordPageResponseSerializer();
}

class _$HistoryRecordPageResponseSerializer
    implements PrimitiveSerializer<HistoryRecordPageResponse> {
  @override
  final Iterable<Type> types = const [
    HistoryRecordPageResponse,
    _$HistoryRecordPageResponse
  ];

  @override
  final String wireName = r'HistoryRecordPageResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HistoryRecordPageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(ItemsInner)]),
    );
    yield r'next_cursor';
    yield object.nextCursor == null
        ? null
        : serializers.serialize(
            object.nextCursor,
            specifiedType: const FullType.nullable(HistoryRecordCursorResponse),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    HistoryRecordPageResponse object, {
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
    required HistoryRecordPageResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ItemsInner)]),
          ) as BuiltList<ItemsInner>;
          result.items.replace(valueDes);
          break;
        case r'next_cursor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(HistoryRecordCursorResponse),
          ) as HistoryRecordCursorResponse?;
          if (valueDes == null) continue;
          result.nextCursor.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HistoryRecordPageResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HistoryRecordPageResponseBuilder();
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
