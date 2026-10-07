//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:framefetch_server_api/lib/model/engine_candidate_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'engine_catalog_response.g.dart';

/// EngineCatalogResponse
///
/// Properties:
/// * [scope]
/// * [engineVersion]
/// * [engineCommit]
/// * [expectedEngineCommit]
/// * [pinMatches]
/// * [bundledPluginsSha256]
/// * [potProviderVersion]
/// * [manifestId]
/// * [candidates]
@BuiltValue()
abstract class EngineCatalogResponse
    implements Built<EngineCatalogResponse, EngineCatalogResponseBuilder> {
  @BuiltValueField(wireName: r'scope')
  EngineCatalogResponseScopeEnum? get scope;
  // enum scopeEnum {  anonymous_runner,  };

  @BuiltValueField(wireName: r'engine_version')
  String get engineVersion;

  @BuiltValueField(wireName: r'engine_commit')
  String? get engineCommit;

  @BuiltValueField(wireName: r'expected_engine_commit')
  String get expectedEngineCommit;

  @BuiltValueField(wireName: r'pin_matches')
  bool get pinMatches;

  @BuiltValueField(wireName: r'bundled_plugins_sha256')
  String get bundledPluginsSha256;

  @BuiltValueField(wireName: r'pot_provider_version')
  String? get potProviderVersion;

  @BuiltValueField(wireName: r'manifest_id')
  String get manifestId;

  @BuiltValueField(wireName: r'candidates')
  BuiltList<EngineCandidateResponse> get candidates;

  EngineCatalogResponse._();

  factory EngineCatalogResponse(
      [void updates(EngineCatalogResponseBuilder b)]) = _$EngineCatalogResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EngineCatalogResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EngineCatalogResponse> get serializer =>
      _$EngineCatalogResponseSerializer();
}

class _$EngineCatalogResponseSerializer
    implements PrimitiveSerializer<EngineCatalogResponse> {
  @override
  final Iterable<Type> types = const [
    EngineCatalogResponse,
    _$EngineCatalogResponse
  ];

  @override
  final String wireName = r'EngineCatalogResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EngineCatalogResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.scope != null) {
      yield r'scope';
      yield serializers.serialize(
        object.scope,
        specifiedType: const FullType(EngineCatalogResponseScopeEnum),
      );
    }
    yield r'engine_version';
    yield serializers.serialize(
      object.engineVersion,
      specifiedType: const FullType(String),
    );
    if (object.engineCommit != null) {
      yield r'engine_commit';
      yield serializers.serialize(
        object.engineCommit,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'expected_engine_commit';
    yield serializers.serialize(
      object.expectedEngineCommit,
      specifiedType: const FullType(String),
    );
    yield r'pin_matches';
    yield serializers.serialize(
      object.pinMatches,
      specifiedType: const FullType(bool),
    );
    yield r'bundled_plugins_sha256';
    yield serializers.serialize(
      object.bundledPluginsSha256,
      specifiedType: const FullType(String),
    );
    if (object.potProviderVersion != null) {
      yield r'pot_provider_version';
      yield serializers.serialize(
        object.potProviderVersion,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'manifest_id';
    yield serializers.serialize(
      object.manifestId,
      specifiedType: const FullType(String),
    );
    yield r'candidates';
    yield serializers.serialize(
      object.candidates,
      specifiedType:
          const FullType(BuiltList, [FullType(EngineCandidateResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EngineCatalogResponse object, {
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
    required EngineCatalogResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'scope':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EngineCatalogResponseScopeEnum),
          ) as EngineCatalogResponseScopeEnum;
          result.scope = valueDes;
          break;
        case r'engine_version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.engineVersion = valueDes;
          break;
        case r'engine_commit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.engineCommit = valueDes;
          break;
        case r'expected_engine_commit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.expectedEngineCommit = valueDes;
          break;
        case r'pin_matches':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.pinMatches = valueDes;
          break;
        case r'bundled_plugins_sha256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.bundledPluginsSha256 = valueDes;
          break;
        case r'pot_provider_version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.potProviderVersion = valueDes;
          break;
        case r'manifest_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.manifestId = valueDes;
          break;
        case r'candidates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(EngineCandidateResponse)]),
          ) as BuiltList<EngineCandidateResponse>;
          result.candidates.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EngineCatalogResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EngineCatalogResponseBuilder();
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

class EngineCatalogResponseScopeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'anonymous_runner')
  static const EngineCatalogResponseScopeEnum anonymousRunner =
      _$engineCatalogResponseScopeEnum_anonymousRunner;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const EngineCatalogResponseScopeEnum unknownDefaultOpenApi =
      _$engineCatalogResponseScopeEnum_unknownDefaultOpenApi;

  static Serializer<EngineCatalogResponseScopeEnum> get serializer =>
      _$engineCatalogResponseScopeEnumSerializer;

  const EngineCatalogResponseScopeEnum._(String name) : super(name);

  static BuiltSet<EngineCatalogResponseScopeEnum> get values =>
      _$engineCatalogResponseScopeEnumValues;
  static EngineCatalogResponseScopeEnum valueOf(String name) =>
      _$engineCatalogResponseScopeEnumValueOf(name);
}
