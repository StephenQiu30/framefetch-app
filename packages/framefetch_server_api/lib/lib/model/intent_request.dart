//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:framefetch_server_api/lib/model/discovered_item_inspection_source.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'intent_request.g.dart';

/// IntentRequest
///
/// Properties:
/// * [input] - 媒体地址或包含唯一媒体地址的分享文案。
/// * [source_]
@BuiltValue()
abstract class IntentRequest
    implements Built<IntentRequest, IntentRequestBuilder> {
  /// 媒体地址或包含唯一媒体地址的分享文案。
  @BuiltValueField(wireName: r'input')
  String? get input;

  @BuiltValueField(wireName: r'source')
  DiscoveredItemInspectionSource? get source_;

  IntentRequest._();

  factory IntentRequest([void updates(IntentRequestBuilder b)]) =
      _$IntentRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IntentRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IntentRequest> get serializer =>
      _$IntentRequestSerializer();
}

class _$IntentRequestSerializer implements PrimitiveSerializer<IntentRequest> {
  @override
  final Iterable<Type> types = const [IntentRequest, _$IntentRequest];

  @override
  final String wireName = r'IntentRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IntentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.input != null) {
      yield r'input';
      yield serializers.serialize(
        object.input,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.source_ != null) {
      yield r'source';
      yield serializers.serialize(
        object.source_,
        specifiedType: const FullType.nullable(DiscoveredItemInspectionSource),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    IntentRequest object, {
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
    required IntentRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'input':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.input = valueDes;
          break;
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType.nullable(DiscoveredItemInspectionSource),
          ) as DiscoveredItemInspectionSource?;
          if (valueDes == null) continue;
          result.source_.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IntentRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IntentRequestBuilder();
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
