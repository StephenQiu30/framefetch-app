//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'failure_scope.g.dart';

class FailureScope extends EnumClass {
  @BuiltValueEnumConst(wireName: r'content')
  static const FailureScope content = _$content;
  @BuiltValueEnumConst(wireName: r'session')
  static const FailureScope session = _$session;
  @BuiltValueEnumConst(wireName: r'route')
  static const FailureScope route = _$route;
  @BuiltValueEnumConst(wireName: r'dependency')
  static const FailureScope dependency = _$dependency;
  @BuiltValueEnumConst(wireName: r'runtime')
  static const FailureScope runtime = _$runtime;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const FailureScope unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<FailureScope> get serializer => _$failureScopeSerializer;

  const FailureScope._(String name) : super(name);

  static BuiltSet<FailureScope> get values => _$values;
  static FailureScope valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class FailureScopeMixin = Object with _$FailureScopeMixin;
