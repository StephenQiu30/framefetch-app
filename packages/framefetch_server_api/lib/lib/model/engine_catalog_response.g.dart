// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engine_catalog_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EngineCatalogResponseScopeEnum
    _$engineCatalogResponseScopeEnum_anonymousRunner =
    const EngineCatalogResponseScopeEnum._('anonymousRunner');
const EngineCatalogResponseScopeEnum
    _$engineCatalogResponseScopeEnum_unknownDefaultOpenApi =
    const EngineCatalogResponseScopeEnum._('unknownDefaultOpenApi');

EngineCatalogResponseScopeEnum _$engineCatalogResponseScopeEnumValueOf(
    String name) {
  switch (name) {
    case 'anonymousRunner':
      return _$engineCatalogResponseScopeEnum_anonymousRunner;
    case 'unknownDefaultOpenApi':
      return _$engineCatalogResponseScopeEnum_unknownDefaultOpenApi;
    default:
      return _$engineCatalogResponseScopeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<EngineCatalogResponseScopeEnum>
    _$engineCatalogResponseScopeEnumValues = BuiltSet<
        EngineCatalogResponseScopeEnum>(const <EngineCatalogResponseScopeEnum>[
  _$engineCatalogResponseScopeEnum_anonymousRunner,
  _$engineCatalogResponseScopeEnum_unknownDefaultOpenApi,
]);

Serializer<EngineCatalogResponseScopeEnum>
    _$engineCatalogResponseScopeEnumSerializer =
    _$EngineCatalogResponseScopeEnumSerializer();

class _$EngineCatalogResponseScopeEnumSerializer
    implements PrimitiveSerializer<EngineCatalogResponseScopeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'anonymousRunner': 'anonymous_runner',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'anonymous_runner': 'anonymousRunner',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[EngineCatalogResponseScopeEnum];
  @override
  final String wireName = 'EngineCatalogResponseScopeEnum';

  @override
  Object serialize(
          Serializers serializers, EngineCatalogResponseScopeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EngineCatalogResponseScopeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EngineCatalogResponseScopeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$EngineCatalogResponse extends EngineCatalogResponse {
  @override
  final EngineCatalogResponseScopeEnum? scope;
  @override
  final String engineVersion;
  @override
  final String? engineCommit;
  @override
  final String expectedEngineCommit;
  @override
  final bool pinMatches;
  @override
  final String bundledPluginsSha256;
  @override
  final String? potProviderVersion;
  @override
  final String manifestId;
  @override
  final BuiltList<EngineCandidateResponse> candidates;

  factory _$EngineCatalogResponse(
          [void Function(EngineCatalogResponseBuilder)? updates]) =>
      (EngineCatalogResponseBuilder()..update(updates))._build();

  _$EngineCatalogResponse._(
      {this.scope,
      required this.engineVersion,
      this.engineCommit,
      required this.expectedEngineCommit,
      required this.pinMatches,
      required this.bundledPluginsSha256,
      this.potProviderVersion,
      required this.manifestId,
      required this.candidates})
      : super._();
  @override
  EngineCatalogResponse rebuild(
          void Function(EngineCatalogResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EngineCatalogResponseBuilder toBuilder() =>
      EngineCatalogResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EngineCatalogResponse &&
        scope == other.scope &&
        engineVersion == other.engineVersion &&
        engineCommit == other.engineCommit &&
        expectedEngineCommit == other.expectedEngineCommit &&
        pinMatches == other.pinMatches &&
        bundledPluginsSha256 == other.bundledPluginsSha256 &&
        potProviderVersion == other.potProviderVersion &&
        manifestId == other.manifestId &&
        candidates == other.candidates;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, scope.hashCode);
    _$hash = $jc(_$hash, engineVersion.hashCode);
    _$hash = $jc(_$hash, engineCommit.hashCode);
    _$hash = $jc(_$hash, expectedEngineCommit.hashCode);
    _$hash = $jc(_$hash, pinMatches.hashCode);
    _$hash = $jc(_$hash, bundledPluginsSha256.hashCode);
    _$hash = $jc(_$hash, potProviderVersion.hashCode);
    _$hash = $jc(_$hash, manifestId.hashCode);
    _$hash = $jc(_$hash, candidates.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EngineCatalogResponse')
          ..add('scope', scope)
          ..add('engineVersion', engineVersion)
          ..add('engineCommit', engineCommit)
          ..add('expectedEngineCommit', expectedEngineCommit)
          ..add('pinMatches', pinMatches)
          ..add('bundledPluginsSha256', bundledPluginsSha256)
          ..add('potProviderVersion', potProviderVersion)
          ..add('manifestId', manifestId)
          ..add('candidates', candidates))
        .toString();
  }
}

class EngineCatalogResponseBuilder
    implements Builder<EngineCatalogResponse, EngineCatalogResponseBuilder> {
  _$EngineCatalogResponse? _$v;

  EngineCatalogResponseScopeEnum? _scope;
  EngineCatalogResponseScopeEnum? get scope => _$this._scope;
  set scope(EngineCatalogResponseScopeEnum? scope) => _$this._scope = scope;

  String? _engineVersion;
  String? get engineVersion => _$this._engineVersion;
  set engineVersion(String? engineVersion) =>
      _$this._engineVersion = engineVersion;

  String? _engineCommit;
  String? get engineCommit => _$this._engineCommit;
  set engineCommit(String? engineCommit) => _$this._engineCommit = engineCommit;

  String? _expectedEngineCommit;
  String? get expectedEngineCommit => _$this._expectedEngineCommit;
  set expectedEngineCommit(String? expectedEngineCommit) =>
      _$this._expectedEngineCommit = expectedEngineCommit;

  bool? _pinMatches;
  bool? get pinMatches => _$this._pinMatches;
  set pinMatches(bool? pinMatches) => _$this._pinMatches = pinMatches;

  String? _bundledPluginsSha256;
  String? get bundledPluginsSha256 => _$this._bundledPluginsSha256;
  set bundledPluginsSha256(String? bundledPluginsSha256) =>
      _$this._bundledPluginsSha256 = bundledPluginsSha256;

  String? _potProviderVersion;
  String? get potProviderVersion => _$this._potProviderVersion;
  set potProviderVersion(String? potProviderVersion) =>
      _$this._potProviderVersion = potProviderVersion;

  String? _manifestId;
  String? get manifestId => _$this._manifestId;
  set manifestId(String? manifestId) => _$this._manifestId = manifestId;

  ListBuilder<EngineCandidateResponse>? _candidates;
  ListBuilder<EngineCandidateResponse> get candidates =>
      _$this._candidates ??= ListBuilder<EngineCandidateResponse>();
  set candidates(ListBuilder<EngineCandidateResponse>? candidates) =>
      _$this._candidates = candidates;

  EngineCatalogResponseBuilder() {
    EngineCatalogResponse._defaults(this);
  }

  EngineCatalogResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _scope = $v.scope;
      _engineVersion = $v.engineVersion;
      _engineCommit = $v.engineCommit;
      _expectedEngineCommit = $v.expectedEngineCommit;
      _pinMatches = $v.pinMatches;
      _bundledPluginsSha256 = $v.bundledPluginsSha256;
      _potProviderVersion = $v.potProviderVersion;
      _manifestId = $v.manifestId;
      _candidates = $v.candidates.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EngineCatalogResponse other) {
    _$v = other as _$EngineCatalogResponse;
  }

  @override
  void update(void Function(EngineCatalogResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EngineCatalogResponse build() => _build();

  _$EngineCatalogResponse _build() {
    _$EngineCatalogResponse _$result;
    try {
      _$result = _$v ??
          _$EngineCatalogResponse._(
            scope: scope,
            engineVersion: BuiltValueNullFieldError.checkNotNull(
                engineVersion, r'EngineCatalogResponse', 'engineVersion'),
            engineCommit: engineCommit,
            expectedEngineCommit: BuiltValueNullFieldError.checkNotNull(
                expectedEngineCommit,
                r'EngineCatalogResponse',
                'expectedEngineCommit'),
            pinMatches: BuiltValueNullFieldError.checkNotNull(
                pinMatches, r'EngineCatalogResponse', 'pinMatches'),
            bundledPluginsSha256: BuiltValueNullFieldError.checkNotNull(
                bundledPluginsSha256,
                r'EngineCatalogResponse',
                'bundledPluginsSha256'),
            potProviderVersion: potProviderVersion,
            manifestId: BuiltValueNullFieldError.checkNotNull(
                manifestId, r'EngineCatalogResponse', 'manifestId'),
            candidates: candidates.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'candidates';
        candidates.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EngineCatalogResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
