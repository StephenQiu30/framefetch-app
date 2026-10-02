import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/presentation/download_status.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class InspectionFormatPanel extends StatelessWidget {
  const InspectionFormatPanel({
    required this.onCreate,
    required this.onSelectFormat,
    required this.state,
    this.onUseUpload,
    super.key,
  });

  final VoidCallback onCreate;
  final ValueChanged<String> onSelectFormat;
  final VoidCallback? onUseUpload;
  final DownloadIntakeState state;

  @override
  Widget build(BuildContext context) {
    final inspection = state.inspection!;
    final l10n = AppLocalizations.of(context);
    final downloadable =
        inspection.accessDecision == AccessDecision.downloadable;
    final expired = !inspection.expiresAt.isAfter(DateTime.now());
    final selected = inspection.formats
        .where((f) => f.id == state.selectedFormatId)
        .firstOrNull;
    final plan = selected?.plan;
    return Column(
      key: const Key('inspection-actions-column'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.formatSelectionTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.large),
        if (expired || !downloadable || inspection.formats.isEmpty)
          DownloadInlineStatus(
            message: expired
                ? l10n.intentExpired
                : !downloadable
                ? inspection.userAction ??
                      inspection.restrictionReason ??
                      l10n.mediaUnavailableDescription
                : l10n.noFormatsAvailable,
            tone: DownloadNoticeTone.neutral,
          )
        else ...[
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 360),
            child: ShadRadioGroup<String>(
              axis: Axis.horizontal,
              key: ValueKey(state.selectedFormatId),
              initialValue: state.selectedFormatId,
              enabled: !state.busy,
              onChanged: (value) {
                if (value != null) onSelectFormat(value);
              },
              items: [
                ListView.separated(
                  key: const Key('format-options-list'),
                  primary: false,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: inspection.formats.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppSpacing.small),
                  itemBuilder: (context, index) {
                    final format = inspection.formats[index];
                    return ShadRadio<String>(
                      value: format.id,
                      padding: const EdgeInsets.all(AppSpacing.medium),
                      label: Text(
                        format.displayName,
                        key: Key('format-option-${format.id}'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if (plan != null) ...[
            const SizedBox(height: AppSpacing.xLarge),
            _SelectionMetadata(
              values: [
                (
                  l10n.inspectionContainerLabel,
                  plan.containerPreference.name.toUpperCase(),
                ),
                (
                  l10n.inspectionCompatibilityLabel,
                  switch (plan.compatibilityProfile.name) {
                    'quality' => l10n.compatibilityQuality,
                    'smallest' => l10n.compatibilitySmallest,
                    _ => l10n.compatibilityBalanced,
                  },
                ),
                (
                  l10n.inspectionVideoCodecLabel,
                  plan.videoCodecFamily.name.toUpperCase(),
                ),
                (
                  l10n.inspectionAudioCodecLabel,
                  plan.audioCodecFamily.name.toUpperCase(),
                ),
              ],
            ),
          ] else if (selected != null) ...[
            const SizedBox(height: AppSpacing.xLarge),
            Text(
              inspection.mediaKind == MediaKind.videoCollection
                  ? l10n.videoCollectionFormatDetails(inspection.assetCount)
                  : l10n.imageGalleryFormatDetails(inspection.assetCount),
            ),
          ],
          const SizedBox(height: AppSpacing.xLarge),
          ShadButton(
            key: const Key('create-download-button'),
            onPressed: state.busy || selected == null ? null : onCreate,
            leading: state.phase == DownloadIntakePhase.creating
                ? const SizedBox.square(dimension: 18, child: AppSpinner())
                : const Icon(PhosphorIconsRegular.download, size: 18),
            child: Text(
              state.phase == DownloadIntakePhase.creating
                  ? l10n.creatingDownload
                  : l10n.createDownloadAction,
            ),
          ),
        ],
        if (!expired &&
            inspection.accessDecision == AccessDecision.exportRequired &&
            onUseUpload != null) ...[
          const SizedBox(height: AppSpacing.xLarge),
          ShadButton(
            onPressed: state.busy ? null : onUseUpload,
            leading: const Icon(PhosphorIconsRegular.upload, size: 18),
            child: Text(l10n.videoIntakeTitle),
          ),
        ],
      ],
    );
  }
}

final class _SelectionMetadata extends StatelessWidget {
  const _SelectionMetadata({required this.values});
  final List<(String, String)> values;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final width = (constraints.maxWidth - AppSpacing.large) / 2;
      return Wrap(
        spacing: AppSpacing.large,
        runSpacing: AppSpacing.large,
        children: [
          for (final value in values)
            SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.$1,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: AppSpacing.xSmall),
                  Text(
                    value.$2,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    },
  );
}
