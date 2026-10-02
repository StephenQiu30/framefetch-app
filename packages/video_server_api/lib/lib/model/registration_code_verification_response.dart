//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'registration_code_verification_response.g.dart';

/// RegistrationCodeVerificationResponse
///
/// Properties:
/// * [verified]
@BuiltValue()
abstract class RegistrationCodeVerificationResponse
    implements
        Built<RegistrationCodeVerificationResponse,
            RegistrationCodeVerificationResponseBuilder> {
  @BuiltValueField(wireName: r'verified')
  bool? get verified;

  RegistrationCodeVerificationResponse._();

  factory RegistrationCodeVerificationResponse(
          [void updates(RegistrationCodeVerificationResponseBuilder b)]) =
      _$RegistrationCodeVerificationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegistrationCodeVerificationResponseBuilder b) =>
      b..verified = true;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegistrationCodeVerificationResponse> get serializer =>
      _$RegistrationCodeVerificationResponseSerializer();
}

class _$RegistrationCodeVerificationResponseSerializer
    implements PrimitiveSerializer<RegistrationCodeVerificationResponse> {
  @override
  final Iterable<Type> types = const [
    RegistrationCodeVerificationResponse,
    _$RegistrationCodeVerificationResponse
  ];

  @override
  final String wireName = r'RegistrationCodeVerificationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegistrationCodeVerificationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.verified != null) {
      yield r'verified';
      yield serializers.serialize(
        object.verified,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RegistrationCodeVerificationResponse object, {
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
    required RegistrationCodeVerificationResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.verified = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegistrationCodeVerificationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegistrationCodeVerificationResponseBuilder();
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
