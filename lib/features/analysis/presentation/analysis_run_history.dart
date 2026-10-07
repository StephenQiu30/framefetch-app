import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/analysis/application/analysis_history_provider.dart';
import 'package:framefetch/features/analysis/presentation/analysis_presentation_labels.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_spinner.dart';
import 'package:framefetch/shared/presentation/cursor_pagination.dart';
import 'package:framefetch/shared/presentation/data_formatters.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:framefetch/shared/presentation/data_request_failure_message.dart';

final class AnalysisRunHistory extends ConsumerStatefulWidget {
  const AnalysisRunHistory({
    required this.analysisId,
    required this.runNo,
    required this.active,
    super.key,
  });
  final String analysisId;
  final int runNo;
  final bool active;

  @override
  ConsumerState<AnalysisRunHistory> createState() => _AnalysisRunHistoryState();
}

final class _AnalysisRunHistoryState extends ConsumerState<AnalysisRunHistory> {
  final List<int?> _cursors = [null];
  int _pageSize = 10;
  Timer? _timer;
  AnalysisRunsQuery get _query => (
    id: widget.analysisId,
    before: _cursors.last,
    pageSize: _pageSize,
    runNo: widget.runNo,
  );

  @override
  void initState() {
    super.initState();
    _poll();
  }

  @override
  void didUpdateWidget(AnalysisRunHistory oldWidget) {
    super.didUpdateWidget(oldWidget);
    final changed =
        oldWidget.analysisId != widget.analysisId ||
        oldWidget.runNo != widget.runNo;
    if (changed) {
      _cursors
        ..clear()
        ..add(null);
    }
    if (oldWidget.active && !widget.active) {
      unawaited(
        Future<void>.microtask(() {
          if (mounted && !widget.active) {
            ref.invalidate(analysisRunsProvider(_query));
          }
        }),
      );
    }
    if (changed || oldWidget.active != widget.active) _poll();
  }

  void _poll() {
    _timer?.cancel();
    if (widget.active) {
      _timer = Timer.periodic(const Duration(seconds: 3), (_) {
        final snapshot = ref.read(analysisRunsProvider(_query));
        if (mounted && !snapshot.isLoading && !snapshot.hasError) {
          ref.invalidate(analysisRunsProvider(_query));
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final runs = ref.watch(analysisRunsProvider(_query));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.analysisRunsTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.large),
        runs.when(
          data: (data) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final run in data.items)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.large),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${l.analysisRunNumber(run.runNo)} · ${analysisStatusLabel(l, run.status)}',
                      ),
                      const SizedBox(height: AppSpacing.xSmall),
                      Text(formatDataTime(context, run.createdAt)),
                      if (run.errorCode != null)
                        Text(analysisFailureMessage(l, run.errorCode)),
                    ],
                  ),
                ),
              CursorPagination(
                page: _cursors.length,
                pageSize: _pageSize,
                hasNext: data.nextBeforeRunNo != null,
                onPageSize: (value) => setState(() {
                  _pageSize = value;
                  _cursors.clear();
                  _cursors.add(null);
                }),
                onPrevious: () => setState(_cursors.removeLast),
                onNext: () {
                  if (data.nextBeforeRunNo != null) {
                    setState(() => _cursors.add(data.nextBeforeRunNo));
                  }
                },
              ),
            ],
          ),
          loading: () => const Center(child: AppSpinner()),
          error: (error, _) => DataStateMessage(
            title: l.loadFailedTitle,
            description: dataRequestFailureMessage(l, error),
            actionLabel: l.retryAction,
            onAction: () => ref.invalidate(analysisRunsProvider(_query)),
          ),
        ),
      ],
    );
  }
}
