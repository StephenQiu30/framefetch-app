// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_class.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FailureClass _$networkBlocked = const FailureClass._('networkBlocked');
const FailureClass _$challenge = const FailureClass._('challenge');
const FailureClass _$loginRequired = const FailureClass._('loginRequired');
const FailureClass _$identityUnavailable =
    const FailureClass._('identityUnavailable');
const FailureClass _$rateLimited = const FailureClass._('rateLimited');
const FailureClass _$contextChanged = const FailureClass._('contextChanged');
const FailureClass _$contentUnavailable =
    const FailureClass._('contentUnavailable');
const FailureClass _$contentProtected =
    const FailureClass._('contentProtected');
const FailureClass _$extractorBroken = const FailureClass._('extractorBroken');
const FailureClass _$formatUnavailable =
    const FailureClass._('formatUnavailable');
const FailureClass _$transient = const FailureClass._('transient');
const FailureClass _$invalidInput = const FailureClass._('invalidInput');
const FailureClass _$runtimeUnavailable =
    const FailureClass._('runtimeUnavailable');
const FailureClass _$unknownDefaultOpenApi =
    const FailureClass._('unknownDefaultOpenApi');

FailureClass _$valueOf(String name) {
  switch (name) {
    case 'networkBlocked':
      return _$networkBlocked;
    case 'challenge':
      return _$challenge;
    case 'loginRequired':
      return _$loginRequired;
    case 'identityUnavailable':
      return _$identityUnavailable;
    case 'rateLimited':
      return _$rateLimited;
    case 'contextChanged':
      return _$contextChanged;
    case 'contentUnavailable':
      return _$contentUnavailable;
    case 'contentProtected':
      return _$contentProtected;
    case 'extractorBroken':
      return _$extractorBroken;
    case 'formatUnavailable':
      return _$formatUnavailable;
    case 'transient':
      return _$transient;
    case 'invalidInput':
      return _$invalidInput;
    case 'runtimeUnavailable':
      return _$runtimeUnavailable;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<FailureClass> _$values =
    BuiltSet<FailureClass>(const <FailureClass>[
  _$networkBlocked,
  _$challenge,
  _$loginRequired,
  _$identityUnavailable,
  _$rateLimited,
  _$contextChanged,
  _$contentUnavailable,
  _$contentProtected,
  _$extractorBroken,
  _$formatUnavailable,
  _$transient,
  _$invalidInput,
  _$runtimeUnavailable,
  _$unknownDefaultOpenApi,
]);

class _$FailureClassMeta {
  const _$FailureClassMeta();
  FailureClass get networkBlocked => _$networkBlocked;
  FailureClass get challenge => _$challenge;
  FailureClass get loginRequired => _$loginRequired;
  FailureClass get identityUnavailable => _$identityUnavailable;
  FailureClass get rateLimited => _$rateLimited;
  FailureClass get contextChanged => _$contextChanged;
  FailureClass get contentUnavailable => _$contentUnavailable;
  FailureClass get contentProtected => _$contentProtected;
  FailureClass get extractorBroken => _$extractorBroken;
  FailureClass get formatUnavailable => _$formatUnavailable;
  FailureClass get transient => _$transient;
  FailureClass get invalidInput => _$invalidInput;
  FailureClass get runtimeUnavailable => _$runtimeUnavailable;
  FailureClass get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  FailureClass valueOf(String name) => _$valueOf(name);
  BuiltSet<FailureClass> get values => _$values;
}

mixin _$FailureClassMixin {
  // ignore: non_constant_identifier_names
  _$FailureClassMeta get FailureClass => const _$FailureClassMeta();
}

Serializer<FailureClass> _$failureClassSerializer = _$FailureClassSerializer();

class _$FailureClassSerializer implements PrimitiveSerializer<FailureClass> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'networkBlocked': 'network_blocked',
    'challenge': 'challenge',
    'loginRequired': 'login_required',
    'identityUnavailable': 'identity_unavailable',
    'rateLimited': 'rate_limited',
    'contextChanged': 'context_changed',
    'contentUnavailable': 'content_unavailable',
    'contentProtected': 'content_protected',
    'extractorBroken': 'extractor_broken',
    'formatUnavailable': 'format_unavailable',
    'transient': 'transient',
    'invalidInput': 'invalid_input',
    'runtimeUnavailable': 'runtime_unavailable',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'network_blocked': 'networkBlocked',
    'challenge': 'challenge',
    'login_required': 'loginRequired',
    'identity_unavailable': 'identityUnavailable',
    'rate_limited': 'rateLimited',
    'context_changed': 'contextChanged',
    'content_unavailable': 'contentUnavailable',
    'content_protected': 'contentProtected',
    'extractor_broken': 'extractorBroken',
    'format_unavailable': 'formatUnavailable',
    'transient': 'transient',
    'invalid_input': 'invalidInput',
    'runtime_unavailable': 'runtimeUnavailable',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[FailureClass];
  @override
  final String wireName = 'FailureClass';

  @override
  Object serialize(Serializers serializers, FailureClass object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FailureClass deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FailureClass.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
