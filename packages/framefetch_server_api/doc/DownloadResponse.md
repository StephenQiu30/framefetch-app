# framefetch_server_api.model.DownloadResponse

## Load the model package
```dart
import 'package:framefetch_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**executionContext** | [**ExecutionContext**](ExecutionContext.md) | 实际执行的十二字段非敏感上下文；本地导入无解析上下文。 | [optional]
**id** | **String** |  |
**inspectionId** | **String** |  |
**formatId** | **String** |  |
**sourceKind** | [**DownloadSourceKind**](DownloadSourceKind.md) |  |
**sourceLabel** | **String** |  |
**status** | [**DownloadStatus**](DownloadStatus.md) |  |
**stage** | [**DownloadStage**](DownloadStage.md) |  |
**progress** | **int** |  |
**attempt** | **int** |  |
**version** | **int** |  |
**errorCode** | [**DownloadErrorCode**](DownloadErrorCode.md) |  |
**errorMessage** | **String** |  |
**createdAt** | [**DateTime**](DateTime.md) |  |
**updatedAt** | [**DateTime**](DateTime.md) |  |
**finishedAt** | [**DateTime**](DateTime.md) |  |
**fileAvailable** | **bool** |  |
**title** | **String** |  |
**extractorKey** | **String** |  |
**durationSeconds** | **int** |  |
**mediaKind** | [**MediaKind**](MediaKind.md) |  |
**assetCount** | **int** |  |
**thumbnailUrl** | **String** |  |
**format** | [**SemanticPlanResponse**](SemanticPlanResponse.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
