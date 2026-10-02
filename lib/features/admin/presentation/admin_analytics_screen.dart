import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/presentation/admin_analysis_analytics_content.dart';
import 'package:framegrab/features/admin/presentation/admin_download_analytics_content.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminAnalyticsScreen extends ConsumerStatefulWidget {
  const AdminAnalyticsScreen({super.key});
  @override
  ConsumerState<AdminAnalyticsScreen> createState() =>
      _AdminAnalyticsScreenState();
}

final class _AdminAnalyticsScreenState
    extends ConsumerState<AdminAnalyticsScreen> {
  int _days = 30;
  String _tab = 'downloads';
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final downloads = _tab == 'downloads'
        ? ref.watch(adminAnalyticsProvider(_days))
        : null;
    final analysis = _tab == 'analysis'
        ? ref.watch(adminAnalysisAnalyticsProvider(_days))
        : null;
    final start = downloads?.value?.start ?? analysis?.value?.start;
    final end = downloads?.value?.end ?? analysis?.value?.end;
    void retry() => _tab == 'downloads'
        ? ref.invalidate(adminAnalyticsProvider(_days))
        : ref.invalidate(adminAnalysisAnalyticsProvider(_days));
    return AdminPage(
      title: l.adminAnalyticsTitle,
      description: l.adminAnalyticsDescription,
      refreshLabel: l.refreshAction,
      onRefresh: () async {
        if (_tab == 'downloads') {
          await ref.refresh(adminAnalyticsProvider(_days).future).then((_) {});
        } else {
          await ref
              .refresh(adminAnalysisAnalyticsProvider(_days).future)
              .then((_) {});
        }
      },
      children: [
        if (start != null && end != null)
          Text(
            '${start.toUtc().toIso8601String().substring(0, 10)} – ${end.toUtc().toIso8601String().substring(0, 10)} (UTC)',
            style: ShadTheme.of(context).textTheme.muted,
          ),
        const SizedBox(height: AppSpacing.medium),
        AppDropdownField<int>(
          value: _days,
          label: l.adminPeriodLabel,
          options: [
            for (final days in [7, 30, 90])
              AppDropdownOption(value: days, label: l.adminDays(days)),
          ],
          onSelected: (v) {
            if (v != null) setState(() => _days = v);
          },
        ),
        const SizedBox(height: AppSpacing.xLarge),
        ShadTabs<String>(
          value: _tab,
          onChanged: (v) => setState(() => _tab = v),
          tabs: [
            ShadTab(value: 'downloads', child: Text(l.adminDownloadsTab)),
            ShadTab(value: 'analysis', child: Text(l.adminAnalysisTab)),
          ],
        ),
        const SizedBox(height: AppSpacing.xLarge),
        if (downloads != null)
          ...downloads.when(
            data: (data) => [AdminDownloadAnalyticsContent(data: data)],
            loading: () => adminLoading(l.loadingData),
            error: (error, _) => adminError(
              action: l.retryAction,
              title: l.loadFailedTitle,
              description: dataRequestFailureMessage(l, error),
              retry: retry,
            ),
          ),
        if (analysis != null)
          ...analysis.when(
            data: (data) => [AdminAnalysisAnalyticsContent(data: data)],
            loading: () => adminLoading(l.loadingData),
            error: (error, _) => adminError(
              action: l.retryAction,
              title: l.loadFailedTitle,
              description: dataRequestFailureMessage(l, error),
              retry: retry,
            ),
          ),
      ],
    );
  }
}
