import 'package:video_server_api/video_server_api.dart';

final _createdAt = DateTime.utc(2026, 10, 2);

ManagedUserListResponse adminSingleUserFixture() => ManagedUserListResponse(
  (b) => b
    ..page = 1
    ..pageSize = 10
    ..total = 1
    ..items.replace([
      ManagedUserResponse(
        (user) => user
          ..id = 'synthetic-user'
          ..username = '测试用户'
          ..email = 'synthetic@example.com'
          ..role = UserRole.user
          ..isActive = true
          ..createdAt = _createdAt
          ..updatedAt = _createdAt
          ..quota.replace(UserQuotaSettings()),
      ),
    ]),
);

StoredFileListResponse adminSingleFileFixture() => StoredFileListResponse(
  (b) => b
    ..page = 1
    ..pageSize = 10
    ..total = 1
    ..items.replace([
      StoredFileResponse(
        (file) => file
          ..id = 'synthetic-file'
          ..name = '测试视频'
          ..category = StoredFileCategory.video
          ..objectCount = 1
          ..sizeBytes = 1024
          ..createdAt = _createdAt,
      ),
    ]),
);

ProviderCatalogListResponse adminSingleCatalogFixture() =>
    ProviderCatalogListResponse(
      (b) => b
        ..items.replace([
          ProviderCatalogEntryResponse(
            (item) => item
              ..key = 'synthetic-catalog'
              ..displayName = '测试平台'
              ..sortOrder = 1
              ..isVisible = true
              ..systemRegistered = false
              ..systemStatus = ProviderSupportStatus.unknown
              ..createdAt = _createdAt
              ..updatedAt = _createdAt,
          ),
        ]),
    );

AiProviderProfileListResponse adminSingleAiFixture() =>
    AiProviderProfileListResponse(
      (b) => b
        ..agentAvailable = true
        ..items.replace([
          AiProviderProfileResponse(
            (item) => item
              ..key = 'synthetic-ai'
              ..displayName = '测试 AI'
              ..engine = AiProviderEngine.openai
              ..authMode = AiProviderAuthMode.apiKey
              ..model = 'synthetic-model'
              ..credentialConfigured = true
              ..isActive = false
              ..createdAt = _createdAt
              ..updatedAt = _createdAt,
          ),
        ]),
    );
