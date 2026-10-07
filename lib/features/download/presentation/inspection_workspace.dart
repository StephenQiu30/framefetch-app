import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/download/application/download_intake_controller.dart';
import 'package:framefetch/features/download/presentation/inspection_format_panel.dart';
import 'package:framefetch/features/media/presentation/authenticated_media_cover.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/data_formatters.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

final class InspectionWorkspace extends StatelessWidget {
  const InspectionWorkspace({
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
    final selected = inspection.formats
        .where((format) => format.id == state.selectedFormatId)
        .firstOrNull;
    final detail = switch (inspection.mediaKind) {
      MediaKind.imageGallery => l10n.imageGalleryFormatDetails(
        inspection.assetCount,
      ),
      MediaKind.videoCollection => l10n.videoCollectionFormatDetails(
        inspection.assetCount,
      ),
      _ =>
        selected?.plan == null
            ? formatDurationClock(inspection.durationSeconds)
            : '${selected!.plan!.width}×${selected.plan!.height}',
    };
    final media = Column(
      key: const Key('inspection-media-column'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthenticatedMediaCover(
          alt: '${inspection.title} ${l10n.mediaCoverLabel}',
          borderRadius: BorderRadius.zero,
          detail: detail,
          eyebrow: inspection.extractorKey,
          source: inspection.thumbnailUrl,
          title: inspection.title,
        ),
        const SizedBox(height: AppSpacing.large),
        Semantics(
          header: true,
          child: Text(
            inspection.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        Text(
          [
            inspection.extractorKey,
            if (inspection.durationSeconds > 0)
              formatDurationClock(inspection.durationSeconds),
            if (inspection.mediaKind != MediaKind.video ||
                selected?.plan != null)
              detail,
          ].join(' · '),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
    final actions = InspectionFormatPanel(
      onCreate: onCreate,
      onSelectFormat: onSelectFormat,
      onUseUpload: onUseUpload,
      state: state,
    );
    return LayoutBuilder(
      key: const Key('inspection-workspace'),
      builder: (context, constraints) {
        final largeText = MediaQuery.textScalerOf(context).scale(14) > 19;
        if (constraints.maxWidth < 900 || largeText) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              media,
              const SizedBox(height: AppSpacing.section),
              actions,
            ],
          );
        }
        return Row(
          key: const Key('inspection-split-layout'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: media),
            const SizedBox(width: AppSpacing.section),
            Expanded(flex: 2, child: actions),
          ],
        );
      },
    );
  }
}
