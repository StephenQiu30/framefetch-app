//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/failure_class.dart';
import 'package:video_server_api/lib/model/failure_phase.dart';
import 'package:video_server_api/lib/model/failure_evidence_kind.dart';
import 'package:video_server_api/lib/model/failure_scope.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'intent_failure_response.g.dart';

/// IntentFailureResponse
///
/// Properties:
/// * [code]
/// * [phase]
/// * [scope]
/// * [failureClass]
/// * [causeCode]
/// * [evidenceKind]
/// * [observedAt]
/// * [retryAfter]
/// * [diagnosticRef]
@BuiltValue()
abstract class IntentFailureResponse
    implements Built<IntentFailureResponse, IntentFailureResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'phase')
  FailurePhase get phase;
  // enum phaseEnum {  recognize,  prepare_context,  fetch_metadata,  select_format,  probe_media,  transfer,  validate,  publish,  };

  @BuiltValueField(wireName: r'scope')
  FailureScope get scope;
  // enum scopeEnum {  content,  session,  route,  dependency,  runtime,  };

  @BuiltValueField(wireName: r'failure_class')
  FailureClass get failureClass;
  // enum failureClassEnum {  auth_required,  session_expired,  challenge_required,  token_unavailable,  token_rejected,  extractor_changed,  protocol_unavailable,  format_unavailable,  media_probe_failed,  egress_denied,  network_transient,  rate_limited,  content_unavailable,  content_restricted,  context_changed,  runtime_unavailable,  capacity_exhausted,  invalid_input,  source_unsupported,  artifact_invalid,  storage_unavailable,  outcome_unknown,  upstream_unclassified,  };

  @BuiltValueField(wireName: r'cause_code')
  String? get causeCode;

  @BuiltValueField(wireName: r'evidence_kind')
  FailureEvidenceKind get evidenceKind;
  // enum evidenceKindEnum {  upstream_response,  transport,  local_validation,  runtime,  unknown,  };

  @BuiltValueField(wireName: r'observed_at')
  DateTime get observedAt;

  @BuiltValueField(wireName: r'retry_after')
  DateTime? get retryAfter;

  @BuiltValueField(wireName: r'diagnostic_ref')
  String? get diagnosticRef;

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
    yield r'phase';
    yield serializers.serialize(
      object.phase,
      specifiedType: const FullType(FailurePhase),
    );
    yield r'scope';
    yield serializers.serialize(
      object.scope,
      specifiedType: const FullType(FailureScope),
    );
    yield r'failure_class';
    yield serializers.serialize(
      object.failureClass,
      specifiedType: const FullType(FailureClass),
    );
    yield r'cause_code';
    yield object.causeCode == null
        ? null
        : serializers.serialize(
            object.causeCode,
            specifiedType: const FullType.nullable(String),
          );
    yield r'evidence_kind';
    yield serializers.serialize(
      object.evidenceKind,
      specifiedType: const FullType(FailureEvidenceKind),
    );
    yield r'observed_at';
    yield serializers.serialize(
      object.observedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'retry_after';
    yield object.retryAfter == null
        ? null
        : serializers.serialize(
            object.retryAfter,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'diagnostic_ref';
    yield object.diagnosticRef == null
        ? null
        : serializers.serialize(
            object.diagnosticRef,
            specifiedType: const FullType.nullable(String),
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
        case r'phase':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FailurePhase),
          ) as FailurePhase;
          result.phase = valueDes;
          break;
        case r'scope':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FailureScope),
          ) as FailureScope;
          result.scope = valueDes;
          break;
        case r'failure_class':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FailureClass),
          ) as FailureClass;
          result.failureClass = valueDes;
          break;
        case r'cause_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.causeCode = valueDes;
          break;
        case r'evidence_kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FailureEvidenceKind),
          ) as FailureEvidenceKind;
          result.evidenceKind = valueDes;
          break;
        case r'observed_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.observedAt = valueDes;
          break;
        case r'retry_after':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.retryAfter = valueDes;
          break;
        case r'diagnostic_ref':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.diagnosticRef = valueDes;
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
