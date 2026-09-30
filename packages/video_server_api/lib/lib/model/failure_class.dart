//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'failure_class.g.dart';

class FailureClass extends EnumClass {
  @BuiltValueEnumConst(wireName: r'auth_required')
  static const FailureClass authRequired = _$authRequired;
  @BuiltValueEnumConst(wireName: r'session_expired')
  static const FailureClass sessionExpired = _$sessionExpired;
  @BuiltValueEnumConst(wireName: r'challenge_required')
  static const FailureClass challengeRequired = _$challengeRequired;
  @BuiltValueEnumConst(wireName: r'token_unavailable')
  static const FailureClass tokenUnavailable = _$tokenUnavailable;
  @BuiltValueEnumConst(wireName: r'token_rejected')
  static const FailureClass tokenRejected = _$tokenRejected;
  @BuiltValueEnumConst(wireName: r'extractor_changed')
  static const FailureClass extractorChanged = _$extractorChanged;
  @BuiltValueEnumConst(wireName: r'protocol_unavailable')
  static const FailureClass protocolUnavailable = _$protocolUnavailable;
  @BuiltValueEnumConst(wireName: r'format_unavailable')
  static const FailureClass formatUnavailable = _$formatUnavailable;
  @BuiltValueEnumConst(wireName: r'media_probe_failed')
  static const FailureClass mediaProbeFailed = _$mediaProbeFailed;
  @BuiltValueEnumConst(wireName: r'egress_denied')
  static const FailureClass egressDenied = _$egressDenied;
  @BuiltValueEnumConst(wireName: r'network_transient')
  static const FailureClass networkTransient = _$networkTransient;
  @BuiltValueEnumConst(wireName: r'rate_limited')
  static const FailureClass rateLimited = _$rateLimited;
  @BuiltValueEnumConst(wireName: r'content_unavailable')
  static const FailureClass contentUnavailable = _$contentUnavailable;
  @BuiltValueEnumConst(wireName: r'content_restricted')
  static const FailureClass contentRestricted = _$contentRestricted;
  @BuiltValueEnumConst(wireName: r'context_changed')
  static const FailureClass contextChanged = _$contextChanged;
  @BuiltValueEnumConst(wireName: r'runtime_unavailable')
  static const FailureClass runtimeUnavailable = _$runtimeUnavailable;
  @BuiltValueEnumConst(wireName: r'capacity_exhausted')
  static const FailureClass capacityExhausted = _$capacityExhausted;
  @BuiltValueEnumConst(wireName: r'invalid_input')
  static const FailureClass invalidInput = _$invalidInput;
  @BuiltValueEnumConst(wireName: r'source_unsupported')
  static const FailureClass sourceUnsupported = _$sourceUnsupported;
  @BuiltValueEnumConst(wireName: r'artifact_invalid')
  static const FailureClass artifactInvalid = _$artifactInvalid;
  @BuiltValueEnumConst(wireName: r'storage_unavailable')
  static const FailureClass storageUnavailable = _$storageUnavailable;
  @BuiltValueEnumConst(wireName: r'outcome_unknown')
  static const FailureClass outcomeUnknown = _$outcomeUnknown;
  @BuiltValueEnumConst(wireName: r'upstream_unclassified')
  static const FailureClass upstreamUnclassified = _$upstreamUnclassified;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const FailureClass unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<FailureClass> get serializer => _$failureClassSerializer;

  const FailureClass._(String name) : super(name);

  static BuiltSet<FailureClass> get values => _$values;
  static FailureClass valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class FailureClassMixin = Object with _$FailureClassMixin;
