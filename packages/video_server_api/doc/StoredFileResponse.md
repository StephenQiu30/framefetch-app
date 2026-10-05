# video_server_api.model.StoredFileResponse

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  |
**category** | [**StoredFileCategory**](StoredFileCategory.md) |  |
**name** | **String** |  |
**uploaderUsername** | **String** | 文件所属账号的当前用户名；无法关联账号时为空。报告使用分析任务发起账号。 | [optional]
**objectCount** | **int** |  |
**sizeBytes** | **int** |  |
**createdAt** | [**DateTime**](DateTime.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
