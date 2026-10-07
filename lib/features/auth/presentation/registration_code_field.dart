import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/features/auth/data/native_auth_gateway.dart';
import 'package:framefetch/features/auth/presentation/auth_failure_message.dart';
import 'package:framefetch/features/auth/presentation/auth_validation.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class RegistrationCodeField extends ConsumerStatefulWidget {
  const RegistrationCodeField({
    required this.email,
    required this.controller,
    required this.disabled,
    required this.verified,
    required this.onSendingChanged,
    required this.onVerifiedChanged,
    super.key,
  });
  final String email;
  final TextEditingController controller;
  final bool disabled;
  final bool verified;
  final ValueChanged<bool> onSendingChanged;
  final ValueChanged<bool> onVerifiedChanged;
  @override
  ConsumerState<RegistrationCodeField> createState() =>
      _RegistrationCodeFieldState();
}

final class _RegistrationCodeFieldState
    extends ConsumerState<RegistrationCodeField> {
  bool _sending = false;
  bool _verifying = false;
  bool _sent = false;
  AuthFailureKind? _failure;
  DateTime? _retryAt;
  Timer? _timer;
  bool get _busy =>
      widget.disabled || _sending || _verifying || widget.verified;
  bool get _canVerify =>
      !_busy && _sent && RegExp(r'^[0-9]{6}$').hasMatch(widget.controller.text);
  bool get _canSend =>
      !_busy && _remaining == 0 && isValidAuthEmail(widget.email);
  int get _remaining => _retryAt == null
      ? 0
      : ((_retryAt!.difference(DateTime.now()).inMilliseconds / 1000).ceil())
            .clamp(0, 3600);

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _send() async {
    if (_sending || _verifying || widget.verified || _remaining > 0) return;
    final email = widget.email.trim();
    if (widget.disabled || !isValidAuthEmail(email)) return;
    setState(() {
      _sending = true;
      _failure = null;
      _sent = false;
    });
    widget.onSendingChanged(true);
    try {
      final result = await ref
          .read(nativeAuthGatewayProvider)
          .sendRegistrationCode(email);
      if (!mounted) return;
      widget.controller.clear();
      widget.onVerifiedChanged(false);
      setState(() {
        _sent = true;
        _retryAt = DateTime.now().add(
          Duration(seconds: result.retryAfterSeconds ?? 60),
        );
      });
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted) setState(() {});
        if (_remaining == 0) _timer?.cancel();
      });
    } on AuthRequestFailure catch (error) {
      if (mounted) setState(() => _failure = error.kind);
    } catch (_) {
      if (mounted) setState(() => _failure = AuthFailureKind.unknown);
    } finally {
      if (mounted) {
        setState(() => _sending = false);
        widget.onSendingChanged(false);
      }
    }
  }

  Future<void> _verify() async {
    final email = widget.email.trim();
    final code = widget.controller.text;
    if (widget.disabled ||
        _sending ||
        _verifying ||
        widget.verified ||
        !_sent ||
        !isValidAuthEmail(email) ||
        !RegExp(r'^[0-9]{6}$').hasMatch(code)) {
      return;
    }
    setState(() {
      _verifying = true;
      _failure = null;
    });
    widget.onSendingChanged(true);
    try {
      await ref
          .read(nativeAuthGatewayProvider)
          .verifyRegistrationCode(email: email, verificationCode: code);
      if (mounted &&
          widget.email.trim() == email &&
          widget.controller.text == code) {
        widget.onVerifiedChanged(true);
      }
    } on AuthRequestFailure catch (error) {
      if (mounted) setState(() => _failure = error.kind);
    } catch (_) {
      if (mounted) setState(() => _failure = AuthFailureKind.unknown);
    } finally {
      if (mounted) {
        setState(() => _verifying = false);
        widget.onSendingChanged(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShadInputFormField(
          key: const Key('register-code-field'),
          controller: widget.controller,
          enabled: !_busy,
          onChanged: (_) => setState(() => _failure = null),
          keyboardType: TextInputType.number,
          autofillHints: const [AutofillHints.oneTimeCode],
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ],
          textInputAction: TextInputAction.next,
          validator: (value) => RegExp(r'^[0-9]{6}$').hasMatch(value)
              ? null
              : l.verificationCodeRequired,
          label: Text(l.verificationCodeLabel),
        ),
        const SizedBox(height: 8),
        ShadButton(
          key: const Key('register-verify-code-button'),
          onPressed: _canVerify ? () => unawaited(_verify()) : null,
          enabled: _canVerify,
          height: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Flexible(
            child: Text(
              widget.verified
                  ? l.registrationEmailVerified
                  : _verifying
                  ? l.verifyingRegistrationEmail
                  : l.verifyRegistrationEmail,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ShadButton.outline(
          key: const Key('register-send-code-button'),
          onPressed: _canSend ? () => unawaited(_send()) : null,
          enabled: _canSend,
          height: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Flexible(
            child: Text(
              _sending
                  ? l.sendingVerificationCode
                  : _remaining > 0
                  ? l.verificationCodeCooldown(_remaining)
                  : l.sendVerificationCode,
            ),
          ),
        ),
        if (_sent || _failure != null)
          Semantics(
            liveRegion: true,
            child: Text(
              _failure != null
                  ? authFailureMessage(l, _failure!)
                  : widget.verified
                  ? l.registrationEmailVerificationSuccess
                  : l.verificationCodeSent,
            ),
          ),
      ],
    );
  }
}
