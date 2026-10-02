import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/operation_log_query.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/features/admin/presentation/operation_log_details.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminOperationLogsScreen extends ConsumerStatefulWidget {
  const AdminOperationLogsScreen({super.key});
  @override
  ConsumerState<AdminOperationLogsScreen> createState() =>
      _AdminOperationLogsScreenState();
}

final class _AdminOperationLogsScreenState
    extends ConsumerState<AdminOperationLogsScreen> {
  final _search = TextEditingController();
  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final query = ref.watch(operationLogQueryProvider);
    final controller = ref.read(operationLogQueryProvider.notifier);
    final result = query.hasValidDates
        ? ref.watch(adminOperationLogsProvider)
        : null;
    return AdminPage(
      title: l.adminOperationLogsTitle,
      refreshLabel: l.refreshAction,
      onRefresh: () async {
        if (query.hasValidDates) {
          if (query.page != 1) {
            controller.page(1);
          } else {
            await ref.refresh(adminOperationLogsProvider.future).then((_) {});
          }
        }
      },
      children: [
        ShadInputDecorator(
          label: Text(l.adminOperationLogSearch),
          child: Row(
            children: [
              Expanded(
                child: ShadInput(
                  controller: _search,
                  maxLength: 128,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) => controller.filters(search: value),
                ),
              ),
              const SizedBox(width: AppSpacing.small),
              ShadButton.outline(
                onPressed: () => controller.filters(search: _search.text),
                child: Text(l.searchAction),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.medium),
        AppDropdownField<String>(
          value: query.scope,
          label: l.adminOperationScope,
          options: [
            AppDropdownOption(value: 'all', label: l.adminAllOperations),
            AppDropdownOption(
              value: 'request',
              label: l.adminRequestOperations,
            ),
            AppDropdownOption(value: 'task', label: l.adminTaskOperations),
            AppDropdownOption(value: 'admin', label: l.adminAdminOperations),
          ],
          onSelected: (v) {
            if (v != null) controller.filters(scope: v);
          },
        ),
        const SizedBox(height: AppSpacing.medium),
        AppDropdownField<String>(
          value: query.outcome,
          label: l.adminOperationOutcome,
          options: [
            AppDropdownOption(value: 'all', label: l.adminAllOutcomes),
            AppDropdownOption(value: 'started', label: l.adminOperationStarted),
            AppDropdownOption(
              value: 'succeeded',
              label: l.adminOperationSucceededFilter,
            ),
            AppDropdownOption(value: 'failed', label: l.adminOperationFailed),
          ],
          onSelected: (v) {
            if (v != null) controller.filters(outcome: v);
          },
        ),
        const SizedBox(height: AppSpacing.medium),
        ShadInputDecorator(
          label: Text(l.adminOperationFrom),
          child: ShadInput(
            placeholder: Text(l.adminOperationDateHint),
            onChanged: (v) => controller.filters(from: v),
          ),
        ),
        const SizedBox(height: AppSpacing.medium),
        ShadInputDecorator(
          label: Text(l.adminOperationTo),
          child: ShadInput(
            placeholder: Text(l.adminOperationDateHint),
            onChanged: (v) => controller.filters(to: v),
          ),
        ),
        const SizedBox(height: AppSpacing.large),
        if (!query.hasValidDates)
          ShadAlert.destructive(
            description: Text(l.adminOperationInvalidDates),
          ),
        if (result != null)
          ...result.when(
            data: (data) => [
              if (data.items.isEmpty)
                DataStateMessage(title: l.adminOperationLogsEmpty),
              for (final item in data.items)
                Padding(
                  key: ValueKey('admin-log-${item.id}'),
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.medium,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.description,
                        style: ShadTheme.of(context).textTheme.large,
                      ),
                      const SizedBox(height: AppSpacing.xSmall),
                      Text(
                        '${formatDataTime(context, item.createdAt)} · ${item.actorName ?? l.adminUnknownAccount}\n${item.source_.name == 'task'
                            ? l.adminTaskOperations
                            : item.route.contains('/admin/')
                            ? l.adminAdminOperations
                            : l.adminRequestOperations}',
                        style: ShadTheme.of(context).textTheme.muted,
                      ),
                      Text(
                        '${l.adminOperationObject}: ${item.resourceKey ?? item.resourceId ?? '—'}',
                      ),
                      Text(operationLogResult(l, item)),
                      ShadButton.ghost(
                        onPressed: () => showOperationLogDetails(context, item),
                        child: Text(l.adminOperationDetails),
                      ),
                    ],
                  ),
                ),
              ListPagination(
                page: query.page,
                pageSize: query.pageSize,
                total: data.total,
                onPage: controller.page,
                onPageSize: controller.pageSize,
              ),
            ],
            error: (error, _) => adminError(
              action: l.retryAction,
              title: l.loadFailedTitle,
              description: dataRequestFailureMessage(l, error),
              retry: () => ref.invalidate(adminOperationLogsProvider),
            ),
            loading: () => adminLoading(l.loadingData),
          ),
      ],
    );
  }
}
