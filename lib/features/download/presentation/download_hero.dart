import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/download/presentation/content_intake_controls.dart';
import 'package:framegrab/features/download/presentation/link_intake_form.dart';
import 'package:framegrab/features/upload/application/content_upload_controller.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';
import 'package:framegrab/features/upload/presentation/upload_intake_panel.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_page_intro.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

final class DownloadHero extends StatelessWidget {
  const DownloadHero({
    required this.busy,
    required this.controller,
    required this.invalid,
    required this.mode,
    required this.onChanged,
    required this.onClear,
    required this.onModeChanged,
    required this.onSubmit,
    required this.onUploadAction,
    required this.onUploadCancel,
    required this.uploadState,
    super.key,
  });

  final bool busy;
  final TextEditingController controller;
  final bool invalid;
  final ContentIntakeMode mode;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final ValueChanged<ContentIntakeMode> onModeChanged;
  final VoidCallback onSubmit;
  final ValueChanged<ContentUploadKind> onUploadAction;
  final VoidCallback onUploadCancel;
  final ContentUploadState uploadState;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final wide = MediaQuery.sizeOf(context).width >= 640;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppPageIntro(large: true, title: localizations.downloadHomeTitle),
        SizedBox(height: wide ? 48 : 40),
        ContentIntakeSelector(
          enabled: !busy && !uploadState.busy,
          linkLabel: localizations.linkIntakeMode,
          onChanged: onModeChanged,
          screenplayLabel: localizations.screenplayIntakeMode,
          selected: mode,
          videoLabel: localizations.videoIntakeMode,
        ),
        const SizedBox(height: AppSpacing.xLarge),
        if (mode == ContentIntakeMode.link)
          LinkIntakeForm(
            busy: busy,
            controller: controller,
            invalid: invalid,
            onChanged: onChanged,
            onClear: onClear,
            onSubmit: onSubmit,
          )
        else if (mode == ContentIntakeMode.video)
          UploadIntakePanel(
            actionLabel: localizations.selectVideoFile,
            icon: PhosphorIconsRegular.videoCamera,
            kind: ContentUploadKind.video,
            onCancel: onUploadCancel,
            onPressed: () => onUploadAction(ContentUploadKind.video),
            state: uploadState,
            title: localizations.videoIntakeTitle,
          )
        else
          UploadIntakePanel(
            actionLabel: localizations.selectScreenplayFile,
            icon: PhosphorIconsRegular.fileText,
            kind: ContentUploadKind.screenplay,
            onCancel: onUploadCancel,
            onPressed: () => onUploadAction(ContentUploadKind.screenplay),
            state: uploadState,
            title: localizations.screenplayIntakeTitle,
          ),
      ],
    );
  }
}
