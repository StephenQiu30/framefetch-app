import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/documents/application/document_bulk_delete.dart';
import 'package:framegrab/features/documents/application/document_list_provider.dart';
import 'package:framegrab/features/documents/presentation/document_list_item.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:framegrab/shared/presentation/deletion_failure_message.dart';
import 'package:framegrab/shared/presentation/destructive_confirmation.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:framegrab/shared/presentation/swipe_action_hint.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class DocumentListScreen extends ConsumerStatefulWidget {
  const DocumentListScreen({this.onUpload, super.key});

  final VoidCallback? onUpload;

  @override
  ConsumerState<DocumentListScreen> createState() => _DocumentListScreenState();
}

final class _DocumentListScreenState extends ConsumerState<DocumentListScreen> {
  final Set<String> _selected = {};
  bool _busy = false;
  String? _message;

  Future<void> _deleteSelected() async {
    if (_busy || _selected.isEmpty) return;
    final l = AppLocalizations.of(context);
    final session = ref.read(authSessionProvider.notifier);
    final generation = session.sessionGeneration;
    final ids = _selected.toList();
    final confirmed = await showDestructiveConfirmation(
      context: context,
      title: '${l.bulkDelete} (${ids.length})',
      description: l.deleteDocumentDescription,
      cancelLabel: l.keepDocumentAction,
      confirmLabel: l.confirmDeleteAction,
    );
    if (!confirmed || !mounted || generation != session.sessionGeneration) {
      return;
    }
    setState(() {
      _busy = true;
      _message = null;
    });
    try {
      final result = await ref.read(documentBulkDeleteProvider).run(ids);
      if (!mounted || !result.current) return;
      setState(() {
        _selected.removeAll(result.completed);
        _message =
            '${l.bulkActionSummary}: ${result.completed.length} · ${l.failedLabel}: ${result.errors.length}'
            '${result.errors.isEmpty ? '' : '\n${result.errors.values.map((e) => deletionFailureMessage(l, e)).join('\n')}'}';
      });
      ref.invalidate(documentListProvider);
    } finally {
      if (mounted && generation == session.sessionGeneration) {
        setState(() => _busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    ref.watch(documentBulkDeleteProvider);
    ref.listen(documentListQueryProvider, (_, _) {
      _selected.clear();
      _message = null;
    });
    ref.listen(authSessionProvider.select((s) => s.user?.id), (previous, next) {
      if (previous != next) {
        setState(() {
          _selected.clear();
          _message = null;
          _busy = false;
        });
      }
    });
    ref.listen(documentListProvider, (_, next) {
      final data = next.value;
      final query = ref.read(documentListQueryProvider);
      if (data == null ||
          data.page != query.page ||
          data.pageSize != query.pageSize) {
        return;
      }
      final last = (data.total / query.pageSize).ceil().clamp(1, 1000000);
      if (query.page > last) {
        unawaited(
          Future<void>.microtask(() {
            if (mounted) {
              ref.read(documentListQueryProvider.notifier).page(last);
            }
          }),
        );
      }
    });
    final result = ref.watch(documentListProvider);
    return DataPageView(
      title: localizations.screenplayDocumentsNavigation,
      description: localizations.screenplayDocumentsDescription,
      refreshLabel: localizations.refreshAction,
      onRefresh: () => ref.refresh(documentListProvider.future).then((_) {}),
      children: result.when(
        data: (data) => _content(context, data),
        error: (error, _) => [
          DataStateMessage(
            icon: PhosphorIconsRegular.cloudSlash,
            title: localizations.loadFailedTitle,
            description: dataRequestFailureMessage(localizations, error),
            actionLabel: localizations.retryAction,
            onAction: () => ref.invalidate(documentListProvider),
          ),
        ],
        loading: () => [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Align(alignment: Alignment.centerLeft, child: AppSpinner()),
          ),
          Text(localizations.loadingData),
        ],
      ),
    );
  }

  List<Widget> _content(BuildContext context, DocumentPageResponse data) {
    final localizations = AppLocalizations.of(context);
    if (data.items.isEmpty) {
      return [
        ListPagination(
          page: ref.watch(documentListQueryProvider).page,
          total: data.total,
          pageSize: ref.watch(documentListQueryProvider).pageSize,
          onPageSize: ref.read(documentListQueryProvider.notifier).pageSize,
          busy: _busy,
          onPage: ref.read(documentListQueryProvider.notifier).page,
        ),
        DataStateMessage(
          title: localizations.documentEmptyTitle,
          description: localizations.documentEmptyDescription,
          icon: PhosphorIconsRegular.fileText,
          actionEmphasis: DataStateActionEmphasis.primary,
          actionLabel: widget.onUpload == null
              ? null
              : localizations.goToScreenplayUploadAction,
          actionIcon: null,
          onAction: widget.onUpload,
        ),
      ];
    }
    return [
      DataMetricGrid(
        keyPrefix: 'document-summary',
        metrics: [
          DataMetricValue(
            key: 'total',
            label: localizations.totalLabel,
            value: '${data.total}',
          ),
          DataMetricValue(
            key: 'available',
            label: localizations.currentPageAvailable,
            value:
                '${data.items.where((item) => item.status.name == 'ready').length}',
          ),
        ],
      ),
      const SizedBox(height: AppSpacing.xLarge),
      if (_message != null) Text(_message!),
      Wrap(
        spacing: AppSpacing.small,
        runSpacing: AppSpacing.small,
        children: [
          ShadButton.ghost(
            onPressed: _busy
                ? null
                : () => setState(
                    () => _selected.addAll(data.items.map((i) => i.id)),
                  ),
            child: Text(localizations.bulkSelectAll),
          ),
          ShadButton.ghost(
            onPressed: _busy || _selected.isEmpty
                ? null
                : () => setState(_selected.clear),
            child: Text(localizations.bulkClear),
          ),
          if (_selected.isNotEmpty)
            ShadButton.outline(
              onPressed: _busy ? null : () => unawaited(_deleteSelected()),
              child: Text('${localizations.bulkDelete} (${_selected.length})'),
            ),
        ],
      ),
      const SizedBox(height: AppSpacing.large),
      SwipeActionHint(label: localizations.documentRowActionsHint),
      const SizedBox(height: AppSpacing.small),
      SlidableAutoCloseBehavior(
        child: Column(
          children: [
            for (final item in data.items)
              Row(
                children: [
                  ShadCheckbox(
                    checkboxPadding: const EdgeInsets.all(12),
                    key: Key('select-document-${item.id}'),
                    value: _selected.contains(item.id),
                    enabled: !_busy,
                    onChanged: (value) => setState(() {
                      if (value) {
                        _selected.add(item.id);
                      } else {
                        _selected.remove(item.id);
                      }
                    }),
                  ),
                  const SizedBox(width: AppSpacing.small),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: _busy,
                      child: DocumentListItem(item: item),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      ListPagination(
        page: ref.watch(documentListQueryProvider).page,
        total: data.total,
        pageSize: ref.watch(documentListQueryProvider).pageSize,
        onPageSize: ref.read(documentListQueryProvider.notifier).pageSize,
        busy: _busy,
        onPage: ref.read(documentListQueryProvider.notifier).page,
      ),
    ];
  }
}
