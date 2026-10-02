import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/download/presentation/intake_failure_message.dart';
import 'package:framegrab/features/history/application/activity_history_provider.dart';
import 'package:framegrab/features/history/application/activity_history_query.dart';
import 'package:framegrab/features/history/application/bulk_parse_download.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/presentation/activity_history_filters.dart';
import 'package:framegrab/features/history/presentation/activity_history_item.dart';
import 'package:framegrab/features/history/presentation/history_record_presentation.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_navigation_bar.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:framegrab/shared/presentation/cursor_pagination.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
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
  final Set<String> _selected = {};
  bool _busy = false;
  int _completed = 0;
  int _total = 0;
  String? _message;

  void _filter(ActivityHistoryQuery next) => setState(() {
    _query = next;
    _cursors.clear();
    _cursors.add(null);
    _selected.clear();
    _message = null;
  });

  Future<void> _bulk(List<ParseHistoryRecordResponse> items) async {
    if (_busy || items.isEmpty) return;
    final session = ref.read(authSessionProvider.notifier);
    final generation = session.sessionGeneration;
    setState(() {
      _busy = true;
      _completed = 0;
      _total = items.length;
      _message = null;
    });
    try {
      final result = await ref
          .read(bulkParseDownloadProvider)
          .run(
            items,
            onProgress: (done, total) {
              if (mounted) {
                setState(() {
                  _completed = done;
                  _total = total;
                });
              }
            },
          );
      if (!mounted || !result.current) return;
      final l = AppLocalizations.of(context);
      setState(() {
        _selected.removeAll(result.completed);
        _message =
            '${l.bulkActionSummary}: ${result.completed.length} · ${l.failedLabel}: ${result.errors.length}'
            '${result.errors.isEmpty ? '' : '\n${result.errors.values.map((e) => intakeFailureMessage(l, e)).join('\n')}'}';
      });
      ref.invalidate(downloadHistoryProvider);
      ref.invalidate(activityHistoryProvider);
    } finally {
      if (mounted && generation == session.sessionGeneration) {
        setState(() => _busy = false);
      }
    }
  }

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
    ref.watch(bulkParseDownloadProvider);
    ref.listen(authSessionProvider.select((s) => s.user?.id), (previous, next) {
      if (previous != next) {
        setState(() {
          _selected.clear();
          _message = null;
          _busy = false;
        });
      }
    });
    final result = ref.watch(activityHistoryProvider(_query));
    return Scaffold(
      appBar: const AppNavigationBar(backFallbackLocation: '/'),
      body: DataPageView(
        title: l.activityHistoryTitle,
        description: l.activityHistoryDescription,
        refreshLabel: l.refreshAction,
        onRefresh: () async {
          if (!_busy) ref.invalidate(activityHistoryProvider(_query));
          await ref.read(activityHistoryProvider(_query).future);
        },
        children: [
          ActivityHistoryFilters(
            query: _query,
            onFilter: _filter,
            busy: _busy,
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
            loading: () => [const Center(child: AppSpinner())],
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
    final selectable = records
        .whereType<ParseHistoryRecordResponse>()
        .where((item) => presentHistoryRecord(item, l).selectable)
        .toList();
    final selected = selectable
        .where((item) => _selected.contains(item.id))
        .toList();
    return [
      if (_message != null)
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.large),
          child: Semantics(liveRegion: true, child: Text(_message!)),
        ),
      if (selectable.isNotEmpty)
        Wrap(
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.small,
          children: [
            ShadButton.ghost(
              onPressed: _busy
                  ? null
                  : () => setState(
                      () => _selected.addAll(selectable.map((i) => i.id)),
                    ),
              child: Text(l.bulkSelectAll),
            ),
            ShadButton.ghost(
              onPressed: _busy || _selected.isEmpty
                  ? null
                  : () => setState(_selected.clear),
              child: Text(l.bulkClear),
            ),
            if (selected.isNotEmpty)
              ShadButton.outline(
                onPressed: _busy ? null : () => unawaited(_bulk(selected)),
                child: Text('${l.bulkDownload} (${selected.length})'),
              ),
          ],
        ),
      if (_busy)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
          child: Semantics(
            liveRegion: true,
            child: Text('$_completed / $_total'),
          ),
        ),
      if (records.isEmpty)
        DataStateMessage(
          title: l.intentHistoryEmpty,
          description: l.activityHistoryDescription,
        ),
      for (final record in records)
        ActivityHistoryItem(
          record: record,
          onOpen: () => _open(record),
          busy: _busy,
          selected: _selected.contains(presentHistoryRecord(record, l).id),
          onSelected: (value) => setState(() {
            final id = presentHistoryRecord(record, l).id;
            if (value) {
              _selected.add(id);
            } else {
              _selected.remove(id);
            }
          }),
        ),
      CursorPagination(
        page: _cursors.length,
        hasNext: data.nextCursor != null,
        pageSize: _query.pageSize,
        busy: _busy,
        onPageSize: (value) => _filter(_query.filter(pageSize: value)),
        onPrevious: () => setState(() {
          _cursors.removeLast();
          _query = _query.at(_cursors.last);
          _selected.clear();
        }),
        onNext: () {
          if (data.nextCursor == null) return;
          setState(() {
            _cursors.add(data.nextCursor);
            _query = _query.at(data.nextCursor);
            _selected.clear();
          });
        },
      ),
    ];
  }
}
