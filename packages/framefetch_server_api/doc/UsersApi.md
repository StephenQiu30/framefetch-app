# framefetch_server_api.api.UsersApi

## Load the API package
```dart
import 'package:framefetch_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteCurrentUserAvatar**](UsersApi.md#deletecurrentuseravatar) | **DELETE** /api/users/me/avatar | 移除当前用户头像
[**getCurrentUserAvatar**](UsersApi.md#getcurrentuseravatar) | **GET** /api/users/me/avatar | 读取当前用户头像
[**updateCurrentUser**](UsersApi.md#updatecurrentuser) | **PATCH** /api/users/me | 更新当前用户资料
[**uploadCurrentUserAvatar**](UsersApi.md#uploadcurrentuseravatar) | **PUT** /api/users/me/avatar | 上传当前用户头像


# **deleteCurrentUserAvatar**
> ApiResponseUserResponse deleteCurrentUserAvatar()

移除当前用户头像

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getUsersApi();

try {
    final response = api.deleteCurrentUserAvatar();
    print(response);
} on DioException catch (e) {
    print('Exception when calling UsersApi->deleteCurrentUserAvatar: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ApiResponseUserResponse**](ApiResponseUserResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUserAvatar**
> Uint8List getCurrentUserAvatar()

读取当前用户头像

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getUsersApi();

try {
    final response = api.getCurrentUserAvatar();
    print(response);
} on DioException catch (e) {
    print('Exception when calling UsersApi->getCurrentUserAvatar: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, image/webp

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCurrentUser**
> ApiResponseUserResponse updateCurrentUser(updateProfileRequest)

更新当前用户资料

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getUsersApi();
final UpdateProfileRequest updateProfileRequest = ; // UpdateProfileRequest |

try {
    final response = api.updateCurrentUser(updateProfileRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UsersApi->updateCurrentUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateProfileRequest** | [**UpdateProfileRequest**](UpdateProfileRequest.md)|  |

### Return type

[**ApiResponseUserResponse**](ApiResponseUserResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadCurrentUserAvatar**
> ApiResponseUserResponse uploadCurrentUserAvatar(body)

上传当前用户头像

### Example
```dart
import 'package:framefetch_server_api/api.dart';

final api = FramefetchServerApi().getUsersApi();
final MultipartFile body = BINARY_DATA_HERE; // MultipartFile |

try {
    final response = api.uploadCurrentUserAvatar(body);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UsersApi->uploadCurrentUserAvatar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **MultipartFile**|  |

### Return type

[**ApiResponseUserResponse**](ApiResponseUserResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/octet-stream
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
