# video_server_api.model.ItemsInner

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**updatedAt** | [**DateTime**](DateTime.md) |  |
**statusGroup** | [**HistoryStatusGroup**](HistoryStatusGroup.md) |  |
**sourceAvailability** | [**HistoryAvailability**](HistoryAvailability.md) |  |
**resultAvailability** | [**HistoryAvailability**](HistoryAvailability.md) |  |
**id** | **String** |  |
**version** | **int** |  |
**status** | [**ImportStatus**](ImportStatus.md) |  |
**reasonCode** | **String** |  |
**failure** | [**IntentFailureResponse**](IntentFailureResponse.md) |  |
**nextAction** | **String** |  | [optional] [default to 'none']
**deadline** | [**DateTime**](DateTime.md) |  |
**inspectionId** | **String** |  |
**jobId** | **String** |  |
**createdAt** | [**DateTime**](DateTime.md) |  |
**title** | **String** |  |
**recordType** | **String** |  |
**documentId** | **String** |  |
**artifactId** | **String** |  |
**outputLanguage** | **String** |  |
**resultContract** | [**AnalysisResultContract**](AnalysisResultContract.md) |  |
**currentRunNo** | **int** |  |
**cancelRequestedAt** | [**DateTime**](DateTime.md) |  |
**allowedActions** | **BuiltList&lt;String&gt;** |  |
**actionUnavailableReason** | **String** |  |
**downloadId** | **String** |  |
**skillId** | **String** |  |
**progress** | **int** |  |
**stage** | [**AnalysisStage**](AnalysisStage.md) |  |
**errorCode** | **String** |  |
**sourceFormat** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
