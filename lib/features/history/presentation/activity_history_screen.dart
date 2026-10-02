import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/history/application/activity_history_provider.dart';
import 'package:framegrab/features/history/application/activity_history_query.dart';
import 'package:framegrab/features/history/presentation/activity_history_filters.dart';
import 'package:framegrab/features/history/presentation/activity_history_item.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_navigation_bar.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:framegrab/shared/presentation/cursor_pagination.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:go_router/go_router.dart';
import 'package:video_server_api/video_server_api.dart';

final class ActivityHistoryScreen extends ConsumerStatefulWidget {
  const ActivityHistoryScreen({this.documentId, this.downloadId, super.key});
  final String? documentId;
  final String? downloadId;

  @override
  ConsumerState<ActivityHistoryScreen> createState() =>
      _ActivityHistoryScreenState();
}

final class _ActivityHistoryScreenState
    extends ConsumerState<ActivityHistoryScreen> {
  late ActivityHistoryQuery _query = ActivityHistoryQuery(
    documentId: widget.documentId,
    downloadId: widget.downloadId,
  );
  final List<HistoryRecordCursorResponse?> _cursors = [null];

  void _filter(ActivityHistoryQuery next) => setState(() {
    _query = next;
    _cursors.clear();
    _cursors.add(null);
  });

  void _open(Object record) {
    final destination = switch (record) {
      final ParseHistoryRecordResponse item when item.jobId != null =>
        '/downloads/${Uri.encodeComponent(item.jobId!)}',
      final ParseHistoryRecordResponse item =>
        '/download-intents/${Uri.encodeComponent(item.id)}',
      final DocumentParseHistoryRecordResponse item =>
        '/documents/${Uri.encodeComponent(item.documentId)}',
      final VideoAnalysisHistoryRecordResponse item =>
        '/analyses/${Uri.encodeComponent(item.id)}',
      final ScreenplayAnalysisHistoryRecordResponse item =>
        '/analyses/${Uri.encodeComponent(item.id)}',
      _ => null,
    };
    if (destination != null) unawaited(context.push<void>(destination));
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final result = ref.watch(activityHistoryProvider(_query));
    return Scaffold(
      appBar: const AppNavigationBar(backFallbackLocation: '/'),
      body: DataPageView(
        title: l.activityHistoryTitle,
        description: l.activityHistoryDescription,
        refreshLabel: l.refreshAction,
        onRefresh: () async {
          ref.invalidate(activityHistoryProvider(_query));
          await ref.read(activityHistoryProvider(_query).future);
        },
        children: [
          ActivityHistoryFilters(
            query: _query,
            onFilter: _filter,
            skills: ref.watch(activitySkillsProvider).value ?? const [],
          ),
          const SizedBox(height: AppSpacing.xLarge),
          ...result.when(
            data: (data) => _content(context, data),
            error: (error, _) => [
              DataStateMessage(
                title: l.loadFailedTitle,
                description: dataRequestFailureMessage(l, error),
                actionLabel: l.retryAction,
                onAction: () => ref.invalidate(activityHistoryProvider(_query)),
              ),
            ],
            loading: () => [
              const Align(alignment: Alignment.centerLeft, child: AppSpinner()),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _content(BuildContext context, HistoryRecordPageResponse data) {
    final l = AppLocalizations.of(context);
    final records = data.items
        .map((item) => item.oneOf.value)
        .whereType<Object>()
        .toList();
    return [
      if (records.isEmpty)
        DataStateMessage(
          title: l.activityHistoryEmpty,
          description: l.activityHistoryDescription,
        ),
      for (final record in records)
        ActivityHistoryItem(record: record, onOpen: () => _open(record)),
      CursorPagination(
        page: _cursors.length,
        hasNext: data.nextCursor != null,
        pageSize: _query.pageSize,
        onPageSize: (value) => _filter(_query.filter(pageSize: value)),
        onPrevious: () => setState(() {
          _cursors.removeLast();
          _query = _query.at(_cursors.last);
        }),
        onNext: () {
          if (data.nextCursor == null) return;
          setState(() {
            _cursors.add(data.nextCursor);
            _query = _query.at(data.nextCursor);
          });
        },
      ),
    ];
  }
}
