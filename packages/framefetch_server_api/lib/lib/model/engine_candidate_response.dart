//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'engine_candidate_response.g.dart';

/// EngineCandidateResponse
///
/// Properties:
/// * [key]
/// * [name]
/// * [upstreamWorking]
@BuiltValue()
abstract class EngineCandidateResponse
    implements Built<EngineCandidateResponse, EngineCandidateResponseBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'upstream_working')
  bool get upstreamWorking;

  EngineCandidateResponse._();

  factory EngineCandidateResponse(
          [void updates(EngineCandidateResponseBuilder b)]) =
      _$EngineCandidateResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EngineCandidateResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EngineCandidateResponse> get serializer =>
      _$EngineCandidateResponseSerializer();
}

class _$EngineCandidateResponseSerializer
    implements PrimitiveSerializer<EngineCandidateResponse> {
  @override
  final Iterable<Type> types = const [
    EngineCandidateResponse,
    _$EngineCandidateResponse
  ];

  @override
  final String wireName = r'EngineCandidateResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EngineCandidateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'upstream_working';
    yield serializers.serialize(
      object.upstreamWorking,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EngineCandidateResponse object, {
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
    required EngineCandidateResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'upstream_working':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.upstreamWorking = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EngineCandidateResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EngineCandidateResponseBuilder();
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
