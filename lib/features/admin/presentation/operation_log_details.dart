import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

String operationLogResult(AppLocalizations l, OperationLogResponse item) {
  if (item.source_.name == 'task') {
    return switch (item.taskState) {
      'queued' => l.downloadStatusQueued,
      'running' => l.activeLabel,
      'ready' => l.documentStatusReady,
      'handed_off' => l.intentHandedOff,
      'succeeded' => l.succeededLabel,
      'failed' => l.failedLabel,
      'cancelled' => l.cancelledLabel,
      'expired' => l.documentStatusExpired,
      'deleted' => l.adminOperationDeleted,
      'pending' => l.analysisStagePending,
      'preparing' => l.analysisStagePreparing,
      'resolving' => l.intentResolving,
      'verifying' => l.analysisStageValidating,
      'uploading' => l.uploadingFile,
      'retry_wait' => l.downloadStatusRetryWait,
      _ => item.taskState ?? l.statusLabel,
    };
  }
  return switch (item.outcome.name) {
    'started' => l.adminOperationStarted,
    'succeeded' => l.adminOperationSucceeded,
    'failed' => l.adminOperationFailed,
    _ => item.outcome.name,
  };
}

Future<void> showOperationLogDetails(
  BuildContext context,
  OperationLogResponse item,
) => showShadDialog<void>(
  context: context,
  builder: (context) {
    final l = AppLocalizations.of(context);
    final entries = <(String, String)>[
      (l.adminOperationId, item.id),
      (l.adminOperationActor, item.actorName ?? l.adminUnknownAccount),
      (l.adminActorId, item.actorId ?? '—'),
      (l.adminOperationLabel, item.description),
      (l.adminOperationKey, item.operation),
      (l.adminOperationEndpoint, '${item.method} ${item.route}'),
      (l.adminOperationObject, item.resourceId ?? item.resourceKey ?? '—'),
      (l.createdAtLabel, formatDataTime(context, item.createdAt)),
      (
        l.adminOperationFinished,
        item.finishedAt == null
            ? l.adminOperationStarted
            : formatDataTime(context, item.finishedAt!),
      ),
      (l.adminOperationOutcome, operationLogResult(l, item)),
      (l.adminOperationStatusCode, item.statusCode?.toString() ?? '—'),
      (l.adminOperationErrorCode, item.errorCode ?? '—'),
    ];
    return ShadDialog(
      title: Text(l.adminOperationDetails),
      scrollable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final entry in entries)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.$1, style: ShadTheme.of(context).textTheme.muted),
                  SelectableText(entry.$2),
                ],
              ),
            ),
        ],
      ),
    );
  },
);
