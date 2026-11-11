//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:framefetch_server_api/lib/model/ai_provider_preset_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_provider_preset_list_response.g.dart';

/// AiProviderPresetListResponse
///
/// Properties:
/// * [items]
@BuiltValue()
abstract class AiProviderPresetListResponse
    implements
        Built<AiProviderPresetListResponse,
            AiProviderPresetListResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<AiProviderPresetResponse> get items;

  AiProviderPresetListResponse._();

  factory AiProviderPresetListResponse(
          [void updates(AiProviderPresetListResponseBuilder b)]) =
      _$AiProviderPresetListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiProviderPresetListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiProviderPresetListResponse> get serializer =>
      _$AiProviderPresetListResponseSerializer();
}

class _$AiProviderPresetListResponseSerializer
    implements PrimitiveSerializer<AiProviderPresetListResponse> {
  @override
  final Iterable<Type> types = const [
    AiProviderPresetListResponse,
    _$AiProviderPresetListResponse
  ];

  @override
  final String wireName = r'AiProviderPresetListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiProviderPresetListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(AiProviderPresetResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AiProviderPresetListResponse object, {
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
    required AiProviderPresetListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AiProviderPresetResponse)]),
          ) as BuiltList<AiProviderPresetResponse>;
          result.items.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiProviderPresetListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiProviderPresetListResponseBuilder();
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
