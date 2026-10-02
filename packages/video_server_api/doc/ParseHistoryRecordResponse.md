# video_server_api.model.ParseHistoryRecordResponse

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
**status** | [**IntentStatus**](IntentStatus.md) |  |
**reasonCode** | **String** |  |
**failure** | [**IntentFailureResponse**](IntentFailureResponse.md) |  |
**nextAction** | **String** |  | [optional] [default to 'none']
**deadline** | [**DateTime**](DateTime.md) |  |
**inspectionId** | **String** |  |
**jobId** | **String** |  |
**createdAt** | [**DateTime**](DateTime.md) |  |
**title** | **String** |  |
**recordType** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
