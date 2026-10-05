# video_server_api.model.AnalysisResponseResult

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
**language** | **String** |  |
**title** | **String** |  |
**summary** | **String** |  |
**body** | **String** |  |
**evidence** | [**BuiltList&lt;SkillTextEvidence&gt;**](SkillTextEvidence.md) |  | [optional] [default to ListBuilder()]
**mediaEvidence** | [**BuiltList&lt;SkillMediaEvidence&gt;**](SkillMediaEvidence.md) |  | [optional] [default to ListBuilder()]
**limitations** | **BuiltList&lt;String&gt;** |  |
**data** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md) |  | [optional]
**documentType** | **String** |  |
**blocks** | [**BuiltList&lt;BlocksInner&gt;**](BlocksInner.md) |  |
**evidenceIndex** | [**BuiltList&lt;ContentCitation&gt;**](ContentCitation.md) |  |
**sourceSetRef** | **String** |  |
**reviewStatus** | **String** |  |
**reviewHistory** | [**BuiltList&lt;ContentReview&gt;**](ContentReview.md) |  | [default to ListBuilder()]
**media** | [**AnalysisMediaResponse**](AnalysisMediaResponse.md) |  |
**shotCount** | **int** |  |
**shots** | [**BuiltList&lt;ShotResponse&gt;**](ShotResponse.md) |  |
**scenes** | [**BuiltList&lt;ScreenplaySceneResponse&gt;**](ScreenplaySceneResponse.md) |  |
**highlights** | [**BuiltList&lt;HighlightResponse&gt;**](HighlightResponse.md) |  |
**assets** | [**BuiltList&lt;VisualAssetResponse&gt;**](VisualAssetResponse.md) |  |
**productionAdvice** | [**ProductionAdviceResponse**](ProductionAdviceResponse.md) |  |
**lead** | **String** |  |
**sections** | [**BuiltList&lt;StructuredReportSectionResponse&gt;**](StructuredReportSectionResponse.md) |  |
**keyPoints** | **BuiltList&lt;String&gt;** |  |
**closing** | **String** |  |
**logline** | **String** |  |
**synopsis** | **String** |  |
**structure** | [**ScreenplayStructureResponse**](ScreenplayStructureResponse.md) |  |
**characters** | [**BuiltList&lt;ScreenplayCharacterResponse&gt;**](ScreenplayCharacterResponse.md) |  |
**dialogueFindings** | [**BuiltList&lt;ScreenplayFindingResponse&gt;**](ScreenplayFindingResponse.md) |  |
**strengths** | [**BuiltList&lt;ScreenplayFindingResponse&gt;**](ScreenplayFindingResponse.md) |  |
**priorityRevisions** | [**BuiltList&lt;ScreenplayFindingResponse&gt;**](ScreenplayFindingResponse.md) |  |
**sourceLanguage** | **String** |  |
**targetLanguage** | **String** |  |
**sourceSceneCount** | **int** |  |
**outputSceneCount** | **int** |  |
**glossary** | [**BuiltList&lt;ScreenplayGlossaryTermResponse&gt;**](ScreenplayGlossaryTermResponse.md) |  |
**changeSummary** | **BuiltList&lt;String&gt;** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
