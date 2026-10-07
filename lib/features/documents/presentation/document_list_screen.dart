import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/documents/application/document_list_provider.dart';
import 'package:framefetch/features/documents/presentation/document_list_item.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_loading.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:framefetch/shared/presentation/data_request_failure_message.dart';
import 'package:framefetch/shared/presentation/list_query.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

final class DocumentListScreen extends ConsumerStatefulWidget {
  const DocumentListScreen({this.onUpload, super.key});

  final VoidCallback? onUpload;

  @override
  ConsumerState<DocumentListScreen> createState() => _DocumentListScreenState();
}

final class _DocumentListScreenState extends ConsumerState<DocumentListScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
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
        loading: () => const [AppLoading()],
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
          onPage: ref.read(documentListQueryProvider.notifier).page,
        ),
        DataStateMessage(
          title: localizations.documentEmptyTitle,
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
      SlidableAutoCloseBehavior(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final item in data.items) DocumentListItem(item: item),
          ],
        ),
      ),
      ListPagination(
        page: ref.watch(documentListQueryProvider).page,
        total: data.total,
        pageSize: ref.watch(documentListQueryProvider).pageSize,
        onPageSize: ref.read(documentListQueryProvider.notifier).pageSize,
        onPage: ref.read(documentListQueryProvider.notifier).page,
      ),
    ];
  }
}
