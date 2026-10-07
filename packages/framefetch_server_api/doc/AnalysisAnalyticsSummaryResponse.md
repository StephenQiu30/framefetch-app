# framefetch_server_api.model.AnalysisAnalyticsSummaryResponse

## Load the model package
```dart
import 'package:framefetch_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**total** | **int** | 保留的分析执行次数，不代表模型请求次数。 |
**succeeded** | **int** |  |
**failed** | **int** |  |
**cancelled** | **int** |  |
**active** | **int** | queued、running、retry_wait 的执行数量。 |
**averageDurationSeconds** | **num** | 终态执行的 finished_at-started_at 均值，包含重试与发布；只纳入两时间齐全且非负的样本，没有有效样本时为 null。 |
**completedDurationCount** | **int** | 平均执行耗时的有效终态样本数。 |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
