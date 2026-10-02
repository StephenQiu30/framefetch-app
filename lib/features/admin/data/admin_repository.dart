import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final adminRepositoryProvider = Provider<AdminRepository>(
  (ref) => GeneratedAdminRepository(ref.watch(authenticatedRequestProvider)),
);

abstract interface class AdminRepository {
  Future<DownloadAnalyticsResponse> fetchAnalytics(int days);
  Future<AnalysisAnalyticsResponse> fetchAnalysisAnalytics(int days);
  Future<AiModelListResponse> fetchOpenRouterModels();
  Future<OperationLogPageResponse> fetchOperationLogs({
    int page = 1,
    int pageSize = 10,
    String? query,
    String? outcome,
    String? source,
    bool adminOnly = false,
    DateTime? createdFrom,
    DateTime? createdTo,
  });
  Future<StoredFileListResponse> fetchFiles({int page = 1, int pageSize = 10});
  Future<ManagedUserListResponse> fetchUsers({
    int page = 1,
    int pageSize = 10,
    String? search,
    bool? active,
    UserRole? role,
  });
  Future<ProviderCatalogListResponse> fetchProviders();
  Future<AiProviderProfileListResponse> fetchAiProviders();
  Future<StorageCleanupResponse> cleanupFiles(int olderThanDays);
  Future<void> updateUser(
    ManagedUserResponse user,
    UserRole role,
    bool active, {
    UserQuotaSettings? quota,
  });
  Future<void> deleteUser(String id);
  Future<void> deleteFile(StoredFileResponse file);
  Future<void> updateProviderVisibility(
    ProviderCatalogEntryResponse provider,
    bool visible,
  );
  Future<void> activateAiProvider(String providerKey);
}

final class GeneratedAdminRepository implements AdminRepository {
  const GeneratedAdminRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<DownloadAnalyticsResponse> fetchAnalytics(int days) => _required(
    (api) =>
        api.getDownloadAnalytics(days: days).then((value) => value.data?.data),
  );

  @override
  Future<StoredFileListResponse> fetchFiles({
    int page = 1,
    int pageSize = 10,
  }) => _required(
    (api) => api
        .listStoredFiles(page: page, pageSize: pageSize)
        .then((value) => value.data?.data),
  );

  @override
  Future<ManagedUserListResponse> fetchUsers({
    int page = 1,
    int pageSize = 10,
    String? search,
    bool? active,
    UserRole? role,
  }) => _required(
    (api) => api
        .listUsers(
          page: page,
          pageSize: pageSize,
          search: search,
          isActive: active,
          role: role,
        )
        .then((value) => value.data?.data),
  );

  @override
  Future<ProviderCatalogListResponse> fetchProviders() => _required(
    (api) => api.listProviderCatalogEntries().then((value) => value.data?.data),
  );

  @override
  Future<AiProviderProfileListResponse> fetchAiProviders() => _required(
    (api) => api.listAiProviderProfiles().then((value) => value.data?.data),
  );

  @override
  Future<StorageCleanupResponse> cleanupFiles(int olderThanDays) => _required(
    (api) => api
        .cleanupStoredFiles(
          storageCleanupRequest: StorageCleanupRequest(
            (builder) => builder..olderThanDays = olderThanDays,
          ),
        )
        .then((value) => value.data?.data),
  );

  @override
  Future<void> updateUser(
    ManagedUserResponse user,
    UserRole role,
    bool active, {
    UserQuotaSettings? quota,
  }) => _request.execute((client) async {
    await client.getAdminApi().updateUserAccess(
      userId: user.id,
      updateUserAccessRequest: UpdateUserAccessRequest(
        (builder) => builder
          ..role = role
          ..isActive = active
          ..quota = quota?.toBuilder(),
      ),
    );
  });

  @override
  Future<void> deleteUser(String id) => _request.execute((client) async {
    await client.getAdminApi().deleteUser(userId: id);
  });

  @override
  Future<void> deleteFile(StoredFileResponse file) => _request.execute((
    client,
  ) async {
    if (file.category == StoredFileCategory.unknownDefaultOpenApi) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    await client.getAdminApi().deleteStoredFile(
      category:
          client.serializers.serializeWith(
                StoredFileCategory.serializer,
                file.category,
              )!
              as String,
      fileId: file.id,
    );
  });

  @override
  Future<AnalysisAnalyticsResponse> fetchAnalysisAnalytics(int days) =>
      _required(
        (api) => api
            .getAnalysisAnalytics(days: days)
            .then((value) => value.data?.data),
      );

  @override
  Future<AiModelListResponse> fetchOpenRouterModels() => _required(
    (api) => api.listOpenRouterModels().then((value) => value.data?.data),
  );

  @override
  Future<OperationLogPageResponse> fetchOperationLogs({
    int page = 1,
    int pageSize = 10,
    String? query,
    String? outcome,
    String? source,
    bool adminOnly = false,
    DateTime? createdFrom,
    DateTime? createdTo,
  }) => _required(
    (api) => api
        .listOperationLogs(
          page: page,
          pageSize: pageSize,
          q: query,
          outcome: outcome,
          source_: source,
          adminOnly: adminOnly,
          createdFrom: createdFrom,
          createdTo: createdTo,
        )
        .then((value) => value.data?.data),
  );

  @override
  Future<void> updateProviderVisibility(
    ProviderCatalogEntryResponse provider,
    bool visible,
  ) => _request.execute((client) async {
    await client.getAdminApi().updateProviderCatalogEntry(
      providerKey: provider.key,
      updateProviderCatalogEntryRequest: UpdateProviderCatalogEntryRequest(
        (builder) => builder..isVisible = visible,
      ),
    );
  });

  @override
  Future<void> activateAiProvider(String providerKey) =>
      _request.execute((client) async {
        await client.getAdminApi().activateAiProviderProfile(
          providerKey: providerKey,
        );
      });

  Future<T> _required<T>(Future<T?> Function(AdminApi api) operation) =>
      _request.execute((client) async {
        final data = await operation(client.getAdminApi());
        if (data == null) {
          throw const DataRequestFailure(
            DataRequestFailureKind.invalidResponse,
          );
        }
        return data;
      });
}
