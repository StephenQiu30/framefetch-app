import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/features/providers/application/provider_status_provider.dart';
import 'package:framefetch/features/providers/presentation/provider_status_item.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_loading.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:framefetch/shared/presentation/data_request_failure_message.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class ProviderStatusScreen extends ConsumerStatefulWidget {
  const ProviderStatusScreen({super.key});

  @override
  ConsumerState<ProviderStatusScreen> createState() =>
      _ProviderStatusScreenState();
}

final class _ProviderStatusScreenState
    extends ConsumerState<ProviderStatusScreen> {
  String _filter = 'all';
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final result = ref.watch(providerStatusProvider);
    return DataPageView(
      title: localizations.providerStatusNavigation,
      refreshLabel: localizations.refreshAction,
      onRefresh: () => ref.refresh(providerStatusProvider.future).then((_) {}),
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: ShadTabs<String>(
            key: const Key('provider-status-filter'),
            value: _filter,
            scrollable: true,
            onChanged: (value) => setState(() => _filter = value),
            tabs: [
              for (final entry in {
                'all': localizations.allStatuses,
                'enabled': localizations.providerRegistered,
                'disabled': localizations.providerUnavailable,
              }.entries)
                ShadTab<String>(
                  key: Key('provider-filter-${entry.key}'),
                  value: entry.key,
                  height: 44,
                  child: Text(entry.value),
                ),
            ],
          ),
        ),
        ...result.when(
          skipLoadingOnRefresh: true,
          data: (data) => _content(context, data),
          error: (error, _) => [
            DataStateMessage(
              icon: PhosphorIconsRegular.cloudSlash,
              title: localizations.loadFailedTitle,
              description: dataRequestFailureMessage(localizations, error),
              actionLabel: localizations.retryAction,
              onAction: () => ref.invalidate(providerStatusProvider),
            ),
          ],
          loading: () => const [AppLoading()],
        ),
      ],
    );
  }

  List<Widget> _content(BuildContext context, ProviderListResponse data) {
    final localizations = AppLocalizations.of(context);
    if (data.items.isEmpty) {
      return [
        DataStateMessage(
          title: localizations.providerEmptyTitle,
          icon: PhosphorIconsRegular.pulse,
        ),
      ];
    }
    return [
      for (final item in data.items.where(
        (item) =>
            _filter == 'all' ||
            isProviderDownloadEnabled(item) == (_filter == 'enabled'),
      ))
        ProviderStatusItem(item: item),
    ];
  }
}
