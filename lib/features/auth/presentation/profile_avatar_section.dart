import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/application/profile_avatar_provider.dart';
import 'package:framegrab/features/auth/data/profile_avatar_picker.dart';
import 'package:framegrab/features/auth/data/profile_repository.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class ProfileAvatarSection extends ConsumerStatefulWidget {
  const ProfileAvatarSection({super.key});
  @override
  ConsumerState<ProfileAvatarSection> createState() =>
      _ProfileAvatarSectionState();
}

final class _ProfileAvatarSectionState
    extends ConsumerState<ProfileAvatarSection> {
  bool _busy = false;
  String? _error;

  Future<void> _change({bool remove = false}) async {
    if (_busy) return;
    final l = AppLocalizations.of(context);
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final repository = ref.read(profileRepositoryProvider);
      if (remove) {
        await repository.removeAvatar();
      } else {
        final bytes = await ref.read(profileAvatarPickerProvider).pick();
        if (bytes == null || !mounted) return;
        await repository.uploadAvatar(bytes);
      }
      if (mounted) {
        ref.invalidate(profileAvatarProvider);
        ShadSonner.of(context).show(
          ShadToast(
            description: Text(
              remove ? l.profileAvatarRemoved : l.profileAvatarSaved,
            ),
          ),
        );
      }
    } on AvatarSelectionFailure catch (error) {
      if (mounted) {
        setState(
          () => _error = error == AvatarSelectionFailure.size
              ? l.profileAvatarInvalidSize
              : l.profileAvatarInvalidType,
        );
      }
    } catch (error) {
      if (mounted) setState(() => _error = dataRequestFailureMessage(l, error));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final user = ref.watch(authSessionProvider).user;
    if (user == null) return const SizedBox.shrink();
    final avatar = ref.watch(profileAvatarProvider);
    final initials = user.username.characters.take(2).toString().toUpperCase();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadAvatar(avatar.asData?.value, placeholder: Text(initials)),
        const SizedBox(height: AppSpacing.small),
        Text(user.username, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.xSmall),
        Text(
          user.email,
          textAlign: TextAlign.center,
          style: ShadTheme.of(context).textTheme.muted,
        ),
        const SizedBox(height: AppSpacing.xSmall),
        ShadBadge.secondary(
          child: Text(
            user.role.name == 'admin' ? l.adminRoleAdmin : l.adminRoleUser,
          ),
        ),
        const SizedBox(height: AppSpacing.medium),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadButton.outline(
              key: const Key('profile-avatar-upload'),
              enabled: !_busy,
              onPressed: _busy ? null : _change,
              leading: const Icon(PhosphorIconsRegular.uploadSimple, size: 18),
              height: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Flexible(
                child: Text(
                  _busy ? l.profileAvatarBusy : l.profileAvatarUpload,
                ),
              ),
            ),
            if (user.avatarVersion != null)
              ShadButton.ghost(
                key: const Key('profile-avatar-remove'),
                enabled: !_busy,
                onPressed: _busy ? null : () => _change(remove: true),
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Flexible(child: Text(l.profileAvatarRemove)),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xSmall),
        Text(
          l.profileAvatarHelp,
          textAlign: TextAlign.center,
          style: ShadTheme.of(context).textTheme.muted,
        ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Semantics(
              liveRegion: true,
              child: Text(
                _error!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ShadTheme.of(context).colorScheme.destructive,
                ),
              ),
            ),
          ),
        if (avatar.hasError)
          ShadButton.ghost(
            onPressed: () => ref.invalidate(profileAvatarProvider),
            child: Text(l.retryAction),
          ),
      ],
    );
  }
}
