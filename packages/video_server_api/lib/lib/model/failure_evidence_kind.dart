//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'failure_evidence_kind.g.dart';

class FailureEvidenceKind extends EnumClass {
  @BuiltValueEnumConst(wireName: r'upstream_response')
  static const FailureEvidenceKind upstreamResponse = _$upstreamResponse;
  @BuiltValueEnumConst(wireName: r'transport')
  static const FailureEvidenceKind transport = _$transport;
  @BuiltValueEnumConst(wireName: r'local_validation')
  static const FailureEvidenceKind localValidation = _$localValidation;
  @BuiltValueEnumConst(wireName: r'runtime')
  static const FailureEvidenceKind runtime = _$runtime;
  @BuiltValueEnumConst(wireName: r'unknown')
  static const FailureEvidenceKind unknown = _$unknown;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const FailureEvidenceKind unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<FailureEvidenceKind> get serializer =>
      _$failureEvidenceKindSerializer;

  const FailureEvidenceKind._(String name) : super(name);

  static BuiltSet<FailureEvidenceKind> get values => _$values;
  static FailureEvidenceKind valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class FailureEvidenceKindMixin = Object
    with _$FailureEvidenceKindMixin;
