import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:video_server_api/video_server_api.dart';

final adminAnalyticsProvider = FutureProvider.autoDispose
    .family<DownloadAnalyticsResponse, int>((ref, days) {
      _watchSession(ref);
      return ref.watch(adminRepositoryProvider).fetchAnalytics(days);
    }, retry: (_, _) => null);

final adminAnalysisAnalyticsProvider = FutureProvider.autoDispose
    .family<AnalysisAnalyticsResponse, int>((ref, days) {
      _watchSession(ref);
      return ref.watch(adminRepositoryProvider).fetchAnalysisAnalytics(days);
    }, retry: (_, _) => null);

final openRouterModelsProvider =
    FutureProvider.autoDispose<AiModelListResponse>((ref) {
      _watchSession(ref);
      return ref.watch(adminRepositoryProvider).fetchOpenRouterModels();
    }, retry: (_, _) => null);

final adminFilesProvider = FutureProvider.autoDispose<StoredFileListResponse>((
  ref,
) {
  _watchSession(ref);
  return ref
      .watch(adminRepositoryProvider)
      .fetchFiles(
        page: ref.watch(fileListQueryProvider).page,
        pageSize: ref.watch(fileListQueryProvider).pageSize,
      );
}, retry: (_, _) => null);

final adminUsersProvider = FutureProvider.autoDispose<ManagedUserListResponse>((
  ref,
) {
  _watchSession(ref);
  return ref
      .watch(adminRepositoryProvider)
      .fetchUsers(
        page: ref.watch(userListQueryProvider).page,
        pageSize: ref.watch(userListQueryProvider).pageSize,
        search: ref.watch(userListQueryProvider).search.isEmpty
            ? null
            : ref.watch(userListQueryProvider).search,
        role: ref.watch(userRoleFilterProvider),
        active: ref.watch(userListQueryProvider).status == null
            ? null
            : ref.watch(userListQueryProvider).status == 'active',
      );
}, retry: (_, _) => null);

final adminProviderCatalogProvider =
    FutureProvider.autoDispose<ProviderCatalogListResponse>((ref) {
      _watchSession(ref);
      return ref.watch(adminRepositoryProvider).fetchProviders();
    }, retry: (_, _) => null);

final adminAiProvidersProvider =
    FutureProvider.autoDispose<AiProviderProfileListResponse>((ref) {
      _watchSession(ref);
      return ref.watch(adminRepositoryProvider).fetchAiProviders();
    }, retry: (_, _) => null);

final userListQueryProvider =
    NotifierProvider.autoDispose<ListQueryController, ListQuery>(
      ListQueryController.new,
    );

final fileListQueryProvider =
    NotifierProvider.autoDispose<ListQueryController, ListQuery>(
      ListQueryController.new,
    );

final userRoleFilterProvider =
    NotifierProvider.autoDispose<UserRoleFilter, UserRole?>(UserRoleFilter.new);

final class UserRoleFilter extends Notifier<UserRole?> {
  @override
  UserRole? build() => null;
  void select(UserRole? value) {
    state = value;
    ref.read(userListQueryProvider.notifier).page(1);
  }
}

void _watchSession(Ref ref) {
  ref.watch(
    authSessionProvider.select(
      (session) => (session.phase, session.user?.id, session.user?.role),
    ),
  );
}
