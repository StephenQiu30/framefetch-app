# video_server_api.api.ProvidersApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listProviders**](ProvidersApi.md#listproviders) | **GET** /api/providers | 查询平台能力状态


# **listProviders**
> ApiResponseProviderListResponse listProviders()

查询平台能力状态

返回 Registry 声明的能力与身份要求。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getProvidersApi();

try {
    final response = api.listProviders();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProvidersApi->listProviders: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ApiResponseProviderListResponse**](ApiResponseProviderListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
