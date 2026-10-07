# framefetch_server_api.model.IntentResponse

## Load the model package
```dart
import 'package:framefetch_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  |
**version** | **int** |  |
**status** | [**IntentStatus**](IntentStatus.md) |  |
**reasonCode** | **String** |  |
**failure** | [**IntentFailureResponse**](IntentFailureResponse.md) |  |
**nextAction** | **String** |  | [optional] [default to 'none']
**deadline** | [**DateTime**](DateTime.md) |  |
**inspectionId** | **String** |  |
**jobId** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
