//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/failure_class.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/evidence_value.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'intent_failure_response.g.dart';

/// IntentFailureResponse
///
/// Properties:
/// * [code]
/// * [failureClass]
/// * [layer]
/// * [stage]
/// * [gate]
/// * [evidence]
/// * [summary]
@BuiltValue()
abstract class IntentFailureResponse
    implements Built<IntentFailureResponse, IntentFailureResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'failure_class')
  FailureClass get failureClass;
  // enum failureClassEnum {  network_blocked,  challenge,  login_required,  identity_unavailable,  rate_limited,  context_changed,  content_unavailable,  content_protected,  extractor_broken,  format_unavailable,  transient,  invalid_input,  runtime_unavailable,  };

  @BuiltValueField(wireName: r'layer')
  String get layer;

  @BuiltValueField(wireName: r'stage')
  IntentFailureResponseStageEnum get stage;
  // enum stageEnum {  resolve,  download,  validate,  publish,  };

  @BuiltValueField(wireName: r'gate')
  IntentFailureResponseGateEnum get gate;
  // enum gateEnum {  ①,  ②,  ③,  none,  };

  @BuiltValueField(wireName: r'evidence')
  BuiltMap<String, EvidenceValue?> get evidence;

  @BuiltValueField(wireName: r'summary')
  String get summary;

  IntentFailureResponse._();

  factory IntentFailureResponse(
      [void updates(IntentFailureResponseBuilder b)]) = _$IntentFailureResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IntentFailureResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IntentFailureResponse> get serializer =>
      _$IntentFailureResponseSerializer();
}

class _$IntentFailureResponseSerializer
    implements PrimitiveSerializer<IntentFailureResponse> {
  @override
  final Iterable<Type> types = const [
    IntentFailureResponse,
    _$IntentFailureResponse
  ];

  @override
  final String wireName = r'IntentFailureResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IntentFailureResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'failure_class';
    yield serializers.serialize(
      object.failureClass,
      specifiedType: const FullType(FailureClass),
    );
    yield r'layer';
    yield serializers.serialize(
      object.layer,
      specifiedType: const FullType(String),
    );
    yield r'stage';
    yield serializers.serialize(
      object.stage,
      specifiedType: const FullType(IntentFailureResponseStageEnum),
    );
    yield r'gate';
    yield serializers.serialize(
      object.gate,
      specifiedType: const FullType(IntentFailureResponseGateEnum),
    );
    yield r'evidence';
    yield serializers.serialize(
      object.evidence,
      specifiedType: const FullType(
          BuiltMap, [FullType(String), FullType.nullable(EvidenceValue)]),
    );
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    IntentFailureResponse object, {
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
    required IntentFailureResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'failure_class':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FailureClass),
          ) as FailureClass;
          result.failureClass = valueDes;
          break;
        case r'layer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.layer = valueDes;
          break;
        case r'stage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(IntentFailureResponseStageEnum),
          ) as IntentFailureResponseStageEnum;
          result.stage = valueDes;
          break;
        case r'gate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(IntentFailureResponseGateEnum),
          ) as IntentFailureResponseGateEnum;
          result.gate = valueDes;
          break;
        case r'evidence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltMap, [FullType(String), FullType.nullable(EvidenceValue)]),
          ) as BuiltMap<String, EvidenceValue?>;
          result.evidence.replace(valueDes);
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.summary = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IntentFailureResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IntentFailureResponseBuilder();
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

class IntentFailureResponseStageEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'resolve')
  static const IntentFailureResponseStageEnum resolve =
      _$intentFailureResponseStageEnum_resolve;
  @BuiltValueEnumConst(wireName: r'download')
  static const IntentFailureResponseStageEnum download =
      _$intentFailureResponseStageEnum_download;
  @BuiltValueEnumConst(wireName: r'validate')
  static const IntentFailureResponseStageEnum validate =
      _$intentFailureResponseStageEnum_validate;
  @BuiltValueEnumConst(wireName: r'publish')
  static const IntentFailureResponseStageEnum publish =
      _$intentFailureResponseStageEnum_publish;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const IntentFailureResponseStageEnum unknownDefaultOpenApi =
      _$intentFailureResponseStageEnum_unknownDefaultOpenApi;

  static Serializer<IntentFailureResponseStageEnum> get serializer =>
      _$intentFailureResponseStageEnumSerializer;

  const IntentFailureResponseStageEnum._(String name) : super(name);

  static BuiltSet<IntentFailureResponseStageEnum> get values =>
      _$intentFailureResponseStageEnumValues;
  static IntentFailureResponseStageEnum valueOf(String name) =>
      _$intentFailureResponseStageEnumValueOf(name);
}

class IntentFailureResponseGateEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'①')
  static const IntentFailureResponseGateEnum gateOne =
      _$intentFailureResponseGateEnum_gateOne;
  @BuiltValueEnumConst(wireName: r'②')
  static const IntentFailureResponseGateEnum gateTwo =
      _$intentFailureResponseGateEnum_gateTwo;
  @BuiltValueEnumConst(wireName: r'③')
  static const IntentFailureResponseGateEnum gateThree =
      _$intentFailureResponseGateEnum_gateThree;
  @BuiltValueEnumConst(wireName: r'none')
  static const IntentFailureResponseGateEnum none =
      _$intentFailureResponseGateEnum_none;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const IntentFailureResponseGateEnum unknownDefaultOpenApi =
      _$intentFailureResponseGateEnum_unknownDefaultOpenApi;

  static Serializer<IntentFailureResponseGateEnum> get serializer =>
      _$intentFailureResponseGateEnumSerializer;

  const IntentFailureResponseGateEnum._(String name) : super(name);

  static BuiltSet<IntentFailureResponseGateEnum> get values =>
      _$intentFailureResponseGateEnumValues;
  static IntentFailureResponseGateEnum valueOf(String name) =>
      _$intentFailureResponseGateEnumValueOf(name);
}
