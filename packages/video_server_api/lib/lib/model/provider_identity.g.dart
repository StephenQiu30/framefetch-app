// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_identity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderIdentity _$none = const ProviderIdentity._('none');
const ProviderIdentity _$prefer = const ProviderIdentity._('prefer');
const ProviderIdentity _$required_ = const ProviderIdentity._('required_');
const ProviderIdentity _$unknownDefaultOpenApi =
    const ProviderIdentity._('unknownDefaultOpenApi');

ProviderIdentity _$valueOf(String name) {
  switch (name) {
    case 'none':
      return _$none;
    case 'prefer':
      return _$prefer;
    case 'required_':
      return _$required_;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderIdentity> _$values =
    BuiltSet<ProviderIdentity>(const <ProviderIdentity>[
  _$none,
  _$prefer,
  _$required_,
  _$unknownDefaultOpenApi,
]);

class _$ProviderIdentityMeta {
  const _$ProviderIdentityMeta();
  ProviderIdentity get none => _$none;
  ProviderIdentity get prefer => _$prefer;
  ProviderIdentity get required_ => _$required_;
  ProviderIdentity get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ProviderIdentity valueOf(String name) => _$valueOf(name);
  BuiltSet<ProviderIdentity> get values => _$values;
}

mixin _$ProviderIdentityMixin {
  // ignore: non_constant_identifier_names
  _$ProviderIdentityMeta get ProviderIdentity => const _$ProviderIdentityMeta();
}

Serializer<ProviderIdentity> _$providerIdentitySerializer =
    _$ProviderIdentitySerializer();

class _$ProviderIdentitySerializer
    implements PrimitiveSerializer<ProviderIdentity> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'none': 'none',
    'prefer': 'prefer',
    'required_': 'required',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'none': 'none',
    'prefer': 'prefer',
    'required': 'required_',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProviderIdentity];
  @override
  final String wireName = 'ProviderIdentity';

  @override
  Object serialize(Serializers serializers, ProviderIdentity object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderIdentity deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderIdentity.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
