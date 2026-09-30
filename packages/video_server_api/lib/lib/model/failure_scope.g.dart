// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_scope.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FailureScope _$content = const FailureScope._('content');
const FailureScope _$session = const FailureScope._('session');
const FailureScope _$route = const FailureScope._('route');
const FailureScope _$dependency = const FailureScope._('dependency');
const FailureScope _$runtime = const FailureScope._('runtime');
const FailureScope _$unknownDefaultOpenApi =
    const FailureScope._('unknownDefaultOpenApi');

FailureScope _$valueOf(String name) {
  switch (name) {
    case 'content':
      return _$content;
    case 'session':
      return _$session;
    case 'route':
      return _$route;
    case 'dependency':
      return _$dependency;
    case 'runtime':
      return _$runtime;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<FailureScope> _$values =
    BuiltSet<FailureScope>(const <FailureScope>[
  _$content,
  _$session,
  _$route,
  _$dependency,
  _$runtime,
  _$unknownDefaultOpenApi,
]);

class _$FailureScopeMeta {
  const _$FailureScopeMeta();
  FailureScope get content => _$content;
  FailureScope get session => _$session;
  FailureScope get route => _$route;
  FailureScope get dependency => _$dependency;
  FailureScope get runtime => _$runtime;
  FailureScope get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  FailureScope valueOf(String name) => _$valueOf(name);
  BuiltSet<FailureScope> get values => _$values;
}

mixin _$FailureScopeMixin {
  // ignore: non_constant_identifier_names
  _$FailureScopeMeta get FailureScope => const _$FailureScopeMeta();
}

Serializer<FailureScope> _$failureScopeSerializer = _$FailureScopeSerializer();

class _$FailureScopeSerializer implements PrimitiveSerializer<FailureScope> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'content': 'content',
    'session': 'session',
    'route': 'route',
    'dependency': 'dependency',
    'runtime': 'runtime',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'content': 'content',
    'session': 'session',
    'route': 'route',
    'dependency': 'dependency',
    'runtime': 'runtime',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[FailureScope];
  @override
  final String wireName = 'FailureScope';

  @override
  Object serialize(Serializers serializers, FailureScope object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FailureScope deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FailureScope.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
