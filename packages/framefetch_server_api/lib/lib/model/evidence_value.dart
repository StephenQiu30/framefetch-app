//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'evidence_value.g.dart';

/// EvidenceValue
@BuiltValue()
abstract class EvidenceValue
    implements Built<EvidenceValue, EvidenceValueBuilder> {
  /// One Of [String], [bool], [int]
  OneOf get oneOf;

  EvidenceValue._();

  factory EvidenceValue([void updates(EvidenceValueBuilder b)]) =
      _$EvidenceValue;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EvidenceValueBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EvidenceValue> get serializer =>
      _$EvidenceValueSerializer();
}

class _$EvidenceValueSerializer implements PrimitiveSerializer<EvidenceValue> {
  @override
  final Iterable<Type> types = const [EvidenceValue, _$EvidenceValue];

  @override
  final String wireName = r'EvidenceValue';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EvidenceValue object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    EvidenceValue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  EvidenceValue deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EvidenceValueBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [
      FullType(String),
      FullType(int),
      FullType(bool),
    ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc,
        specifiedType: targetType) as OneOf;
    return result.build();
  }
}
