// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_runtime_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderRuntimeResponseLoginStateEnum
    _$providerRuntimeResponseLoginStateEnum_notRequired =
    const ProviderRuntimeResponseLoginStateEnum._('notRequired');
const ProviderRuntimeResponseLoginStateEnum
    _$providerRuntimeResponseLoginStateEnum_signedIn =
    const ProviderRuntimeResponseLoginStateEnum._('signedIn');
const ProviderRuntimeResponseLoginStateEnum
    _$providerRuntimeResponseLoginStateEnum_unavailable =
    const ProviderRuntimeResponseLoginStateEnum._('unavailable');
const ProviderRuntimeResponseLoginStateEnum
    _$providerRuntimeResponseLoginStateEnum_unknownDefaultOpenApi =
    const ProviderRuntimeResponseLoginStateEnum._('unknownDefaultOpenApi');

ProviderRuntimeResponseLoginStateEnum
    _$providerRuntimeResponseLoginStateEnumValueOf(String name) {
  switch (name) {
    case 'notRequired':
      return _$providerRuntimeResponseLoginStateEnum_notRequired;
    case 'signedIn':
      return _$providerRuntimeResponseLoginStateEnum_signedIn;
    case 'unavailable':
      return _$providerRuntimeResponseLoginStateEnum_unavailable;
    case 'unknownDefaultOpenApi':
      return _$providerRuntimeResponseLoginStateEnum_unknownDefaultOpenApi;
    default:
      return _$providerRuntimeResponseLoginStateEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderRuntimeResponseLoginStateEnum>
    _$providerRuntimeResponseLoginStateEnumValues = BuiltSet<
        ProviderRuntimeResponseLoginStateEnum>(const <ProviderRuntimeResponseLoginStateEnum>[
  _$providerRuntimeResponseLoginStateEnum_notRequired,
  _$providerRuntimeResponseLoginStateEnum_signedIn,
  _$providerRuntimeResponseLoginStateEnum_unavailable,
  _$providerRuntimeResponseLoginStateEnum_unknownDefaultOpenApi,
]);

const ProviderRuntimeResponseSourceStateEnum
    _$providerRuntimeResponseSourceStateEnum_notRequired =
    const ProviderRuntimeResponseSourceStateEnum._('notRequired');
const ProviderRuntimeResponseSourceStateEnum
    _$providerRuntimeResponseSourceStateEnum_revisionObserved =
    const ProviderRuntimeResponseSourceStateEnum._('revisionObserved');
const ProviderRuntimeResponseSourceStateEnum
    _$providerRuntimeResponseSourceStateEnum_notObserved =
    const ProviderRuntimeResponseSourceStateEnum._('notObserved');
const ProviderRuntimeResponseSourceStateEnum
    _$providerRuntimeResponseSourceStateEnum_unknown =
    const ProviderRuntimeResponseSourceStateEnum._('unknown');
const ProviderRuntimeResponseSourceStateEnum
    _$providerRuntimeResponseSourceStateEnum_unknownDefaultOpenApi =
    const ProviderRuntimeResponseSourceStateEnum._('unknownDefaultOpenApi');

ProviderRuntimeResponseSourceStateEnum
    _$providerRuntimeResponseSourceStateEnumValueOf(String name) {
  switch (name) {
    case 'notRequired':
      return _$providerRuntimeResponseSourceStateEnum_notRequired;
    case 'revisionObserved':
      return _$providerRuntimeResponseSourceStateEnum_revisionObserved;
    case 'notObserved':
      return _$providerRuntimeResponseSourceStateEnum_notObserved;
    case 'unknown':
      return _$providerRuntimeResponseSourceStateEnum_unknown;
    case 'unknownDefaultOpenApi':
      return _$providerRuntimeResponseSourceStateEnum_unknownDefaultOpenApi;
    default:
      return _$providerRuntimeResponseSourceStateEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderRuntimeResponseSourceStateEnum>
    _$providerRuntimeResponseSourceStateEnumValues = BuiltSet<
        ProviderRuntimeResponseSourceStateEnum>(const <ProviderRuntimeResponseSourceStateEnum>[
  _$providerRuntimeResponseSourceStateEnum_notRequired,
  _$providerRuntimeResponseSourceStateEnum_revisionObserved,
  _$providerRuntimeResponseSourceStateEnum_notObserved,
  _$providerRuntimeResponseSourceStateEnum_unknown,
  _$providerRuntimeResponseSourceStateEnum_unknownDefaultOpenApi,
]);

Serializer<ProviderRuntimeResponseLoginStateEnum>
    _$providerRuntimeResponseLoginStateEnumSerializer =
    _$ProviderRuntimeResponseLoginStateEnumSerializer();
Serializer<ProviderRuntimeResponseSourceStateEnum>
    _$providerRuntimeResponseSourceStateEnumSerializer =
    _$ProviderRuntimeResponseSourceStateEnumSerializer();

class _$ProviderRuntimeResponseLoginStateEnumSerializer
    implements PrimitiveSerializer<ProviderRuntimeResponseLoginStateEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'notRequired': 'not_required',
    'signedIn': 'signed_in',
    'unavailable': 'unavailable',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'not_required': 'notRequired',
    'signed_in': 'signedIn',
    'unavailable': 'unavailable',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ProviderRuntimeResponseLoginStateEnum
  ];
  @override
  final String wireName = 'ProviderRuntimeResponseLoginStateEnum';

  @override
  Object serialize(
          Serializers serializers, ProviderRuntimeResponseLoginStateEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderRuntimeResponseLoginStateEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderRuntimeResponseLoginStateEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ProviderRuntimeResponseSourceStateEnumSerializer
    implements PrimitiveSerializer<ProviderRuntimeResponseSourceStateEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'notRequired': 'not_required',
    'revisionObserved': 'revision_observed',
    'notObserved': 'not_observed',
    'unknown': 'unknown',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'not_required': 'notRequired',
    'revision_observed': 'revisionObserved',
    'not_observed': 'notObserved',
    'unknown': 'unknown',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ProviderRuntimeResponseSourceStateEnum
  ];
  @override
  final String wireName = 'ProviderRuntimeResponseSourceStateEnum';

  @override
  Object serialize(Serializers serializers,
          ProviderRuntimeResponseSourceStateEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderRuntimeResponseSourceStateEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderRuntimeResponseSourceStateEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ProviderRuntimeResponse extends ProviderRuntimeResponse {
  @override
  final ProviderRuntimeResponseLoginStateEnum loginState;
  @override
  final String? sessionSite;
  @override
  final String providerKey;
  @override
  final ProviderAccessPolicy? accessPolicyId;
  @override
  final bool routeConfigured;
  @override
  final bool contextAvailable;
  @override
  final String? profileVersion;
  @override
  final String? engineCommit;
  @override
  final ProviderRuntimeResponseSourceStateEnum sourceState;
  @override
  final ProviderEvidenceState evidenceState;
  @override
  final DateTime? lastMediaVerifiedAt;
  @override
  final String? userAction;
  @override
  final DateTime? routeRetryAt;

  factory _$ProviderRuntimeResponse(
          [void Function(ProviderRuntimeResponseBuilder)? updates]) =>
      (ProviderRuntimeResponseBuilder()..update(updates))._build();

  _$ProviderRuntimeResponse._(
      {required this.loginState,
      this.sessionSite,
      required this.providerKey,
      this.accessPolicyId,
      required this.routeConfigured,
      required this.contextAvailable,
      this.profileVersion,
      this.engineCommit,
      required this.sourceState,
      required this.evidenceState,
      this.lastMediaVerifiedAt,
      this.userAction,
      this.routeRetryAt})
      : super._();
  @override
  ProviderRuntimeResponse rebuild(
          void Function(ProviderRuntimeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderRuntimeResponseBuilder toBuilder() =>
      ProviderRuntimeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProviderRuntimeResponse &&
        loginState == other.loginState &&
        sessionSite == other.sessionSite &&
        providerKey == other.providerKey &&
        accessPolicyId == other.accessPolicyId &&
        routeConfigured == other.routeConfigured &&
        contextAvailable == other.contextAvailable &&
        profileVersion == other.profileVersion &&
        engineCommit == other.engineCommit &&
        sourceState == other.sourceState &&
        evidenceState == other.evidenceState &&
        lastMediaVerifiedAt == other.lastMediaVerifiedAt &&
        userAction == other.userAction &&
        routeRetryAt == other.routeRetryAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, loginState.hashCode);
    _$hash = $jc(_$hash, sessionSite.hashCode);
    _$hash = $jc(_$hash, providerKey.hashCode);
    _$hash = $jc(_$hash, accessPolicyId.hashCode);
    _$hash = $jc(_$hash, routeConfigured.hashCode);
    _$hash = $jc(_$hash, contextAvailable.hashCode);
    _$hash = $jc(_$hash, profileVersion.hashCode);
    _$hash = $jc(_$hash, engineCommit.hashCode);
    _$hash = $jc(_$hash, sourceState.hashCode);
    _$hash = $jc(_$hash, evidenceState.hashCode);
    _$hash = $jc(_$hash, lastMediaVerifiedAt.hashCode);
    _$hash = $jc(_$hash, userAction.hashCode);
    _$hash = $jc(_$hash, routeRetryAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProviderRuntimeResponse')
          ..add('loginState', loginState)
          ..add('sessionSite', sessionSite)
          ..add('providerKey', providerKey)
          ..add('accessPolicyId', accessPolicyId)
          ..add('routeConfigured', routeConfigured)
          ..add('contextAvailable', contextAvailable)
          ..add('profileVersion', profileVersion)
          ..add('engineCommit', engineCommit)
          ..add('sourceState', sourceState)
          ..add('evidenceState', evidenceState)
          ..add('lastMediaVerifiedAt', lastMediaVerifiedAt)
          ..add('userAction', userAction)
          ..add('routeRetryAt', routeRetryAt))
        .toString();
  }
}

class ProviderRuntimeResponseBuilder
    implements
        Builder<ProviderRuntimeResponse, ProviderRuntimeResponseBuilder> {
  _$ProviderRuntimeResponse? _$v;

  ProviderRuntimeResponseLoginStateEnum? _loginState;
  ProviderRuntimeResponseLoginStateEnum? get loginState => _$this._loginState;
  set loginState(ProviderRuntimeResponseLoginStateEnum? loginState) =>
      _$this._loginState = loginState;

  String? _sessionSite;
  String? get sessionSite => _$this._sessionSite;
  set sessionSite(String? sessionSite) => _$this._sessionSite = sessionSite;

  String? _providerKey;
  String? get providerKey => _$this._providerKey;
  set providerKey(String? providerKey) => _$this._providerKey = providerKey;

  ProviderAccessPolicy? _accessPolicyId;
  ProviderAccessPolicy? get accessPolicyId => _$this._accessPolicyId;
  set accessPolicyId(ProviderAccessPolicy? accessPolicyId) =>
      _$this._accessPolicyId = accessPolicyId;

  bool? _routeConfigured;
  bool? get routeConfigured => _$this._routeConfigured;
  set routeConfigured(bool? routeConfigured) =>
      _$this._routeConfigured = routeConfigured;

  bool? _contextAvailable;
  bool? get contextAvailable => _$this._contextAvailable;
  set contextAvailable(bool? contextAvailable) =>
      _$this._contextAvailable = contextAvailable;

  String? _profileVersion;
  String? get profileVersion => _$this._profileVersion;
  set profileVersion(String? profileVersion) =>
      _$this._profileVersion = profileVersion;

  String? _engineCommit;
  String? get engineCommit => _$this._engineCommit;
  set engineCommit(String? engineCommit) => _$this._engineCommit = engineCommit;

  ProviderRuntimeResponseSourceStateEnum? _sourceState;
  ProviderRuntimeResponseSourceStateEnum? get sourceState =>
      _$this._sourceState;
  set sourceState(ProviderRuntimeResponseSourceStateEnum? sourceState) =>
      _$this._sourceState = sourceState;

  ProviderEvidenceState? _evidenceState;
  ProviderEvidenceState? get evidenceState => _$this._evidenceState;
  set evidenceState(ProviderEvidenceState? evidenceState) =>
      _$this._evidenceState = evidenceState;

  DateTime? _lastMediaVerifiedAt;
  DateTime? get lastMediaVerifiedAt => _$this._lastMediaVerifiedAt;
  set lastMediaVerifiedAt(DateTime? lastMediaVerifiedAt) =>
      _$this._lastMediaVerifiedAt = lastMediaVerifiedAt;

  String? _userAction;
  String? get userAction => _$this._userAction;
  set userAction(String? userAction) => _$this._userAction = userAction;

  DateTime? _routeRetryAt;
  DateTime? get routeRetryAt => _$this._routeRetryAt;
  set routeRetryAt(DateTime? routeRetryAt) =>
      _$this._routeRetryAt = routeRetryAt;

  ProviderRuntimeResponseBuilder() {
    ProviderRuntimeResponse._defaults(this);
  }

  ProviderRuntimeResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loginState = $v.loginState;
      _sessionSite = $v.sessionSite;
      _providerKey = $v.providerKey;
      _accessPolicyId = $v.accessPolicyId;
      _routeConfigured = $v.routeConfigured;
      _contextAvailable = $v.contextAvailable;
      _profileVersion = $v.profileVersion;
      _engineCommit = $v.engineCommit;
      _sourceState = $v.sourceState;
      _evidenceState = $v.evidenceState;
      _lastMediaVerifiedAt = $v.lastMediaVerifiedAt;
      _userAction = $v.userAction;
      _routeRetryAt = $v.routeRetryAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProviderRuntimeResponse other) {
    _$v = other as _$ProviderRuntimeResponse;
  }

  @override
  void update(void Function(ProviderRuntimeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProviderRuntimeResponse build() => _build();

  _$ProviderRuntimeResponse _build() {
    final _$result = _$v ??
        _$ProviderRuntimeResponse._(
          loginState: BuiltValueNullFieldError.checkNotNull(
              loginState, r'ProviderRuntimeResponse', 'loginState'),
          sessionSite: sessionSite,
          providerKey: BuiltValueNullFieldError.checkNotNull(
              providerKey, r'ProviderRuntimeResponse', 'providerKey'),
          accessPolicyId: accessPolicyId,
          routeConfigured: BuiltValueNullFieldError.checkNotNull(
              routeConfigured, r'ProviderRuntimeResponse', 'routeConfigured'),
          contextAvailable: BuiltValueNullFieldError.checkNotNull(
              contextAvailable, r'ProviderRuntimeResponse', 'contextAvailable'),
          profileVersion: profileVersion,
          engineCommit: engineCommit,
          sourceState: BuiltValueNullFieldError.checkNotNull(
              sourceState, r'ProviderRuntimeResponse', 'sourceState'),
          evidenceState: BuiltValueNullFieldError.checkNotNull(
              evidenceState, r'ProviderRuntimeResponse', 'evidenceState'),
          lastMediaVerifiedAt: lastMediaVerifiedAt,
          userAction: userAction,
          routeRetryAt: routeRetryAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
