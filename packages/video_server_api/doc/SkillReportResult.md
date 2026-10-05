# video_server_api.model.SkillReportResult

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**kind** | **String** |  |
**schemaVersion** | **int** |  | [optional]
**skillId** | **String** |  |
**language** | **String** |  | [optional]
**title** | **String** |  |
**summary** | **String** |  |
**body** | **String** |  |
**evidence** | [**BuiltList&lt;SkillTextEvidence&gt;**](SkillTextEvidence.md) |  | [optional] [default to ListBuilder()]
**mediaEvidence** | [**BuiltList&lt;SkillMediaEvidence&gt;**](SkillMediaEvidence.md) |  | [optional] [default to ListBuilder()]
**limitations** | **BuiltList&lt;String&gt;** |  | [optional] [default to ListBuilder()]
**data** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
