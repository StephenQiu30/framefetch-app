# framefetch_server_api.model.InspectionResponse

## Load the model package
```dart
import 'package:framefetch_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**executionContext** | [**ExecutionContext**](ExecutionContext.md) | 实际执行的十二字段非敏感上下文；本地导入无解析上下文。 | [optional]
**id** | **String** |  |
**extractorKey** | **String** |  |
**providerMediaId** | **String** |  |
**title** | **String** |  |
**durationSeconds** | **int** |  |
**mediaKind** | [**MediaKind**](MediaKind.md) |  |
**assetCount** | **int** |  |
**thumbnailUrl** | **String** |  |
**expiresAt** | [**DateTime**](DateTime.md) |  |
**formats** | [**BuiltList&lt;FormatResponse&gt;**](FormatResponse.md) |  |
**sourceOrigin** | [**SourceOrigin**](SourceOrigin.md) |  |
**executionMode** | [**ExecutionMode**](ExecutionMode.md) |  |
**accessDecision** | [**AccessDecision**](AccessDecision.md) |  |
**entitlementState** | [**EntitlementState**](EntitlementState.md) |  |
**identityState** | [**IdentityState**](IdentityState.md) |  |
**protectionState** | [**ProtectionState**](ProtectionState.md) |  |
**rightsBasis** | [**RightsBasis**](RightsBasis.md) |  |
**restrictionReason** | **String** |  |
**userAction** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
