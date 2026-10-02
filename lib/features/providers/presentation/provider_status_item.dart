import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:video_server_api/video_server_api.dart';

final class ProviderStatusItem extends StatelessWidget {
  const ProviderStatusItem({required this.item, super.key});

  final ProviderStatusResponse item;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final status = isProviderDownloadEnabled(item)
        ? localizations.providerRegistered
        : item.status == ProviderSupportStatus.unsupported
        ? localizations.providerStatusUnsupported
        : localizations.providerUnavailable;
    final capabilities = item.capabilities
        .map((value) => _capabilityLabel(localizations, value.name))
        .join(' · ');
    final capabilitySummary = capabilities.isEmpty
        ? localizations.providerNoCapabilities
        : capabilities;
    final identity = switch (item.identity.name) {
      'required' => localizations.providerIdentityRequired,
      'prefer' => localizations.providerIdentityPrefer,
      _ => localizations.providerIdentityNone,
    };
    final description = item.userAction?.trim().isNotEmpty ?? false
        ? item.userAction!.trim()
        : localizations.providerFileResultHint;

    return Semantics(
      container: true,
      label:
          '${item.displayName}, ${item.key}, $status, $identity, '
          '$capabilitySummary, $description',
      child: ExcludeSemantics(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.displayName,
                textAlign: TextAlign.start,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.xSmall),
              Text(
                item.key,
                textAlign: TextAlign.start,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: AppSpacing.small,
                runSpacing: AppSpacing.xSmall,
                children: [
                  DataStatusLabel(
                    color: theme.colorScheme.onSurfaceVariant,
                    label: status,
                  ),
                  Text(
                    identity,
                    textAlign: TextAlign.start,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.small),
              Text(
                capabilitySummary,
                textAlign: TextAlign.start,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              Text(
                description,
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Uses the same registered runtime and download conditions as the Web status.
bool isProviderDownloadEnabled(ProviderStatusResponse item) =>
    item.registered &&
    item.extractorExists &&
    item.downloadSupported &&
    item.status == ProviderSupportStatus.unknown;

String _capabilityLabel(AppLocalizations l10n, String value) => switch (value) {
  'singleVideo' => l10n.capabilitySingleVideo,
  'shortVideo' => l10n.capabilityShortVideo,
  'clipOrVod' => l10n.capabilityClipOrVod,
  'audioVideoSplit' => l10n.capabilityAudioVideoSplit,
  'subtitles' => l10n.capabilitySubtitles,
  'imageOrCarousel' => l10n.capabilityImageOrCarousel,
  'live' => l10n.capabilityLive,
  'playlist' => l10n.capabilityPlaylist,
  _ => l10n.providerUnavailable,
};
