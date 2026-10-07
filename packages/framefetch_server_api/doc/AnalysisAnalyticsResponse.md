# framefetch_server_api.model.AnalysisAnalyticsResponse

## Load the model package
```dart
import 'package:framefetch_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**periodDays** | **int** |  |
**start** | [**DateTime**](DateTime.md) | UTC 窗口起始日零时，含此时刻。 |
**end** | [**DateTime**](DateTime.md) | 查询时刻，含此时刻。 |
**summary** | [**AnalysisAnalyticsSummaryResponse**](AnalysisAnalyticsSummaryResponse.md) |  |
**daily** | [**BuiltList&lt;AnalysisAnalyticsDailyResponse&gt;**](AnalysisAnalyticsDailyResponse.md) |  |
**inputs** | [**BuiltList&lt;AnalysisAnalyticsInputResponse&gt;**](AnalysisAnalyticsInputResponse.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
