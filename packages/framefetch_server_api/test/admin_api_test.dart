import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for AdminApi
void main() {
  final instance = FramefetchServerApi().getAdminApi();

  group(AdminApi, () {
    // 启用 AI 分析 Provider
    //
    //Future<ApiResponseAiProviderProfileResponse> activateAiProviderProfile(String providerKey) async
    test('test activateAiProviderProfile', () async {
      // TODO
    });

    // 手动清理指定天数前的文件
    //
    //Future<ApiResponseStorageCleanupResponse> cleanupStoredFiles(StorageCleanupRequest storageCleanupRequest) async
    test('test cleanupStoredFiles', () async {
      // TODO
    });

    // 新增 AI 分析 Provider
    //
    //Future<ApiResponseAiProviderProfileResponse> createAiProviderProfile(CreateAiProviderProfileRequest createAiProviderProfileRequest) async
    test('test createAiProviderProfile', () async {
      // TODO
    });

    // 新增平台目录条目
    //
    //Future<ApiResponseProviderCatalogEntryResponse> createProviderCatalogEntry(CreateProviderCatalogEntryRequest createProviderCatalogEntryRequest) async
    test('test createProviderCatalogEntry', () async {
      // TODO
    });

    // 删除 AI 分析 Provider
    //
    //Future deleteAiProviderProfile(String providerKey) async
    test('test deleteAiProviderProfile', () async {
      // TODO
    });

    // 删除平台目录条目
    //
    //Future deleteProviderCatalogEntry(String providerKey) async
    test('test deleteProviderCatalogEntry', () async {
      // TODO
    });

    // 删除指定持久文件
    //
    //Future deleteStoredFile(String category, String fileId) async
    test('test deleteStoredFile', () async {
      // TODO
    });

    // 删除用户
    //
    //Future deleteUser(String userId) async
    test('test deleteUser', () async {
      // TODO
    });

    // 读取媒体 Runner 实际安装的引擎候选清单
    //
    //Future<ApiResponseEngineCatalogResponse> getAdminEngineCatalog() async
    test('test getAdminEngineCatalog', () async {
      // TODO
    });

    // 查询 AI 分析执行统计
    //
    // 按每次 analysis_run 的 created_at UTC 自然日统计其当前状态。  手动重试与重新分析各计一次执行；包含所属任务已软删除但数据库仍保留的 执行记录。统计不代表供应商模型请求次数，不推算 token、费用或 Provider 延迟。平均耗时只纳入有有效开始、结束时间的终态执行，包含执行内重试和 报告发布；没有有效样本时返回 null。
    //
    //Future<ApiResponseAnalysisAnalyticsResponse> getAnalysisAnalytics({ int days }) async
    test('test getAnalysisAnalytics', () async {
      // TODO
    });

    // 查询下载分析
    //
    // 按 UTC 自然日查询管理员可见的全局下载聚合。
    //
    //Future<ApiResponseDownloadAnalyticsResponse> getDownloadAnalytics({ int days }) async
    test('test getDownloadAnalytics', () async {
      // TODO
    });

    // 查询 AI 分析 Provider
    //
    //Future<ApiResponseAiProviderProfileListResponse> listAiProviderProfiles() async
    test('test listAiProviderProfiles', () async {
      // TODO
    });

    // 查询 OpenRouter 公开模型能力
    //
    //Future<ApiResponseAiModelListResponse> listOpenRouterModels() async
    test('test listOpenRouterModels', () async {
      // TODO
    });

    // 查询全系统操作日志
    //
    //Future<ApiResponseOperationLogPageResponse> listOperationLogs({ int page, int pageSize, String q, String outcome, DateTime createdFrom, DateTime createdTo, bool adminOnly, String source_ }) async
    test('test listOperationLogs', () async {
      // TODO
    });

    // 查询平台目录
    //
    //Future<ApiResponseProviderCatalogListResponse> listProviderCatalogEntries() async
    test('test listProviderCatalogEntries', () async {
      // TODO
    });

    // 分页查询持久文件
    //
    //Future<ApiResponseStoredFileListResponse> listStoredFiles({ int page, int pageSize }) async
    test('test listStoredFiles', () async {
      // TODO
    });

    // 查询用户列表
    //
    //Future<ApiResponseManagedUserListResponse> listUsers({ int page, int pageSize, String search, UserRole role, bool isActive }) async
    test('test listUsers', () async {
      // TODO
    });

    // 更新 AI 分析 Provider
    //
    //Future<ApiResponseAiProviderProfileResponse> updateAiProviderProfile(String providerKey, UpdateAiProviderProfileRequest updateAiProviderProfileRequest) async
    test('test updateAiProviderProfile', () async {
      // TODO
    });

    // 更新平台目录条目
    //
    //Future<ApiResponseProviderCatalogEntryResponse> updateProviderCatalogEntry(String providerKey, UpdateProviderCatalogEntryRequest updateProviderCatalogEntryRequest) async
    test('test updateProviderCatalogEntry', () async {
      // TODO
    });

    // 更新用户角色与账号状态
    //
    //Future<ApiResponseManagedUserResponse> updateUserAccess(String userId, UpdateUserAccessRequest updateUserAccessRequest) async
    test('test updateUserAccess', () async {
      // TODO
    });
  });
}
