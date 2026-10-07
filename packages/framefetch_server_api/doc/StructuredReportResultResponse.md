# framefetch_server_api.model.StructuredReportResultResponse

## Load the model package
```dart
import 'package:framefetch_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**kind** | **String** |  |
**language** | **String** |  |
**title** | **String** |  |
**summary** | **String** |  |
**sections** | [**BuiltList&lt;StructuredReportSectionResponse&gt;**](StructuredReportSectionResponse.md) |  |
**limitations** | **BuiltList&lt;String&gt;** |  |
**media** | [**AnalysisMediaResponse**](AnalysisMediaResponse.md) |  |
**reviewStatus** | **String** |  | [optional]
**reviewHistory** | [**BuiltList&lt;ContentReview&gt;**](ContentReview.md) |  | [optional] [default to ListBuilder()]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
