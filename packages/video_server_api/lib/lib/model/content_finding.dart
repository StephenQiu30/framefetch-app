//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'content_finding.g.dart';

/// ContentFinding
///
/// Properties:
/// * [blockId]
/// * [severity]
/// * [category]
/// * [problem]
/// * [correction]
@BuiltValue()
abstract class ContentFinding
    implements Built<ContentFinding, ContentFindingBuilder> {
  @BuiltValueField(wireName: r'block_id')
  String get blockId;

  @BuiltValueField(wireName: r'severity')
  ContentFindingSeverityEnum get severity;
  // enum severityEnum {  blocking,  major,  minor,  };

  @BuiltValueField(wireName: r'category')
  ContentFindingCategoryEnum get category;
  // enum categoryEnum {  fact,  purpose,  structure,  expression,  missing_material,  };

  @BuiltValueField(wireName: r'problem')
  String get problem;

  @BuiltValueField(wireName: r'correction')
  String get correction;

  ContentFinding._();

  factory ContentFinding([void updates(ContentFindingBuilder b)]) =
      _$ContentFinding;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContentFindingBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ContentFinding> get serializer =>
      _$ContentFindingSerializer();
}

class _$ContentFindingSerializer
    implements PrimitiveSerializer<ContentFinding> {
  @override
  final Iterable<Type> types = const [ContentFinding, _$ContentFinding];

  @override
  final String wireName = r'ContentFinding';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ContentFinding object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'block_id';
    yield serializers.serialize(
      object.blockId,
      specifiedType: const FullType(String),
    );
    yield r'severity';
    yield serializers.serialize(
      object.severity,
      specifiedType: const FullType(ContentFindingSeverityEnum),
    );
    yield r'category';
    yield serializers.serialize(
      object.category,
      specifiedType: const FullType(ContentFindingCategoryEnum),
    );
    yield r'problem';
    yield serializers.serialize(
      object.problem,
      specifiedType: const FullType(String),
    );
    yield r'correction';
    yield serializers.serialize(
      object.correction,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ContentFinding object, {
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
    required ContentFindingBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'block_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.blockId = valueDes;
          break;
        case r'severity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContentFindingSeverityEnum),
          ) as ContentFindingSeverityEnum;
          result.severity = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContentFindingCategoryEnum),
          ) as ContentFindingCategoryEnum;
          result.category = valueDes;
          break;
        case r'problem':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.problem = valueDes;
          break;
        case r'correction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.correction = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ContentFinding deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContentFindingBuilder();
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

class ContentFindingSeverityEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'blocking')
  static const ContentFindingSeverityEnum blocking =
      _$contentFindingSeverityEnum_blocking;
  @BuiltValueEnumConst(wireName: r'major')
  static const ContentFindingSeverityEnum major =
      _$contentFindingSeverityEnum_major;
  @BuiltValueEnumConst(wireName: r'minor')
  static const ContentFindingSeverityEnum minor =
      _$contentFindingSeverityEnum_minor;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ContentFindingSeverityEnum unknownDefaultOpenApi =
      _$contentFindingSeverityEnum_unknownDefaultOpenApi;

  static Serializer<ContentFindingSeverityEnum> get serializer =>
      _$contentFindingSeverityEnumSerializer;

  const ContentFindingSeverityEnum._(String name) : super(name);

  static BuiltSet<ContentFindingSeverityEnum> get values =>
      _$contentFindingSeverityEnumValues;
  static ContentFindingSeverityEnum valueOf(String name) =>
      _$contentFindingSeverityEnumValueOf(name);
}

class ContentFindingCategoryEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'fact')
  static const ContentFindingCategoryEnum fact =
      _$contentFindingCategoryEnum_fact;
  @BuiltValueEnumConst(wireName: r'purpose')
  static const ContentFindingCategoryEnum purpose =
      _$contentFindingCategoryEnum_purpose;
  @BuiltValueEnumConst(wireName: r'structure')
  static const ContentFindingCategoryEnum structure =
      _$contentFindingCategoryEnum_structure;
  @BuiltValueEnumConst(wireName: r'expression')
  static const ContentFindingCategoryEnum expression =
      _$contentFindingCategoryEnum_expression;
  @BuiltValueEnumConst(wireName: r'missing_material')
  static const ContentFindingCategoryEnum missingMaterial =
      _$contentFindingCategoryEnum_missingMaterial;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ContentFindingCategoryEnum unknownDefaultOpenApi =
      _$contentFindingCategoryEnum_unknownDefaultOpenApi;

  static Serializer<ContentFindingCategoryEnum> get serializer =>
      _$contentFindingCategoryEnumSerializer;

  const ContentFindingCategoryEnum._(String name) : super(name);

  static BuiltSet<ContentFindingCategoryEnum> get values =>
      _$contentFindingCategoryEnumValues;
  static ContentFindingCategoryEnum valueOf(String name) =>
      _$contentFindingCategoryEnumValueOf(name);
}
