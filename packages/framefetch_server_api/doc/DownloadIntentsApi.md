# framefetch_server_api.api.DownloadIntentsApi

## Load the API package
```dart
import 'package:framefetch_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelDownloadIntent**](DownloadIntentsApi.md#canceldownloadintent) | **POST** /api/download-intents/{intent_id}/cancel | 取消当前用户的解析意图
[**createDownloadIntent**](DownloadIntentsApi.md#createdownloadintent) | **POST** /api/download-intents | 提交持久解析意图
[**findDownloadIntent**](DownloadIntentsApi.md#finddownloadintent) | **GET** /api/download-intents | 按幂等键找回当前用户已提交的解析意图
[**getDownloadIntent**](DownloadIntentsApi.md#getdownloadintent) | **GET** /api/download-intents/{intent_id} | 查询当前用户的解析意图
[**listDownloadIntents**](DownloadIntentsApi.md#listdownloadintents) | **GET** /api/download-intents/history | 分页查询当前用户的解析记录
[**listHistoryRecords**](DownloadIntentsApi.md#listhistoryrecords) | **GET** /api/download-intents/history/records | 分页查询链接、视频 AI、剧本基础解析与剧本 AI 记录
[**refreshDownloadIntent**](DownloadIntentsApi.md#refreshdownloadintent) | **POST** /api/download-intents/{intent_id}/refresh | 在原意图中重新解析并确认过期结果


# **cancelDownloadIntent**
> ApiResponseIntentResponse cancelDownloadIntent(intentId)

取消当前用户的解析意图

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getDownloadIntentsApi();
final String intentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.cancelDownloadIntent(intentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadIntentsApi->cancelDownloadIntent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **intentId** | **String**|  |

### Return type

[**ApiResponseIntentResponse**](ApiResponseIntentResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createDownloadIntent**
> ApiResponseIntentResponse createDownloadIntent(idempotencyKey, intentRequest)

提交持久解析意图

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getDownloadIntentsApi();
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。
final IntentRequest intentRequest = ; // IntentRequest |

try {
    final response = api.createDownloadIntent(idempotencyKey, intentRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadIntentsApi->createDownloadIntent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |
 **intentRequest** | [**IntentRequest**](IntentRequest.md)|  |

### Return type

[**ApiResponseIntentResponse**](ApiResponseIntentResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findDownloadIntent**
> ApiResponseIntentResponse findDownloadIntent(idempotencyKey)

按幂等键找回当前用户已提交的解析意图

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getDownloadIntentsApi();
final String idempotencyKey = idempotencyKey_example; // String |

try {
    final response = api.findDownloadIntent(idempotencyKey);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadIntentsApi->findDownloadIntent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String**|  |

### Return type

[**ApiResponseIntentResponse**](ApiResponseIntentResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDownloadIntent**
> ApiResponseIntentResponse getDownloadIntent(intentId)

查询当前用户的解析意图

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getDownloadIntentsApi();
final String intentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.getDownloadIntent(intentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadIntentsApi->getDownloadIntent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **intentId** | **String**|  |

### Return type

[**ApiResponseIntentResponse**](ApiResponseIntentResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDownloadIntents**
> ApiResponseIntentHistoryResponse listDownloadIntents(before, limit)

分页查询当前用户的解析记录

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getDownloadIntentsApi();
final String before = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final int limit = 56; // int |

try {
    final response = api.listDownloadIntents(before, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadIntentsApi->listDownloadIntents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **before** | **String**|  | [optional]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**ApiResponseIntentHistoryResponse**](ApiResponseIntentHistoryResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listHistoryRecords**
> ApiResponseHistoryRecordPageResponse listHistoryRecords(beforeCreatedAt, recordType, statusGroup, createdFrom, createdTo, q, skillId, resultContract, documentId, downloadId, beforeRecordType, beforeId, limit)

分页查询链接、视频 AI、剧本基础解析与剧本 AI 记录

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getDownloadIntentsApi();
final DateTime beforeCreatedAt = 2013-10-20T19:20:30+01:00; // DateTime |
final BuiltList<HistoryRecordKind> recordType = ; // BuiltList<HistoryRecordKind> |
final HistoryStatusGroup statusGroup = ; // HistoryStatusGroup |
final DateTime createdFrom = 2013-10-20T19:20:30+01:00; // DateTime |
final DateTime createdTo = 2013-10-20T19:20:30+01:00; // DateTime |
final String q = q_example; // String |
final String skillId = skillId_example; // String |
final AnalysisResultContract resultContract = ; // AnalysisResultContract |
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final String downloadId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final HistoryRecordKind beforeRecordType = ; // HistoryRecordKind |
final String beforeId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final int limit = 56; // int |

try {
    final response = api.listHistoryRecords(beforeCreatedAt, recordType, statusGroup, createdFrom, createdTo, q, skillId, resultContract, documentId, downloadId, beforeRecordType, beforeId, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadIntentsApi->listHistoryRecords: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **beforeCreatedAt** | **DateTime**|  | [optional]
 **recordType** | [**BuiltList&lt;HistoryRecordKind&gt;**](HistoryRecordKind.md)|  | [optional]
 **statusGroup** | [**HistoryStatusGroup**](.md)|  | [optional]
 **createdFrom** | **DateTime**|  | [optional]
 **createdTo** | **DateTime**|  | [optional]
 **q** | **String**|  | [optional]
 **skillId** | **String**|  | [optional]
 **resultContract** | [**AnalysisResultContract**](.md)|  | [optional]
 **documentId** | **String**|  | [optional]
 **downloadId** | **String**|  | [optional]
 **beforeRecordType** | [**HistoryRecordKind**](.md)|  | [optional]
 **beforeId** | **String**|  | [optional]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**ApiResponseHistoryRecordPageResponse**](ApiResponseHistoryRecordPageResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshDownloadIntent**
> ApiResponseIntentResponse refreshDownloadIntent(intentId)

在原意图中重新解析并确认过期结果

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getDownloadIntentsApi();
final String intentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.refreshDownloadIntent(intentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadIntentsApi->refreshDownloadIntent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **intentId** | **String**|  |

### Return type

[**ApiResponseIntentResponse**](ApiResponseIntentResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
