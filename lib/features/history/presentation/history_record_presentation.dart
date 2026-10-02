import 'package:framegrab/features/analysis/presentation/analysis_presentation_labels.dart';
import 'package:framegrab/features/documents/presentation/document_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

typedef HistoryRecordPresentation = ({
  String id,
  String title,
  String kind,
  String status,
  DateTime createdAt,
  bool selectable,
  bool sourceUnavailable,
});

HistoryRecordPresentation presentHistoryRecord(
  Object record,
  AppLocalizations l,
) => switch (record) {
  final ParseHistoryRecordResponse item => (
    id: item.id,
    title: item.title ?? l.inspectionResultTitle,
    kind: l.activityHistoryLink,
    status: switch (item.status) {
      IntentStatus.queued => l.intentQueued,
      IntentStatus.resolving => l.intentResolving,
      IntentStatus.cancelling => l.intentCancelling,
      IntentStatus.failed => l.intentFailed,
      IntentStatus.cancelled => l.intentCancelled,
      IntentStatus.expired => l.intentExpired,
      IntentStatus.handedOff => l.intentHandedOff,
      _ => l.inspectionResultTitle,
    },
    createdAt: item.createdAt,
    selectable: item.status == IntentStatus.ready && item.inspectionId != null,
    sourceUnavailable:
        item.sourceAvailability == HistoryAvailability.unavailable,
  ),
  final DocumentParseHistoryRecordResponse item => (
    id: item.id,
    title: item.title,
    kind: l.activityHistoryBasic,
    status: documentStatusLabel(l, item.status.name),
    createdAt: item.createdAt,
    selectable: false,
    sourceUnavailable:
        item.sourceAvailability == HistoryAvailability.unavailable,
  ),
  final VideoAnalysisHistoryRecordResponse item => (
    id: item.id,
    title: item.title,
    kind: '${l.activityHistoryVideo} · ${item.skillId}',
    status: analysisStatusLabel(l, item.status),
    createdAt: item.createdAt,
    selectable: false,
    sourceUnavailable:
        item.sourceAvailability == HistoryAvailability.unavailable,
  ),
  final ScreenplayAnalysisHistoryRecordResponse item => (
    id: item.id,
    title: item.title,
    kind:
        '${item.resultContract == AnalysisResultContract.screenplayRewrite ? l.activityHistoryRewrite : l.screenplayAnalysisTitle} · ${item.skillId}',
    status: analysisStatusLabel(l, item.status),
    createdAt: item.createdAt,
    selectable: false,
    sourceUnavailable:
        item.sourceAvailability == HistoryAvailability.unavailable,
  ),
  _ => throw StateError('Unsupported history record'),
};
