//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/skill_text_evidence.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/skill_media_evidence.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'skill_report_result.g.dart';

/// SkillReportResult
///
/// Properties:
/// * [kind]
/// * [schemaVersion]
/// * [skillId]
/// * [language]
/// * [title]
/// * [summary]
/// * [body]
/// * [evidence]
/// * [mediaEvidence]
/// * [limitations]
/// * [data]
@BuiltValue()
abstract class SkillReportResult
    implements Built<SkillReportResult, SkillReportResultBuilder> {
  @BuiltValueField(wireName: r'kind')
  SkillReportResultKindEnum get kind;
  // enum kindEnum {  skill_report,  };

  @BuiltValueField(wireName: r'schema_version')
  SkillReportResultSchemaVersionEnum? get schemaVersion;
  // enum schemaVersionEnum {  1,  };

  @BuiltValueField(wireName: r'skill_id')
  String get skillId;

  @BuiltValueField(wireName: r'language')
  SkillReportResultLanguageEnum? get language;
  // enum languageEnum {  zh-CN,  };

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'summary')
  String get summary;

  @BuiltValueField(wireName: r'body')
  String get body;

  @BuiltValueField(wireName: r'evidence')
  BuiltList<SkillTextEvidence>? get evidence;

  @BuiltValueField(wireName: r'media_evidence')
  BuiltList<SkillMediaEvidence>? get mediaEvidence;

  @BuiltValueField(wireName: r'limitations')
  BuiltList<String?>? get limitations;

  @BuiltValueField(wireName: r'data')
  BuiltMap<String, JsonObject?>? get data;

  SkillReportResult._();

  factory SkillReportResult([void updates(SkillReportResultBuilder b)]) =
      _$SkillReportResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SkillReportResultBuilder b) => b
    ..evidence = ListBuilder()
    ..mediaEvidence = ListBuilder()
    ..limitations = ListBuilder();

  @BuiltValueSerializer(custom: true)
  static Serializer<SkillReportResult> get serializer =>
      _$SkillReportResultSerializer();
}

class _$SkillReportResultSerializer
    implements PrimitiveSerializer<SkillReportResult> {
  @override
  final Iterable<Type> types = const [SkillReportResult, _$SkillReportResult];

  @override
  final String wireName = r'SkillReportResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SkillReportResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(SkillReportResultKindEnum),
    );
    if (object.schemaVersion != null) {
      yield r'schema_version';
      yield serializers.serialize(
        object.schemaVersion,
        specifiedType: const FullType(SkillReportResultSchemaVersionEnum),
      );
    }
    yield r'skill_id';
    yield serializers.serialize(
      object.skillId,
      specifiedType: const FullType(String),
    );
    if (object.language != null) {
      yield r'language';
      yield serializers.serialize(
        object.language,
        specifiedType: const FullType(SkillReportResultLanguageEnum),
      );
    }
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(String),
    );
    yield r'body';
    yield serializers.serialize(
      object.body,
      specifiedType: const FullType(String),
    );
    if (object.evidence != null) {
      yield r'evidence';
      yield serializers.serialize(
        object.evidence,
        specifiedType: const FullType(BuiltList, [FullType(SkillTextEvidence)]),
      );
    }
    if (object.mediaEvidence != null) {
      yield r'media_evidence';
      yield serializers.serialize(
        object.mediaEvidence,
        specifiedType:
            const FullType(BuiltList, [FullType(SkillMediaEvidence)]),
      );
    }
    if (object.limitations != null) {
      yield r'limitations';
      yield serializers.serialize(
        object.limitations,
        specifiedType: const FullType(BuiltList, [FullType.nullable(String)]),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(
            BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SkillReportResult object, {
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
    required SkillReportResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SkillReportResultKindEnum),
          ) as SkillReportResultKindEnum;
          result.kind = valueDes;
          break;
        case r'schema_version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SkillReportResultSchemaVersionEnum),
          ) as SkillReportResultSchemaVersionEnum;
          result.schemaVersion = valueDes;
          break;
        case r'skill_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.skillId = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SkillReportResultLanguageEnum),
          ) as SkillReportResultLanguageEnum;
          result.language = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.summary = valueDes;
          break;
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        case r'evidence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SkillTextEvidence)]),
          ) as BuiltList<SkillTextEvidence>;
          result.evidence.replace(valueDes);
          break;
        case r'media_evidence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SkillMediaEvidence)]),
          ) as BuiltList<SkillMediaEvidence>;
          result.mediaEvidence.replace(valueDes);
          break;
        case r'limitations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType.nullable(String)]),
          ) as BuiltList<String?>;
          result.limitations.replace(valueDes);
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SkillReportResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SkillReportResultBuilder();
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

class SkillReportResultKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'skill_report')
  static const SkillReportResultKindEnum skillReport =
      _$skillReportResultKindEnum_skillReport;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const SkillReportResultKindEnum unknownDefaultOpenApi =
      _$skillReportResultKindEnum_unknownDefaultOpenApi;

  static Serializer<SkillReportResultKindEnum> get serializer =>
      _$skillReportResultKindEnumSerializer;

  const SkillReportResultKindEnum._(String name) : super(name);

  static BuiltSet<SkillReportResultKindEnum> get values =>
      _$skillReportResultKindEnumValues;
  static SkillReportResultKindEnum valueOf(String name) =>
      _$skillReportResultKindEnumValueOf(name);
}

class SkillReportResultSchemaVersionEnum extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 1)
  static const SkillReportResultSchemaVersionEnum number1 =
      _$skillReportResultSchemaVersionEnum_number1;
  @BuiltValueEnumConst(wireNumber: 11184809, fallback: true)
  static const SkillReportResultSchemaVersionEnum unknownDefaultOpenApi =
      _$skillReportResultSchemaVersionEnum_unknownDefaultOpenApi;

  static Serializer<SkillReportResultSchemaVersionEnum> get serializer =>
      _$skillReportResultSchemaVersionEnumSerializer;

  const SkillReportResultSchemaVersionEnum._(String name) : super(name);

  static BuiltSet<SkillReportResultSchemaVersionEnum> get values =>
      _$skillReportResultSchemaVersionEnumValues;
  static SkillReportResultSchemaVersionEnum valueOf(String name) =>
      _$skillReportResultSchemaVersionEnumValueOf(name);
}

class SkillReportResultLanguageEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'zh-CN')
  static const SkillReportResultLanguageEnum zhCN =
      _$skillReportResultLanguageEnum_zhCN;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const SkillReportResultLanguageEnum unknownDefaultOpenApi =
      _$skillReportResultLanguageEnum_unknownDefaultOpenApi;

  static Serializer<SkillReportResultLanguageEnum> get serializer =>
      _$skillReportResultLanguageEnumSerializer;

  const SkillReportResultLanguageEnum._(String name) : super(name);

  static BuiltSet<SkillReportResultLanguageEnum> get values =>
      _$skillReportResultLanguageEnumValues;
  static SkillReportResultLanguageEnum valueOf(String name) =>
      _$skillReportResultLanguageEnumValueOf(name);
}
