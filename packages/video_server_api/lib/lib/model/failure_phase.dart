//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'failure_phase.g.dart';

class FailurePhase extends EnumClass {
  @BuiltValueEnumConst(wireName: r'recognize')
  static const FailurePhase recognize = _$recognize;
  @BuiltValueEnumConst(wireName: r'prepare_context')
  static const FailurePhase prepareContext = _$prepareContext;
  @BuiltValueEnumConst(wireName: r'fetch_metadata')
  static const FailurePhase fetchMetadata = _$fetchMetadata;
  @BuiltValueEnumConst(wireName: r'select_format')
  static const FailurePhase selectFormat = _$selectFormat;
  @BuiltValueEnumConst(wireName: r'probe_media')
  static const FailurePhase probeMedia = _$probeMedia;
  @BuiltValueEnumConst(wireName: r'transfer')
  static const FailurePhase transfer = _$transfer;
  @BuiltValueEnumConst(wireName: r'validate')
  static const FailurePhase validate = _$validate;
  @BuiltValueEnumConst(wireName: r'publish')
  static const FailurePhase publish = _$publish;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const FailurePhase unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<FailurePhase> get serializer => _$failurePhaseSerializer;

  const FailurePhase._(String name) : super(name);

  static BuiltSet<FailurePhase> get values => _$values;
  static FailurePhase valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class FailurePhaseMixin = Object with _$FailurePhaseMixin;
