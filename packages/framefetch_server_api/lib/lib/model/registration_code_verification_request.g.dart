// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_code_verification_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegistrationCodeVerificationRequest
    extends RegistrationCodeVerificationRequest {
  @override
  final String email;
  @override
  final String verificationCode;

  factory _$RegistrationCodeVerificationRequest(
          [void Function(RegistrationCodeVerificationRequestBuilder)?
              updates]) =>
      (RegistrationCodeVerificationRequestBuilder()..update(updates))._build();

  _$RegistrationCodeVerificationRequest._(
      {required this.email, required this.verificationCode})
      : super._();
  @override
  RegistrationCodeVerificationRequest rebuild(
          void Function(RegistrationCodeVerificationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationCodeVerificationRequestBuilder toBuilder() =>
      RegistrationCodeVerificationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationCodeVerificationRequest &&
        email == other.email &&
        verificationCode == other.verificationCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, verificationCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegistrationCodeVerificationRequest')
          ..add('email', email)
          ..add('verificationCode', verificationCode))
        .toString();
  }
}

class RegistrationCodeVerificationRequestBuilder
    implements
        Builder<RegistrationCodeVerificationRequest,
            RegistrationCodeVerificationRequestBuilder> {
  _$RegistrationCodeVerificationRequest? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _verificationCode;
  String? get verificationCode => _$this._verificationCode;
  set verificationCode(String? verificationCode) =>
      _$this._verificationCode = verificationCode;

  RegistrationCodeVerificationRequestBuilder() {
    RegistrationCodeVerificationRequest._defaults(this);
  }

  RegistrationCodeVerificationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _verificationCode = $v.verificationCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegistrationCodeVerificationRequest other) {
    _$v = other as _$RegistrationCodeVerificationRequest;
  }

  @override
  void update(
      void Function(RegistrationCodeVerificationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegistrationCodeVerificationRequest build() => _build();

  _$RegistrationCodeVerificationRequest _build() {
    final _$result = _$v ??
        _$RegistrationCodeVerificationRequest._(
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'RegistrationCodeVerificationRequest', 'email'),
          verificationCode: BuiltValueNullFieldError.checkNotNull(
              verificationCode,
              r'RegistrationCodeVerificationRequest',
              'verificationCode'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
