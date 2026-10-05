//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'skill_text_evidence.g.dart';

/// SkillTextEvidence
///
/// Properties:
/// * [sourceId]
/// * [sha256]
/// * [start]
/// * [end]
/// * [quote]
/// * [claim]
/// * [status]
@BuiltValue()
abstract class SkillTextEvidence
    implements Built<SkillTextEvidence, SkillTextEvidenceBuilder> {
  @BuiltValueField(wireName: r'source_id')
  SkillTextEvidenceSourceIdEnum get sourceId;
  // enum sourceIdEnum {  primary,  secondary,  };

  @BuiltValueField(wireName: r'sha256')
  String get sha256;

  @BuiltValueField(wireName: r'start')
  int get start;

  @BuiltValueField(wireName: r'end')
  int get end;

  @BuiltValueField(wireName: r'quote')
  String get quote;

  @BuiltValueField(wireName: r'claim')
  String get claim;

  @BuiltValueField(wireName: r'status')
  SkillTextEvidenceStatusEnum get status;
  // enum statusEnum {  observation,  inference,  suggestion,  unverified,  };

  SkillTextEvidence._();

  factory SkillTextEvidence([void updates(SkillTextEvidenceBuilder b)]) =
      _$SkillTextEvidence;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SkillTextEvidenceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SkillTextEvidence> get serializer =>
      _$SkillTextEvidenceSerializer();
}

class _$SkillTextEvidenceSerializer
    implements PrimitiveSerializer<SkillTextEvidence> {
  @override
  final Iterable<Type> types = const [SkillTextEvidence, _$SkillTextEvidence];

  @override
  final String wireName = r'SkillTextEvidence';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SkillTextEvidence object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'source_id';
    yield serializers.serialize(
      object.sourceId,
      specifiedType: const FullType(SkillTextEvidenceSourceIdEnum),
    );
    yield r'sha256';
    yield serializers.serialize(
      object.sha256,
      specifiedType: const FullType(String),
    );
    yield r'start';
    yield serializers.serialize(
      object.start,
      specifiedType: const FullType(int),
    );
    yield r'end';
    yield serializers.serialize(
      object.end,
      specifiedType: const FullType(int),
    );
    yield r'quote';
    yield serializers.serialize(
      object.quote,
      specifiedType: const FullType(String),
    );
    yield r'claim';
    yield serializers.serialize(
      object.claim,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(SkillTextEvidenceStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SkillTextEvidence object, {
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
    required SkillTextEvidenceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'source_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SkillTextEvidenceSourceIdEnum),
          ) as SkillTextEvidenceSourceIdEnum;
          result.sourceId = valueDes;
          break;
        case r'sha256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sha256 = valueDes;
          break;
        case r'start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.start = valueDes;
          break;
        case r'end':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.end = valueDes;
          break;
        case r'quote':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.quote = valueDes;
          break;
        case r'claim':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.claim = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SkillTextEvidenceStatusEnum),
          ) as SkillTextEvidenceStatusEnum;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SkillTextEvidence deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SkillTextEvidenceBuilder();
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

class SkillTextEvidenceSourceIdEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'primary')
  static const SkillTextEvidenceSourceIdEnum primary =
      _$skillTextEvidenceSourceIdEnum_primary;
  @BuiltValueEnumConst(wireName: r'secondary')
  static const SkillTextEvidenceSourceIdEnum secondary =
      _$skillTextEvidenceSourceIdEnum_secondary;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const SkillTextEvidenceSourceIdEnum unknownDefaultOpenApi =
      _$skillTextEvidenceSourceIdEnum_unknownDefaultOpenApi;

  static Serializer<SkillTextEvidenceSourceIdEnum> get serializer =>
      _$skillTextEvidenceSourceIdEnumSerializer;

  const SkillTextEvidenceSourceIdEnum._(String name) : super(name);

  static BuiltSet<SkillTextEvidenceSourceIdEnum> get values =>
      _$skillTextEvidenceSourceIdEnumValues;
  static SkillTextEvidenceSourceIdEnum valueOf(String name) =>
      _$skillTextEvidenceSourceIdEnumValueOf(name);
}

class SkillTextEvidenceStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'observation')
  static const SkillTextEvidenceStatusEnum observation =
      _$skillTextEvidenceStatusEnum_observation;
  @BuiltValueEnumConst(wireName: r'inference')
  static const SkillTextEvidenceStatusEnum inference =
      _$skillTextEvidenceStatusEnum_inference;
  @BuiltValueEnumConst(wireName: r'suggestion')
  static const SkillTextEvidenceStatusEnum suggestion =
      _$skillTextEvidenceStatusEnum_suggestion;
  @BuiltValueEnumConst(wireName: r'unverified')
  static const SkillTextEvidenceStatusEnum unverified =
      _$skillTextEvidenceStatusEnum_unverified;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const SkillTextEvidenceStatusEnum unknownDefaultOpenApi =
      _$skillTextEvidenceStatusEnum_unknownDefaultOpenApi;

  static Serializer<SkillTextEvidenceStatusEnum> get serializer =>
      _$skillTextEvidenceStatusEnumSerializer;

  const SkillTextEvidenceStatusEnum._(String name) : super(name);

  static BuiltSet<SkillTextEvidenceStatusEnum> get values =>
      _$skillTextEvidenceStatusEnumValues;
  static SkillTextEvidenceStatusEnum valueOf(String name) =>
      _$skillTextEvidenceStatusEnumValueOf(name);
}
