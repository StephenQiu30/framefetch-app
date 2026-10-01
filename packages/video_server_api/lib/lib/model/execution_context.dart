//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'execution_context.g.dart';

/// The twelve non-secret facts needed to reproduce a media execution.
///
/// Properties:
/// * [providerKey]
/// * [registryRevision]
/// * [resolvedLayer]
/// * [client]
/// * [engineRevision]
/// * [egressRoute]
/// * [egressRevision]
/// * [egressClass]
/// * [egressObservedIp]
/// * [identityUsed]
/// * [identityDigest]
/// * [browserContextKind]
@BuiltValue()
abstract class ExecutionContext
    implements Built<ExecutionContext, ExecutionContextBuilder> {
  @BuiltValueField(wireName: r'provider_key')
  String get providerKey;

  @BuiltValueField(wireName: r'registry_revision')
  String get registryRevision;

  @BuiltValueField(wireName: r'resolved_layer')
  String get resolvedLayer;

  @BuiltValueField(wireName: r'client')
  String get client;

  @BuiltValueField(wireName: r'engine_revision')
  String get engineRevision;

  @BuiltValueField(wireName: r'egress_route')
  String get egressRoute;

  @BuiltValueField(wireName: r'egress_revision')
  String get egressRevision;

  @BuiltValueField(wireName: r'egress_class')
  String get egressClass;

  @BuiltValueField(wireName: r'egress_observed_ip')
  String? get egressObservedIp;

  @BuiltValueField(wireName: r'identity_used')
  bool get identityUsed;

  @BuiltValueField(wireName: r'identity_digest')
  String? get identityDigest;

  @BuiltValueField(wireName: r'browser_context_kind')
  String get browserContextKind;

  ExecutionContext._();

  factory ExecutionContext([void updates(ExecutionContextBuilder b)]) =
      _$ExecutionContext;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExecutionContextBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExecutionContext> get serializer =>
      _$ExecutionContextSerializer();
}

class _$ExecutionContextSerializer
    implements PrimitiveSerializer<ExecutionContext> {
  @override
  final Iterable<Type> types = const [ExecutionContext, _$ExecutionContext];

  @override
  final String wireName = r'ExecutionContext';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExecutionContext object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'provider_key';
    yield serializers.serialize(
      object.providerKey,
      specifiedType: const FullType(String),
    );
    yield r'registry_revision';
    yield serializers.serialize(
      object.registryRevision,
      specifiedType: const FullType(String),
    );
    yield r'resolved_layer';
    yield serializers.serialize(
      object.resolvedLayer,
      specifiedType: const FullType(String),
    );
    yield r'client';
    yield serializers.serialize(
      object.client,
      specifiedType: const FullType(String),
    );
    yield r'engine_revision';
    yield serializers.serialize(
      object.engineRevision,
      specifiedType: const FullType(String),
    );
    yield r'egress_route';
    yield serializers.serialize(
      object.egressRoute,
      specifiedType: const FullType(String),
    );
    yield r'egress_revision';
    yield serializers.serialize(
      object.egressRevision,
      specifiedType: const FullType(String),
    );
    yield r'egress_class';
    yield serializers.serialize(
      object.egressClass,
      specifiedType: const FullType(String),
    );
    yield r'egress_observed_ip';
    yield object.egressObservedIp == null
        ? null
        : serializers.serialize(
            object.egressObservedIp,
            specifiedType: const FullType.nullable(String),
          );
    yield r'identity_used';
    yield serializers.serialize(
      object.identityUsed,
      specifiedType: const FullType(bool),
    );
    yield r'identity_digest';
    yield object.identityDigest == null
        ? null
        : serializers.serialize(
            object.identityDigest,
            specifiedType: const FullType.nullable(String),
          );
    yield r'browser_context_kind';
    yield serializers.serialize(
      object.browserContextKind,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ExecutionContext object, {
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
    required ExecutionContextBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'provider_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.providerKey = valueDes;
          break;
        case r'registry_revision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.registryRevision = valueDes;
          break;
        case r'resolved_layer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.resolvedLayer = valueDes;
          break;
        case r'client':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.client = valueDes;
          break;
        case r'engine_revision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.engineRevision = valueDes;
          break;
        case r'egress_route':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.egressRoute = valueDes;
          break;
        case r'egress_revision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.egressRevision = valueDes;
          break;
        case r'egress_class':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.egressClass = valueDes;
          break;
        case r'egress_observed_ip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.egressObservedIp = valueDes;
          break;
        case r'identity_used':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.identityUsed = valueDes;
          break;
        case r'identity_digest':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.identityDigest = valueDes;
          break;
        case r'browser_context_kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.browserContextKind = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExecutionContext deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExecutionContextBuilder();
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
