// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engine_candidate_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EngineCandidateResponse extends EngineCandidateResponse {
  @override
  final String key;
  @override
  final String name;
  @override
  final bool upstreamWorking;

  factory _$EngineCandidateResponse(
          [void Function(EngineCandidateResponseBuilder)? updates]) =>
      (EngineCandidateResponseBuilder()..update(updates))._build();

  _$EngineCandidateResponse._(
      {required this.key, required this.name, required this.upstreamWorking})
      : super._();
  @override
  EngineCandidateResponse rebuild(
          void Function(EngineCandidateResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EngineCandidateResponseBuilder toBuilder() =>
      EngineCandidateResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EngineCandidateResponse &&
        key == other.key &&
        name == other.name &&
        upstreamWorking == other.upstreamWorking;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, upstreamWorking.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EngineCandidateResponse')
          ..add('key', key)
          ..add('name', name)
          ..add('upstreamWorking', upstreamWorking))
        .toString();
  }
}

class EngineCandidateResponseBuilder
    implements
        Builder<EngineCandidateResponse, EngineCandidateResponseBuilder> {
  _$EngineCandidateResponse? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _upstreamWorking;
  bool? get upstreamWorking => _$this._upstreamWorking;
  set upstreamWorking(bool? upstreamWorking) =>
      _$this._upstreamWorking = upstreamWorking;

  EngineCandidateResponseBuilder() {
    EngineCandidateResponse._defaults(this);
  }

  EngineCandidateResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _name = $v.name;
      _upstreamWorking = $v.upstreamWorking;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EngineCandidateResponse other) {
    _$v = other as _$EngineCandidateResponse;
  }

  @override
  void update(void Function(EngineCandidateResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EngineCandidateResponse build() => _build();

  _$EngineCandidateResponse _build() {
    final _$result = _$v ??
        _$EngineCandidateResponse._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'EngineCandidateResponse', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'EngineCandidateResponse', 'name'),
          upstreamWorking: BuiltValueNullFieldError.checkNotNull(
              upstreamWorking, r'EngineCandidateResponse', 'upstreamWorking'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
