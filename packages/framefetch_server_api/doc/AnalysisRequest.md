# framefetch_server_api.model.AnalysisRequest

## Load the model package
```dart
import 'package:framefetch_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**skillId** | **String** | 由分析 Skill 清单提供的稳定任务标识。 |
**outputLanguage** | **String** | 结果语言；本项目支持 zh-CN 和 en-US。 |
**customPrompt** | **String** | 可编辑的任务要求；不能覆盖来源、安全、工具或结果结构。 | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
