//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_support_status.g.dart';

class ProviderSupportStatus extends EnumClass {
  @BuiltValueEnumConst(wireName: r'unknown')
  static const ProviderSupportStatus unknown = _$unknown;
  @BuiltValueEnumConst(wireName: r'disabled')
  static const ProviderSupportStatus disabled = _$disabled;
  @BuiltValueEnumConst(wireName: r'unsupported')
  static const ProviderSupportStatus unsupported = _$unsupported;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ProviderSupportStatus unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<ProviderSupportStatus> get serializer =>
      _$providerSupportStatusSerializer;

  const ProviderSupportStatus._(String name) : super(name);

  static BuiltSet<ProviderSupportStatus> get values => _$values;
  static ProviderSupportStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ProviderSupportStatusMixin = Object
    with _$ProviderSupportStatusMixin;
