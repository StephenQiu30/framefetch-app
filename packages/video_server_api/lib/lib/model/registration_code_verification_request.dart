//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'registration_code_verification_request.g.dart';

/// RegistrationCodeVerificationRequest
///
/// Properties:
/// * [email]
/// * [verificationCode]
@BuiltValue()
abstract class RegistrationCodeVerificationRequest
    implements
        Built<RegistrationCodeVerificationRequest,
            RegistrationCodeVerificationRequestBuilder> {
  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'verification_code')
  String get verificationCode;

  RegistrationCodeVerificationRequest._();

  factory RegistrationCodeVerificationRequest(
          [void updates(RegistrationCodeVerificationRequestBuilder b)]) =
      _$RegistrationCodeVerificationRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegistrationCodeVerificationRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegistrationCodeVerificationRequest> get serializer =>
      _$RegistrationCodeVerificationRequestSerializer();
}

class _$RegistrationCodeVerificationRequestSerializer
    implements PrimitiveSerializer<RegistrationCodeVerificationRequest> {
  @override
  final Iterable<Type> types = const [
    RegistrationCodeVerificationRequest,
    _$RegistrationCodeVerificationRequest
  ];

  @override
  final String wireName = r'RegistrationCodeVerificationRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegistrationCodeVerificationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'verification_code';
    yield serializers.serialize(
      object.verificationCode,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegistrationCodeVerificationRequest object, {
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
    required RegistrationCodeVerificationRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'verification_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.verificationCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegistrationCodeVerificationRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegistrationCodeVerificationRequestBuilder();
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
