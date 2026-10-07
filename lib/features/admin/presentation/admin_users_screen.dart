import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/features/admin/application/admin_mutation_controller.dart';
import 'package:framefetch/features/admin/application/admin_providers.dart';
import 'package:framefetch/features/admin/data/admin_repository.dart';
import 'package:framefetch/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framefetch/features/admin/presentation/admin_page.dart';
import 'package:framefetch/features/admin/presentation/admin_user_editor.dart';
import 'package:framefetch/features/admin/presentation/admin_user_row.dart';
import 'package:framefetch/features/auth/application/auth_session_controller.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_dropdown_field.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:framefetch/shared/presentation/data_request_failure_message.dart';
import 'package:framefetch/shared/presentation/list_filters.dart';
import 'package:framefetch/shared/presentation/list_query.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminUsersScreen extends ConsumerWidget {
  const AdminUsersScreen({super.key});

  Future<void> _delete(BuildContext context, WidgetRef ref, String id) async {
    final l = AppLocalizations.of(context);
    if (!await confirmAdminDelete(
          context,
          title: l.deleteAction,
          description: l.adminDeleteUserDescription,
        ) ||
        !context.mounted) {
      return;
    }
    final query = ref.read(userListQueryProvider);
    final total = ref.read(adminUsersProvider).value?.total ?? 0;
    final result = await ref
        .read(adminUserMutationProvider.notifier)
        .run(() => ref.read(adminRepositoryProvider).deleteUser(id));
    if (!context.mounted || result == AdminMutationResult.stale) return;
    if (result == AdminMutationResult.failed) {
      ShadSonner.of(
        context,
      ).show(ShadToast(description: Text(l.adminActionFailed)));
      return;
    }
    final lastPage = ((total - 1) / query.pageSize).ceil().clamp(1, 1000000);
    if (query.page > lastPage) {
      ref.read(userListQueryProvider.notifier).page(lastPage);
    }
    ref.invalidate(adminUsersProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final currentUserId = ref.watch(authSessionProvider).user?.id;
    final result = ref.watch(adminUsersProvider);
    final query = ref.watch(userListQueryProvider);
    final busy = ref.watch(adminUserMutationProvider);
    return AdminPage(
      title: l.adminUsersTitle,
      refreshLabel: l.refreshAction,
      onRefresh: () => ref.refresh(adminUsersProvider.future).then((_) {}),
      children: [
        AppDropdownField<String>(
          enabled: !busy,
          value: ref.watch(userRoleFilterProvider)?.name ?? '',
          label: l.adminRoleLabel,
          options: [
            AppDropdownOption(value: '', label: l.allRoles),
            AppDropdownOption(value: 'user', label: l.adminRoleUser),
            AppDropdownOption(value: 'admin', label: l.adminRoleAdmin),
          ],
          onSelected: (v) => ref
              .read(userRoleFilterProvider.notifier)
              .select(v == null || v.isEmpty ? null : UserRole.valueOf(v)),
        ),
        ListFilters(
          query: query,
          searchLabel: l.searchUsers,
          statuses: {
            'active': l.adminAccountEnabled,
            'inactive': l.adminAccountDisabled,
          },
          onSearch: (v) {
            if (!busy) {
              ref
                  .read(userListQueryProvider.notifier)
                  .filter(search: v, status: query.status);
            }
          },
          onStatus: (v) {
            if (!busy) {
              ref.read(userListQueryProvider.notifier).filter(status: v);
            }
          },
        ),
        ...result.when(
          data: (data) => [
            if (data.items.isEmpty) DataStateMessage(title: l.adminUsersEmpty),
            for (final user in data.items)
              AdminUserRow(
                key: ValueKey('admin-user-${user.id}'),
                user: user,
                isCurrent: user.id == currentUserId,
                busy: busy,
                onEdit: () => editAdminUser(context, ref, user),
                onDelete: () => _delete(context, ref, user.id),
              ),
            if (data.total > 0)
              ListPagination(
                page: query.page,
                pageSize: query.pageSize,
                total: data.total,
                busy: busy,
                onPage: ref.read(userListQueryProvider.notifier).page,
                onPageSize: ref.read(userListQueryProvider.notifier).pageSize,
              ),
          ],
          error: (error, _) => adminError(
            action: l.retryAction,
            title: l.loadFailedTitle,
            description: dataRequestFailureMessage(l, error),
            retry: () => ref.invalidate(adminUsersProvider),
          ),
          loading: () => adminLoading(l.loadingData),
        ),
      ],
    );
  }
}
