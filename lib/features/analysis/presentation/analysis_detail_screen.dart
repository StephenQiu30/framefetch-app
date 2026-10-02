import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/application/analysis_controller.dart';
import 'package:framegrab/features/analysis/application/analysis_history_provider.dart';
import 'package:framegrab/features/analysis/application/analysis_job_snapshot.dart';
import 'package:framegrab/features/analysis/application/analysis_target.dart';
import 'package:framegrab/features/analysis/presentation/analysis_job_state.dart';
import 'package:framegrab/features/analysis/presentation/analysis_presentation_labels.dart';
import 'package:framegrab/features/analysis/presentation/analysis_retry_confirmation.dart';
import 'package:framegrab/features/analysis/presentation/analysis_run_history.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/history/application/activity_history_provider.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_navigation_bar.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class AnalysisDetailScreen extends ConsumerWidget {
  const AnalysisDetailScreen({required this.analysisId, super.key});
  final String analysisId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final record = ref.watch(analysisHistoryRecordProvider(analysisId));
    return Scaffold(
      appBar: const AppNavigationBar(backFallbackLocation: '/history/activity'),
      body: record.when(
        data: (value) => _AnalysisDetail(record: value),
        loading: () => const Center(child: AppSpinner()),
        error: (error, _) => DataStateMessage(
          title: l.analysisLoadFailed,
          description: dataRequestFailureMessage(l, error),
          actionLabel: l.retryAction,
          onAction: () =>
              ref.invalidate(analysisHistoryRecordProvider(analysisId)),
        ),
      ),
    );
  }
}

final class _AnalysisDetail extends ConsumerWidget {
  const _AnalysisDetail({required this.record});
  final Object record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final (
      id,
      title,
      inputKind,
      sourceId,
      language,
      skillId,
      sourceAvailable,
      cancelling,
    ) = switch (record) {
      final VideoAnalysisHistoryRecordResponse item => (
        item.id,
        item.title,
        AnalysisInputKind.video,
        item.downloadId,
        item.outputLanguage,
        item.skillId,
        item.sourceAvailability == HistoryAvailability.available,
        item.cancelRequestedAt != null,
      ),
      final ScreenplayAnalysisHistoryRecordResponse item => (
        item.id,
        item.title,
        AnalysisInputKind.screenplay,
        item.documentId,
        item.outputLanguage,
        item.skillId,
        item.sourceAvailability == HistoryAvailability.available,
        item.cancelRequestedAt != null,
      ),
      _ => throw StateError('Unsupported analysis record'),
    };
    final target = AnalysisTarget.record(id, inputKind: inputKind);
    final state = ref.watch(analysisControllerProvider(target));
    final controller = ref.read(analysisControllerProvider(target).notifier);
    return DataPageView(
      title: title,
      description: '$skillId · $language',
      refreshLabel: l.refreshAction,
      onRefresh: () async {
        await controller.refresh();
        ref.invalidate(analysisHistoryRecordProvider(id));
      },
      children: [
        Wrap(
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.small,
          children: [
            ShadButton.outline(
              onPressed: () => unawaited(
                context.push<void>(
                  '/history/activity${sourceId == null ? '' : '?${inputKind == AnalysisInputKind.video ? 'download_id' : 'document_id'}=${Uri.encodeQueryComponent(sourceId)}'}',
                ),
              ),
              child: Text(l.activityHistoryTitle),
            ),
            if (sourceAvailable && sourceId != null)
              ShadButton.outline(
                onPressed: () => unawaited(
                  context.push<void>(
                    '/${inputKind == AnalysisInputKind.video ? 'downloads' : 'documents'}/${Uri.encodeComponent(sourceId)}',
                  ),
                ),
                child: Text(
                  inputKind == AnalysisInputKind.video
                      ? l.downloadDetailNavigation
                      : l.documentInformationTitle,
                ),
              ),
          ],
        ),
        if (!sourceAvailable)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.large),
            child: Text(l.activitySourceUnavailable),
          ),
        const SizedBox(height: AppSpacing.xLarge),
        ...state.when(
          data: (current) => [
            if (current.actionError case final error?)
              Text(
                analysisFailureMessage(
                  l,
                  error,
                  isScreenplay: target.isScreenplay,
                ),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            if (current.job case final job?) ...[
              AnalysisJobState(
                action: current.action,
                isScreenplay: target.isScreenplay,
                job: job,
                canRetry: sourceAvailable,
                cancelling: cancelling,
                onCancel: () async {
                  await controller.cancel();
                  ref.invalidate(analysisHistoryRecordProvider(id));
                },
                onDelete: () async {
                  await controller.delete();
                  ref.invalidate(activityHistoryProvider);
                },
                onRefresh: controller.refresh,
                onRetry: () async {
                  final session = ref.read(authSessionProvider.notifier);
                  final generation = session.sessionGeneration;
                  if (await confirmAnalysisRetry(context) &&
                      context.mounted &&
                      generation == session.sessionGeneration) {
                    await controller.retry();
                    ref.invalidate(analysisHistoryRecordProvider(id));
                  }
                },
              ),
              const SizedBox(height: AppSpacing.section),
              AnalysisRunHistory(
                key: ValueKey('$id:${job.runNo}'),
                analysisId: id,
                runNo: job.runNo,
                active: isActiveAnalysis(job),
              ),
            ] else
              DataStateMessage(title: l.analysisInvalidResult),
          ],
          loading: () => [const Center(child: AppSpinner())],
          error: (error, _) => [
            DataStateMessage(
              title: l.analysisLoadFailed,
              description: dataRequestFailureMessage(l, error),
              actionLabel: l.retryAction,
              onAction: () =>
                  ref.invalidate(analysisControllerProvider(target)),
            ),
          ],
        ),
      ],
    );
  }
}
