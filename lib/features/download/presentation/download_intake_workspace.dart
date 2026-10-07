import 'package:flutter/material.dart';
import 'package:framefetch/core/network/data_request_failure.dart';
import 'package:framefetch/features/download/application/download_intake_controller.dart';
import 'package:framefetch/features/download/presentation/download_status.dart';
import 'package:framefetch/features/download/presentation/inspection_workspace.dart';
import 'package:framefetch/features/download/presentation/intake_failure_message.dart';
import 'package:framefetch/features/download/presentation/source_discovery_workspace.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class DownloadIntakeWorkspace extends StatelessWidget {
  const DownloadIntakeWorkspace({
    required this.onCancelIntent,
    required this.onCreate,
    required this.onOpenJob,
    required this.onRefreshIntent,
    required this.onRetryInspection,
    required this.onSelectFormat,
    required this.onSelectItem,
    required this.state,
    this.onUseUpload,
    this.onReparse,
    super.key,
  });

  final VoidCallback onCancelIntent;
  final VoidCallback onCreate;
  final ValueChanged<String> onOpenJob;
  final VoidCallback onRefreshIntent;
  final VoidCallback onRetryInspection;
  final ValueChanged<String> onSelectFormat;
  final ValueChanged<String> onSelectItem;
  final DownloadIntakeState state;
  final VoidCallback? onUseUpload;
  final VoidCallback? onReparse;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final inspection = state.inspection;
    final intent = state.intent;
    final expired =
        (inspection != null && !inspection.expiresAt.isAfter(DateTime.now())) ||
        (state.error is DataRequestFailure &&
            (state.error! as DataRequestFailure).code == 'resource_expired');
    final status = intent == null
        ? null
        : switch (intent.status) {
            IntentStatus.queued => localizations.intentQueued,
            IntentStatus.resolving => localizations.intentResolving,
            IntentStatus.cancelling => localizations.intentCancelling,
            IntentStatus.failed => localizations.intentFailed,
            IntentStatus.cancelled => localizations.intentCancelled,
            IntentStatus.expired => localizations.intentExpired,
            IntentStatus.handedOff => localizations.intentHandedOff,
            _ => localizations.inspectionResultTitle,
          };
    final reason = intent == null
        ? null
        : intentFailureMessage(localizations, intent);
    return Column(
      key: const Key('download-intake-workspace'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (intent == null && inspection == null && state.discovery != null)
          SourceDiscoveryWorkspace(
            busy: state.busy,
            discovery: state.discovery!,
            onSelect: onSelectItem,
          ),
        if (intent == null &&
            state.discovery != null &&
            !state.discovery!.expiresAt.isAfter(DateTime.now()) &&
            onReparse != null)
          ShadButton.outline(
            onPressed: state.busy ? null : onReparse,
            child: Text(localizations.reparseDownloadAction),
          ),
        if (intent != null &&
            (intent.status != IntentStatus.ready ||
                inspection == null ||
                expired)) ...[
          DownloadInlineStatus(
            message: expired
                ? '${localizations.intentExpired} — ${localizations.intentRefreshHint}'
                : intent.status == IntentStatus.ready && inspection == null
                ? localizations.serviceUnavailableError
                : reason == null
                ? status ?? localizations.inspectionResultTitle
                : '$status — $reason',
            tone: DownloadNoticeTone.neutral,
          ),
          const SizedBox(height: 12),
          if (intent.status == IntentStatus.ready && expired)
            ShadButton(
              onPressed: state.busy ? null : onRefreshIntent,
              child: Text(localizations.intentRefreshAction),
            ),
          if (intent.status == IntentStatus.ready &&
              inspection == null &&
              !expired)
            ShadButton.outline(
              onPressed: state.busy ? null : onRetryInspection,
              child: Text(localizations.retryAction),
            ),
          if (intent.status == IntentStatus.handedOff && intent.jobId != null)
            ShadButton(
              onPressed: () => onOpenJob(intent.jobId!),
              child: Text(localizations.downloadDetailNavigation),
            ),
          if ((intent.status == IntentStatus.failed ||
                  intent.status == IntentStatus.cancelled ||
                  intent.status == IntentStatus.expired) &&
              onReparse != null)
            ShadButton.outline(
              onPressed: state.busy ? null : onReparse,
              child: Text(localizations.reparseDownloadAction),
            ),
          if (intent.status == IntentStatus.queued ||
              intent.status == IntentStatus.resolving ||
              intent.status == IntentStatus.cancelling)
            ShadButton.outline(
              onPressed: state.busy || state.cancelling ? null : onCancelIntent,
              child: Text(
                state.cancelling
                    ? localizations.intentCancelling
                    : localizations.intentCancelAction,
              ),
            ),
        ] else if (inspection != null && expired) ...[
          DownloadInlineStatus(
            message: localizations.intentExpired,
            tone: DownloadNoticeTone.neutral,
          ),
          if (onReparse != null) ...[
            const SizedBox(height: 12),
            ShadButton.outline(
              onPressed: state.busy ? null : onReparse,
              child: Text(localizations.reparseDownloadAction),
            ),
          ],
        ] else if (inspection != null)
          InspectionWorkspace(
            onCreate: onCreate,
            onSelectFormat: onSelectFormat,
            state: state,
            onUseUpload: onUseUpload,
          ),
      ],
    );
  }
}
