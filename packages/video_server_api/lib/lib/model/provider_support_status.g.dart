// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_support_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderSupportStatus _$unknown =
    const ProviderSupportStatus._('unknown');
const ProviderSupportStatus _$disabled =
    const ProviderSupportStatus._('disabled');
const ProviderSupportStatus _$unsupported =
    const ProviderSupportStatus._('unsupported');
const ProviderSupportStatus _$unknownDefaultOpenApi =
    const ProviderSupportStatus._('unknownDefaultOpenApi');

ProviderSupportStatus _$valueOf(String name) {
  switch (name) {
    case 'unknown':
      return _$unknown;
    case 'disabled':
      return _$disabled;
    case 'unsupported':
      return _$unsupported;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderSupportStatus> _$values =
    BuiltSet<ProviderSupportStatus>(const <ProviderSupportStatus>[
  _$unknown,
  _$disabled,
  _$unsupported,
  _$unknownDefaultOpenApi,
]);

class _$ProviderSupportStatusMeta {
  const _$ProviderSupportStatusMeta();
  ProviderSupportStatus get unknown => _$unknown;
  ProviderSupportStatus get disabled => _$disabled;
  ProviderSupportStatus get unsupported => _$unsupported;
  ProviderSupportStatus get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ProviderSupportStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ProviderSupportStatus> get values => _$values;
}

mixin _$ProviderSupportStatusMixin {
  // ignore: non_constant_identifier_names
  _$ProviderSupportStatusMeta get ProviderSupportStatus =>
      const _$ProviderSupportStatusMeta();
}

Serializer<ProviderSupportStatus> _$providerSupportStatusSerializer =
    _$ProviderSupportStatusSerializer();

class _$ProviderSupportStatusSerializer
    implements PrimitiveSerializer<ProviderSupportStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'unknown': 'unknown',
    'disabled': 'disabled',
    'unsupported': 'unsupported',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'unknown': 'unknown',
    'disabled': 'disabled',
    'unsupported': 'unsupported',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProviderSupportStatus];
  @override
  final String wireName = 'ProviderSupportStatus';

  @override
  Object serialize(Serializers serializers, ProviderSupportStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderSupportStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderSupportStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
