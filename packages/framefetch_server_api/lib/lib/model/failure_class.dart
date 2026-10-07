//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'failure_class.g.dart';

class FailureClass extends EnumClass {
  @BuiltValueEnumConst(wireName: r'network_blocked')
  static const FailureClass networkBlocked = _$networkBlocked;
  @BuiltValueEnumConst(wireName: r'challenge')
  static const FailureClass challenge = _$challenge;
  @BuiltValueEnumConst(wireName: r'login_required')
  static const FailureClass loginRequired = _$loginRequired;
  @BuiltValueEnumConst(wireName: r'identity_unavailable')
  static const FailureClass identityUnavailable = _$identityUnavailable;
  @BuiltValueEnumConst(wireName: r'rate_limited')
  static const FailureClass rateLimited = _$rateLimited;
  @BuiltValueEnumConst(wireName: r'context_changed')
  static const FailureClass contextChanged = _$contextChanged;
  @BuiltValueEnumConst(wireName: r'content_unavailable')
  static const FailureClass contentUnavailable = _$contentUnavailable;
  @BuiltValueEnumConst(wireName: r'content_protected')
  static const FailureClass contentProtected = _$contentProtected;
  @BuiltValueEnumConst(wireName: r'extractor_broken')
  static const FailureClass extractorBroken = _$extractorBroken;
  @BuiltValueEnumConst(wireName: r'format_unavailable')
  static const FailureClass formatUnavailable = _$formatUnavailable;
  @BuiltValueEnumConst(wireName: r'transient')
  static const FailureClass transient = _$transient;
  @BuiltValueEnumConst(wireName: r'invalid_input')
  static const FailureClass invalidInput = _$invalidInput;
  @BuiltValueEnumConst(wireName: r'runtime_unavailable')
  static const FailureClass runtimeUnavailable = _$runtimeUnavailable;
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
