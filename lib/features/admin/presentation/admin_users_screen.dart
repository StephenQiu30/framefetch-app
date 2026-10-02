import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/application/admin_selection_controller.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_bulk_delete_bar.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/features/admin/presentation/admin_user_editor.dart';
import 'package:framegrab/features/admin/presentation/admin_user_row.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:framegrab/shared/presentation/list_filters.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:video_server_api/video_server_api.dart';

final class AdminUsersScreen extends ConsumerWidget {
  const AdminUsersScreen({super.key});

  Future<void> _delete(
    BuildContext context,
    WidgetRef ref, [
    String? id,
  ]) async {
    final l = AppLocalizations.of(context);
    if (!await confirmAdminDelete(
          context,
          title: id == null ? l.adminDeleteSelectionTitle : l.deleteAction,
          description: l.adminDeleteUserDescription,
        ) ||
        !context.mounted) {
      return;
    }
    final selection = ref.read(adminUserSelectionProvider.notifier);
    if (id != null) selection.selectPage([id], true);
    final query = ref.read(userListQueryProvider);
    final total = ref.read(adminUsersProvider).value?.total ?? 0;
    final requestedCount = ref.read(adminUserSelectionProvider).selected.length;
    final current = await selection.deleteSelected(
      ref.read(adminRepositoryProvider).deleteUser,
    );
    if (!current || !context.mounted) return;
    final removed =
        requestedCount - ref.read(adminUserSelectionProvider).selected.length;
    final lastPage = ((total - removed) / query.pageSize).ceil().clamp(
      1,
      1000000,
    );
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
    final selection = ref.watch(adminUserSelectionProvider);
    final controller = ref.read(adminUserSelectionProvider.notifier);
    ref.listen(userListQueryProvider, (_, _) => controller.clear());
    ref.listen(userRoleFilterProvider, (_, _) => controller.clear());
    return AdminPage(
      title: l.adminUsersTitle,
      description: l.adminUsersDescription,
      refreshLabel: l.refreshAction,
      onRefresh: () => ref.refresh(adminUsersProvider.future).then((_) {}),
      children: [
        AppDropdownField<String>(
          enabled: !selection.busy,
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
            if (!selection.busy) {
              ref
                  .read(userListQueryProvider.notifier)
                  .filter(search: v, status: query.status);
            }
          },
          onStatus: (v) {
            if (!selection.busy) {
              ref.read(userListQueryProvider.notifier).filter(status: v);
            }
          },
        ),
        ...result.when(
          data: (data) => [
            if (data.items.isEmpty)
              DataStateMessage(
                title: l.adminUsersEmpty,
                description: l.adminUsersEmptyDescription,
              ),
            if (data.items.isNotEmpty)
              AdminBulkDeleteBar(
                state: selection,
                eligibleIds: [
                  for (final u in data.items)
                    if (u.id != currentUserId) u.id,
                ],
                onSelectPage: (v) => controller.selectPage(
                  data.items
                      .where((u) => u.id != currentUserId)
                      .map((u) => u.id),
                  v,
                ),
                onDelete: () => _delete(context, ref),
              ),
            for (final user in data.items)
              AdminSelectionRow(
                key: ValueKey('admin-user-${user.id}'),
                selected: selection.selected.contains(user.id),
                enabled: !selection.busy && user.id != currentUserId,
                label: user.username,
                onChanged: (v) => controller.toggle(user.id, v),
                child: AdminUserRow(
                  user: user,
                  isCurrent: user.id == currentUserId,
                  busy: selection.busy,
                  onEdit: () => editAdminUser(context, ref, user),
                  onDelete: () => _delete(context, ref, user.id),
                ),
              ),
            if (data.total > 0)
              ListPagination(
                page: query.page,
                pageSize: query.pageSize,
                total: data.total,
                busy: selection.busy,
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
