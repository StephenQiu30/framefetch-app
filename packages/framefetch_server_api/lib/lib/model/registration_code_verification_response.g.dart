// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_code_verification_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegistrationCodeVerificationResponse
    extends RegistrationCodeVerificationResponse {
  @override
  final bool? verified;

  factory _$RegistrationCodeVerificationResponse(
          [void Function(RegistrationCodeVerificationResponseBuilder)?
              updates]) =>
      (RegistrationCodeVerificationResponseBuilder()..update(updates))._build();

  _$RegistrationCodeVerificationResponse._({this.verified}) : super._();
  @override
  RegistrationCodeVerificationResponse rebuild(
          void Function(RegistrationCodeVerificationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationCodeVerificationResponseBuilder toBuilder() =>
      RegistrationCodeVerificationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationCodeVerificationResponse &&
        verified == other.verified;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, verified.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegistrationCodeVerificationResponse')
          ..add('verified', verified))
        .toString();
  }
}

class RegistrationCodeVerificationResponseBuilder
    implements
        Builder<RegistrationCodeVerificationResponse,
            RegistrationCodeVerificationResponseBuilder> {
  _$RegistrationCodeVerificationResponse? _$v;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  RegistrationCodeVerificationResponseBuilder() {
    RegistrationCodeVerificationResponse._defaults(this);
  }

  RegistrationCodeVerificationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _verified = $v.verified;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegistrationCodeVerificationResponse other) {
    _$v = other as _$RegistrationCodeVerificationResponse;
  }

  @override
  void update(
      void Function(RegistrationCodeVerificationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegistrationCodeVerificationResponse build() => _build();

  _$RegistrationCodeVerificationResponse _build() {
    final _$result = _$v ??
        _$RegistrationCodeVerificationResponse._(
          verified: verified,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
