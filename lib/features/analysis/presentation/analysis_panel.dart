import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/analysis/application/analysis_controller.dart';
import 'package:framefetch/features/analysis/application/analysis_job_snapshot.dart';
import 'package:framefetch/features/analysis/application/analysis_state.dart';
import 'package:framefetch/features/analysis/application/analysis_target.dart';
import 'package:framefetch/features/analysis/presentation/analysis_configurator.dart';
import 'package:framefetch/features/analysis/presentation/analysis_job_state.dart';
import 'package:framefetch/features/analysis/presentation/analysis_presentation_labels.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_spinner.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AnalysisPanel extends ConsumerStatefulWidget {
  AnalysisPanel({
    required String downloadId,
    this.sourceAvailable = true,
    super.key,
  }) : target = AnalysisTarget.video(downloadId);

  AnalysisPanel.screenplay({
    required String documentId,
    this.sourceAvailable = true,
    super.key,
  }) : target = AnalysisTarget.screenplay(documentId);

  final AnalysisTarget target;
  final bool sourceAvailable;

  @override
  ConsumerState<AnalysisPanel> createState() => _AnalysisPanelState();
}

final class _AnalysisPanelState extends ConsumerState<AnalysisPanel> {
  bool _creating = false;
  AnalysisTarget get target => widget.target;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = ref.watch(analysisControllerProvider(target));
    final controller = ref.read(analysisControllerProvider(target).notifier);
    final title = target.isScreenplay
        ? l10n.screenplayAnalysisTitle
        : l10n.aiAnalysisTitle;
    final job = result.value?.job;
    final showTitle =
        job?.status != AnalysisStatus.succeeded || job?.result == null;
    return Semantics(
      container: true,
      explicitChildNodes: true,
      label: title,
      child: Column(
        key: const Key('analysis-panel'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showTitle) ...[
            Text(title, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: AppSpacing.xLarge),
          ],
          result.when(
            data: (state) => _content(context, state, controller),
            error: (_, _) => DataStateMessage(
              icon: PhosphorIconsRegular.cloudSlash,
              title: l10n.analysisLoadFailed,
              description: l10n.analysisServiceUnavailable,
              actionLabel: l10n.retryAction,
              onAction: () =>
                  ref.invalidate(analysisControllerProvider(target)),
            ),
            loading: () => Semantics(
              liveRegion: true,
              label: l10n.loadingData,
              child: const Center(child: AppSpinner()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(
    BuildContext context,
    AnalysisState state,
    AnalysisController controller,
  ) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state.actionError case final error?) ...[
          Text(
            analysisFailureMessage(
              l10n,
              error,
              isScreenplay: target.isScreenplay,
            ),
            key: const Key('analysis-action-error'),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: AppSpacing.medium),
        ],
        if (state.job case final job?) ...[
          if (!isActiveAnalysis(job)) ...[
            ShadButton.outline(
              enabled:
                  !state.busy &&
                  widget.sourceAvailable &&
                  !state.submissionUnknown &&
                  job.errorCode != AnalysisErrorCode.analysisOutcomeUnknown,
              onPressed: () async {
                if (_creating) {
                  setState(() => _creating = false);
                  return;
                }
                await controller.prepareNewTask();
                if (mounted &&
                    ref
                            .read(analysisControllerProvider(target))
                            .value
                            ?.skills
                            .isNotEmpty ==
                        true) {
                  setState(() => _creating = true);
                }
              },
              child: Flexible(
                child: Text(
                  _creating ? l10n.analysisCloseNewTask : l10n.analysisNewTask,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (_creating) ...[
              const SizedBox(height: AppSpacing.large),
              AnalysisConfigurator(
                busy: state.busy,
                blocked: state.submissionUnknown || !widget.sourceAvailable,
                skills: state.skills,
                onStart:
                    ({
                      required customPrompt,
                      required outputLanguage,
                      required skillId,
                    }) async {
                      setState(() => _creating = false);
                      await controller.start(
                        customPrompt: customPrompt,
                        outputLanguage: outputLanguage,
                        skillId: skillId,
                      );
                    },
              ),
            ],
            const SizedBox(height: AppSpacing.large),
          ],
          AnalysisJobState(
            action: state.action,
            isScreenplay: target.isScreenplay,
            job: job,
            onCancel: controller.cancel,
            onDelete: controller.delete,
            onRefresh: controller.refresh,
            canRetry:
                widget.sourceAvailable &&
                !state.submissionUnknown &&
                job.errorCode != AnalysisErrorCode.analysisOutcomeUnknown,
            onRetry: controller.retry,
          ),
        ] else
          AnalysisConfigurator(
            busy: state.action == AnalysisAction.start,
            blocked: state.submissionUnknown || !widget.sourceAvailable,
            skills: state.skills,
            onStart: controller.start,
          ),
      ],
    );
  }
}
