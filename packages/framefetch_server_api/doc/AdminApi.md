# framefetch_server_api.api.AdminApi

## Load the API package
```dart
import 'package:framefetch_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activateAiProviderProfile**](AdminApi.md#activateaiproviderprofile) | **POST** /api/admin/ai-providers/{provider_key}/activate | 启用 AI 分析 Provider
[**cleanupStoredFiles**](AdminApi.md#cleanupstoredfiles) | **POST** /api/admin/files/cleanup | 手动清理指定天数前的文件
[**createAiProviderProfile**](AdminApi.md#createaiproviderprofile) | **POST** /api/admin/ai-providers | 新增 AI 分析 Provider
[**createProviderCatalogEntry**](AdminApi.md#createprovidercatalogentry) | **POST** /api/admin/providers | 新增平台目录条目
[**deleteAiProviderProfile**](AdminApi.md#deleteaiproviderprofile) | **DELETE** /api/admin/ai-providers/{provider_key} | 删除 AI 分析 Provider
[**deleteProviderCatalogEntry**](AdminApi.md#deleteprovidercatalogentry) | **DELETE** /api/admin/providers/{provider_key} | 删除平台目录条目
[**deleteStoredFile**](AdminApi.md#deletestoredfile) | **DELETE** /api/admin/files/{category}/{file_id} | 删除指定持久文件
[**deleteUser**](AdminApi.md#deleteuser) | **DELETE** /api/admin/users/{user_id} | 删除用户
[**getAdminEngineCatalog**](AdminApi.md#getadminenginecatalog) | **GET** /api/admin/provider-runtime/engine-catalog | 读取媒体 Runner 实际安装的引擎候选清单
[**getAnalysisAnalytics**](AdminApi.md#getanalysisanalytics) | **GET** /api/admin/analyses/analytics | 查询 AI 分析执行统计
[**getDownloadAnalytics**](AdminApi.md#getdownloadanalytics) | **GET** /api/admin/downloads/analytics | 查询下载分析
[**listAiProviderProfiles**](AdminApi.md#listaiproviderprofiles) | **GET** /api/admin/ai-providers | 查询 AI 分析 Provider
[**listOpenRouterModels**](AdminApi.md#listopenroutermodels) | **GET** /api/admin/ai-providers/models/openrouter | 查询 OpenRouter 公开模型能力
[**listOperationLogs**](AdminApi.md#listoperationlogs) | **GET** /api/admin/operation-logs | 查询全系统操作日志
[**listProviderCatalogEntries**](AdminApi.md#listprovidercatalogentries) | **GET** /api/admin/providers | 查询平台目录
[**listStoredFiles**](AdminApi.md#liststoredfiles) | **GET** /api/admin/files | 分页查询持久文件
[**listUsers**](AdminApi.md#listusers) | **GET** /api/admin/users | 查询用户列表
[**updateAiProviderProfile**](AdminApi.md#updateaiproviderprofile) | **PATCH** /api/admin/ai-providers/{provider_key} | 更新 AI 分析 Provider
[**updateProviderCatalogEntry**](AdminApi.md#updateprovidercatalogentry) | **PATCH** /api/admin/providers/{provider_key} | 更新平台目录条目
[**updateUserAccess**](AdminApi.md#updateuseraccess) | **PATCH** /api/admin/users/{user_id} | 更新用户角色与账号状态


# **activateAiProviderProfile**
> ApiResponseAiProviderProfileResponse activateAiProviderProfile(providerKey)

启用 AI 分析 Provider

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final String providerKey = providerKey_example; // String |

try {
    final response = api.activateAiProviderProfile(providerKey);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->activateAiProviderProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerKey** | **String**|  |

### Return type

[**ApiResponseAiProviderProfileResponse**](ApiResponseAiProviderProfileResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cleanupStoredFiles**
> ApiResponseStorageCleanupResponse cleanupStoredFiles(storageCleanupRequest)

手动清理指定天数前的文件

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final StorageCleanupRequest storageCleanupRequest = ; // StorageCleanupRequest |

try {
    final response = api.cleanupStoredFiles(storageCleanupRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->cleanupStoredFiles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storageCleanupRequest** | [**StorageCleanupRequest**](StorageCleanupRequest.md)|  |

### Return type

[**ApiResponseStorageCleanupResponse**](ApiResponseStorageCleanupResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createAiProviderProfile**
> ApiResponseAiProviderProfileResponse createAiProviderProfile(createAiProviderProfileRequest)

新增 AI 分析 Provider

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final CreateAiProviderProfileRequest createAiProviderProfileRequest = ; // CreateAiProviderProfileRequest |

try {
    final response = api.createAiProviderProfile(createAiProviderProfileRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->createAiProviderProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAiProviderProfileRequest** | [**CreateAiProviderProfileRequest**](CreateAiProviderProfileRequest.md)|  |

### Return type

[**ApiResponseAiProviderProfileResponse**](ApiResponseAiProviderProfileResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProviderCatalogEntry**
> ApiResponseProviderCatalogEntryResponse createProviderCatalogEntry(createProviderCatalogEntryRequest)

新增平台目录条目

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final CreateProviderCatalogEntryRequest createProviderCatalogEntryRequest = ; // CreateProviderCatalogEntryRequest |

try {
    final response = api.createProviderCatalogEntry(createProviderCatalogEntryRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->createProviderCatalogEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createProviderCatalogEntryRequest** | [**CreateProviderCatalogEntryRequest**](CreateProviderCatalogEntryRequest.md)|  |

### Return type

[**ApiResponseProviderCatalogEntryResponse**](ApiResponseProviderCatalogEntryResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteAiProviderProfile**
> deleteAiProviderProfile(providerKey)

删除 AI 分析 Provider

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final String providerKey = providerKey_example; // String |

try {
    api.deleteAiProviderProfile(providerKey);
} on DioException catch (e) {
    print('Exception when calling AdminApi->deleteAiProviderProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerKey** | **String**|  |

### Return type

void (empty response body)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProviderCatalogEntry**
> deleteProviderCatalogEntry(providerKey)

删除平台目录条目

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final String providerKey = providerKey_example; // String |

try {
    api.deleteProviderCatalogEntry(providerKey);
} on DioException catch (e) {
    print('Exception when calling AdminApi->deleteProviderCatalogEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerKey** | **String**|  |

### Return type

void (empty response body)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteStoredFile**
> deleteStoredFile(category, fileId)

删除指定持久文件

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final String category = category_example; // String |
final String fileId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    api.deleteStoredFile(category, fileId);
} on DioException catch (e) {
    print('Exception when calling AdminApi->deleteStoredFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **String**|  |
 **fileId** | **String**|  |

### Return type

void (empty response body)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUser**
> deleteUser(userId)

删除用户

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    api.deleteUser(userId);
} on DioException catch (e) {
    print('Exception when calling AdminApi->deleteUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  |

### Return type

void (empty response body)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAdminEngineCatalog**
> ApiResponseEngineCatalogResponse getAdminEngineCatalog()

读取媒体 Runner 实际安装的引擎候选清单

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();

try {
    final response = api.getAdminEngineCatalog();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->getAdminEngineCatalog: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ApiResponseEngineCatalogResponse**](ApiResponseEngineCatalogResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAnalysisAnalytics**
> ApiResponseAnalysisAnalyticsResponse getAnalysisAnalytics(days)

查询 AI 分析执行统计

按每次 analysis_run 的 created_at UTC 自然日统计其当前状态。  手动重试与重新分析各计一次执行；包含所属任务已软删除但数据库仍保留的 执行记录。统计不代表供应商模型请求次数，不推算 token、费用或 Provider 延迟。平均耗时只纳入有有效开始、结束时间的终态执行，包含执行内重试和 报告发布；没有有效样本时返回 null。

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final int days = 56; // int |

try {
    final response = api.getAnalysisAnalytics(days);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->getAnalysisAnalytics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **days** | **int**|  | [optional] [default to 30]

### Return type

[**ApiResponseAnalysisAnalyticsResponse**](ApiResponseAnalysisAnalyticsResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDownloadAnalytics**
> ApiResponseDownloadAnalyticsResponse getDownloadAnalytics(days)

查询下载分析

按 UTC 自然日查询管理员可见的全局下载聚合。

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final int days = 56; // int |

try {
    final response = api.getDownloadAnalytics(days);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->getDownloadAnalytics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **days** | **int**|  | [optional] [default to 30]

### Return type

[**ApiResponseDownloadAnalyticsResponse**](ApiResponseDownloadAnalyticsResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAiProviderProfiles**
> ApiResponseAiProviderProfileListResponse listAiProviderProfiles()

查询 AI 分析 Provider

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();

try {
    final response = api.listAiProviderProfiles();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listAiProviderProfiles: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ApiResponseAiProviderProfileListResponse**](ApiResponseAiProviderProfileListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOpenRouterModels**
> ApiResponseAiModelListResponse listOpenRouterModels()

查询 OpenRouter 公开模型能力

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();

try {
    final response = api.listOpenRouterModels();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listOpenRouterModels: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ApiResponseAiModelListResponse**](ApiResponseAiModelListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOperationLogs**
> ApiResponseOperationLogPageResponse listOperationLogs(page, pageSize, q, outcome, createdFrom, createdTo, adminOnly, source_)

查询全系统操作日志

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final int page = 56; // int |
final int pageSize = 56; // int |
final String q = q_example; // String |
final String outcome = outcome_example; // String |
final DateTime createdFrom = 2013-10-20T19:20:30+01:00; // DateTime |
final DateTime createdTo = 2013-10-20T19:20:30+01:00; // DateTime |
final bool adminOnly = true; // bool |
final String source_ = source__example; // String |

try {
    final response = api.listOperationLogs(page, pageSize, q, outcome, createdFrom, createdTo, adminOnly, source_);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listOperationLogs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 10]
 **q** | **String**|  | [optional]
 **outcome** | **String**|  | [optional]
 **createdFrom** | **DateTime**|  | [optional]
 **createdTo** | **DateTime**|  | [optional]
 **adminOnly** | **bool**|  | [optional] [default to false]
 **source_** | **String**|  | [optional]

### Return type

[**ApiResponseOperationLogPageResponse**](ApiResponseOperationLogPageResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProviderCatalogEntries**
> ApiResponseProviderCatalogListResponse listProviderCatalogEntries()

查询平台目录

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();

try {
    final response = api.listProviderCatalogEntries();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listProviderCatalogEntries: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ApiResponseProviderCatalogListResponse**](ApiResponseProviderCatalogListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStoredFiles**
> ApiResponseStoredFileListResponse listStoredFiles(page, pageSize)

分页查询持久文件

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final int page = 56; // int |
final int pageSize = 56; // int |

try {
    final response = api.listStoredFiles(page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listStoredFiles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**ApiResponseStoredFileListResponse**](ApiResponseStoredFileListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUsers**
> ApiResponseManagedUserListResponse listUsers(page, pageSize, search, role, isActive)

查询用户列表

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final int page = 56; // int |
final int pageSize = 56; // int |
final String search = search_example; // String |
final UserRole role = ; // UserRole |
final bool isActive = true; // bool |

try {
    final response = api.listUsers(page, pageSize, search, role, isActive);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **search** | **String**|  | [optional]
 **role** | [**UserRole**](.md)|  | [optional]
 **isActive** | **bool**|  | [optional]

### Return type

[**ApiResponseManagedUserListResponse**](ApiResponseManagedUserListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateAiProviderProfile**
> ApiResponseAiProviderProfileResponse updateAiProviderProfile(providerKey, updateAiProviderProfileRequest)

更新 AI 分析 Provider

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final String providerKey = providerKey_example; // String |
final UpdateAiProviderProfileRequest updateAiProviderProfileRequest = ; // UpdateAiProviderProfileRequest |

try {
    final response = api.updateAiProviderProfile(providerKey, updateAiProviderProfileRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->updateAiProviderProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerKey** | **String**|  |
 **updateAiProviderProfileRequest** | [**UpdateAiProviderProfileRequest**](UpdateAiProviderProfileRequest.md)|  |

### Return type

[**ApiResponseAiProviderProfileResponse**](ApiResponseAiProviderProfileResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProviderCatalogEntry**
> ApiResponseProviderCatalogEntryResponse updateProviderCatalogEntry(providerKey, updateProviderCatalogEntryRequest)

更新平台目录条目

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final String providerKey = providerKey_example; // String |
final UpdateProviderCatalogEntryRequest updateProviderCatalogEntryRequest = ; // UpdateProviderCatalogEntryRequest |

try {
    final response = api.updateProviderCatalogEntry(providerKey, updateProviderCatalogEntryRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->updateProviderCatalogEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerKey** | **String**|  |
 **updateProviderCatalogEntryRequest** | [**UpdateProviderCatalogEntryRequest**](UpdateProviderCatalogEntryRequest.md)|  |

### Return type

[**ApiResponseProviderCatalogEntryResponse**](ApiResponseProviderCatalogEntryResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUserAccess**
> ApiResponseManagedUserResponse updateUserAccess(userId, updateUserAccessRequest)

更新用户角色与账号状态

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getAdminApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final UpdateUserAccessRequest updateUserAccessRequest = ; // UpdateUserAccessRequest |

try {
    final response = api.updateUserAccess(userId, updateUserAccessRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->updateUserAccess: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  |
 **updateUserAccessRequest** | [**UpdateUserAccessRequest**](UpdateUserAccessRequest.md)|  |

### Return type

[**ApiResponseManagedUserResponse**](ApiResponseManagedUserResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
