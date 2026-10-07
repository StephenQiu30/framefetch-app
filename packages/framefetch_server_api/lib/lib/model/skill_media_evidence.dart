//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'skill_media_evidence.g.dart';

/// SkillMediaEvidence
///
/// Properties:
/// * [sourceId]
/// * [sha256]
/// * [frameId]
/// * [frameSha256]
/// * [timestampMs]
/// * [claim]
/// * [status]
@BuiltValue()
abstract class SkillMediaEvidence
    implements Built<SkillMediaEvidence, SkillMediaEvidenceBuilder> {
  @BuiltValueField(wireName: r'source_id')
  SkillMediaEvidenceSourceIdEnum get sourceId;
  // enum sourceIdEnum {  primary,  secondary,  };

  @BuiltValueField(wireName: r'sha256')
  String get sha256;

  @BuiltValueField(wireName: r'frame_id')
  String get frameId;

  @BuiltValueField(wireName: r'frame_sha256')
  String get frameSha256;

  @BuiltValueField(wireName: r'timestamp_ms')
  int get timestampMs;

  @BuiltValueField(wireName: r'claim')
  String get claim;

  @BuiltValueField(wireName: r'status')
  SkillMediaEvidenceStatusEnum get status;
  // enum statusEnum {  observation,  inference,  suggestion,  unverified,  };

  SkillMediaEvidence._();

  factory SkillMediaEvidence([void updates(SkillMediaEvidenceBuilder b)]) =
      _$SkillMediaEvidence;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SkillMediaEvidenceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SkillMediaEvidence> get serializer =>
      _$SkillMediaEvidenceSerializer();
}

class _$SkillMediaEvidenceSerializer
    implements PrimitiveSerializer<SkillMediaEvidence> {
  @override
  final Iterable<Type> types = const [SkillMediaEvidence, _$SkillMediaEvidence];

  @override
  final String wireName = r'SkillMediaEvidence';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SkillMediaEvidence object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'source_id';
    yield serializers.serialize(
      object.sourceId,
      specifiedType: const FullType(SkillMediaEvidenceSourceIdEnum),
    );
    yield r'sha256';
    yield serializers.serialize(
      object.sha256,
      specifiedType: const FullType(String),
    );
    yield r'frame_id';
    yield serializers.serialize(
      object.frameId,
      specifiedType: const FullType(String),
    );
    yield r'frame_sha256';
    yield serializers.serialize(
      object.frameSha256,
      specifiedType: const FullType(String),
    );
    yield r'timestamp_ms';
    yield serializers.serialize(
      object.timestampMs,
      specifiedType: const FullType(int),
    );
    yield r'claim';
    yield serializers.serialize(
      object.claim,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(SkillMediaEvidenceStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SkillMediaEvidence object, {
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
    required SkillMediaEvidenceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'source_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SkillMediaEvidenceSourceIdEnum),
          ) as SkillMediaEvidenceSourceIdEnum;
          result.sourceId = valueDes;
          break;
        case r'sha256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sha256 = valueDes;
          break;
        case r'frame_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.frameId = valueDes;
          break;
        case r'frame_sha256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.frameSha256 = valueDes;
          break;
        case r'timestamp_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.timestampMs = valueDes;
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
            specifiedType: const FullType(SkillMediaEvidenceStatusEnum),
          ) as SkillMediaEvidenceStatusEnum;
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
  SkillMediaEvidence deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SkillMediaEvidenceBuilder();
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

class SkillMediaEvidenceSourceIdEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'primary')
  static const SkillMediaEvidenceSourceIdEnum primary =
      _$skillMediaEvidenceSourceIdEnum_primary;
  @BuiltValueEnumConst(wireName: r'secondary')
  static const SkillMediaEvidenceSourceIdEnum secondary =
      _$skillMediaEvidenceSourceIdEnum_secondary;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const SkillMediaEvidenceSourceIdEnum unknownDefaultOpenApi =
      _$skillMediaEvidenceSourceIdEnum_unknownDefaultOpenApi;

  static Serializer<SkillMediaEvidenceSourceIdEnum> get serializer =>
      _$skillMediaEvidenceSourceIdEnumSerializer;

  const SkillMediaEvidenceSourceIdEnum._(String name) : super(name);

  static BuiltSet<SkillMediaEvidenceSourceIdEnum> get values =>
      _$skillMediaEvidenceSourceIdEnumValues;
  static SkillMediaEvidenceSourceIdEnum valueOf(String name) =>
      _$skillMediaEvidenceSourceIdEnumValueOf(name);
}

class SkillMediaEvidenceStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'observation')
  static const SkillMediaEvidenceStatusEnum observation =
      _$skillMediaEvidenceStatusEnum_observation;
  @BuiltValueEnumConst(wireName: r'inference')
  static const SkillMediaEvidenceStatusEnum inference =
      _$skillMediaEvidenceStatusEnum_inference;
  @BuiltValueEnumConst(wireName: r'suggestion')
  static const SkillMediaEvidenceStatusEnum suggestion =
      _$skillMediaEvidenceStatusEnum_suggestion;
  @BuiltValueEnumConst(wireName: r'unverified')
  static const SkillMediaEvidenceStatusEnum unverified =
      _$skillMediaEvidenceStatusEnum_unverified;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const SkillMediaEvidenceStatusEnum unknownDefaultOpenApi =
      _$skillMediaEvidenceStatusEnum_unknownDefaultOpenApi;

  static Serializer<SkillMediaEvidenceStatusEnum> get serializer =>
      _$skillMediaEvidenceStatusEnumSerializer;

  const SkillMediaEvidenceStatusEnum._(String name) : super(name);

  static BuiltSet<SkillMediaEvidenceStatusEnum> get values =>
      _$skillMediaEvidenceStatusEnumValues;
  static SkillMediaEvidenceStatusEnum valueOf(String name) =>
      _$skillMediaEvidenceStatusEnumValueOf(name);
}
