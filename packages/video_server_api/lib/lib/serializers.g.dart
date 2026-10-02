// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add(AccessDecision.serializer)
      ..add(AiModelListResponse.serializer)
      ..add(AiModelResponse.serializer)
      ..add(AiProviderAuthMode.serializer)
      ..add(AiProviderEngine.serializer)
      ..add(AiProviderProfileListResponse.serializer)
      ..add(AiProviderProfileResponse.serializer)
      ..add(AnalysisAnalyticsDailyResponse.serializer)
      ..add(AnalysisAnalyticsInputResponse.serializer)
      ..add(AnalysisAnalyticsResponse.serializer)
      ..add(AnalysisAnalyticsSummaryResponse.serializer)
      ..add(AnalysisErrorCode.serializer)
      ..add(AnalysisInputKind.serializer)
      ..add(AnalysisMediaResponse.serializer)
      ..add(AnalysisReportArtifactResponse.serializer)
      ..add(AnalysisReportResponse.serializer)
      ..add(AnalysisReportStatus.serializer)
      ..add(AnalysisRequest.serializer)
      ..add(AnalysisResponse.serializer)
      ..add(AnalysisResponseResult.serializer)
      ..add(AnalysisResultContract.serializer)
      ..add(AnalysisRunHistoryPageResponse.serializer)
      ..add(AnalysisRunHistoryResponse.serializer)
      ..add(AnalysisSkillResponse.serializer)
      ..add(AnalysisStage.serializer)
      ..add(AnalysisStatus.serializer)
      ..add(ApiResponseAiModelListResponse.serializer)
      ..add(ApiResponseAiProviderProfileListResponse.serializer)
      ..add(ApiResponseAiProviderProfileResponse.serializer)
      ..add(ApiResponseAnalysisAnalyticsResponse.serializer)
      ..add(ApiResponseAnalysisResponse.serializer)
      ..add(ApiResponseAnalysisRunHistoryPageResponse.serializer)
      ..add(ApiResponseDocumentDetailResponse.serializer)
      ..add(ApiResponseDocumentImportResponse.serializer)
      ..add(ApiResponseDocumentPageResponse.serializer)
      ..add(ApiResponseDocumentUploadSessionResponse.serializer)
      ..add(ApiResponseDownloadAnalyticsResponse.serializer)
      ..add(ApiResponseDownloadHistoryResponse.serializer)
      ..add(ApiResponseDownloadResponse.serializer)
      ..add(ApiResponseDownloadUrlResponse.serializer)
      ..add(ApiResponseEngineCatalogResponse.serializer)
      ..add(ApiResponseHistoryRecordPageResponse.serializer)
      ..add(ApiResponseInspectionResponse.serializer)
      ..add(ApiResponseIntentHistoryResponse.serializer)
      ..add(ApiResponseIntentResponse.serializer)
      ..add(ApiResponseManagedUserListResponse.serializer)
      ..add(ApiResponseManagedUserResponse.serializer)
      ..add(ApiResponseMediaImportResponse.serializer)
      ..add(ApiResponseMediaUploadSessionResponse.serializer)
      ..add(ApiResponseOperationLogPageResponse.serializer)
      ..add(ApiResponseProviderCatalogEntryResponse.serializer)
      ..add(ApiResponseProviderCatalogListResponse.serializer)
      ..add(ApiResponseProviderListResponse.serializer)
      ..add(ApiResponseSourceDiscoveryResponse.serializer)
      ..add(ApiResponseStorageCleanupResponse.serializer)
      ..add(ApiResponseStoredFileListResponse.serializer)
      ..add(ApiResponseTupleAnalysisSkillResponse.serializer)
      ..add(ApiResponseUnionAnalysisResponseNoneType.serializer)
      ..add(
          ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
              .serializer)
      ..add(ApiResponseUserResponse.serializer)
      ..add(AudioCodecFamily.serializer)
      ..add(CompatibilityProfile.serializer)
      ..add(CompleteDocumentImportRequest.serializer)
      ..add(CompleteMediaImportRequest.serializer)
      ..add(CompletedPartRequest.serializer)
      ..add(ContainerPreference.serializer)
      ..add(CreateAiProviderProfileRequest.serializer)
      ..add(CreateProviderCatalogEntryRequest.serializer)
      ..add(Data.serializer)
      ..add(DeclaredOrigin.serializer)
      ..add(DiscoveredItemInspectionSource.serializer)
      ..add(DiscoveredItemInspectionSourceKindEnum.serializer)
      ..add(DiscoveryDecisionHint.serializer)
      ..add(DiscoveryItemKind.serializer)
      ..add(DiscoveryItemStatus.serializer)
      ..add(DiscoveryStatus.serializer)
      ..add(DocumentDetailResponse.serializer)
      ..add(DocumentImportRequest.serializer)
      ..add(DocumentImportResponse.serializer)
      ..add(DocumentPageResponse.serializer)
      ..add(DocumentParseHistoryRecordResponse.serializer)
      ..add(DocumentParseHistoryRecordResponseRecordTypeEnum.serializer)
      ..add(DocumentParseSummaryResponse.serializer)
      ..add(DocumentResponse.serializer)
      ..add(DocumentSourceFormat.serializer)
      ..add(DocumentUploadSessionResponse.serializer)
      ..add(DownloadAnalyticsDailyResponse.serializer)
      ..add(DownloadAnalyticsResponse.serializer)
      ..add(DownloadAnalyticsSourceResponse.serializer)
      ..add(DownloadAnalyticsSummaryResponse.serializer)
      ..add(DownloadErrorCode.serializer)
      ..add(DownloadHistoryItemResponse.serializer)
      ..add(DownloadHistoryResponse.serializer)
      ..add(DownloadHistorySummaryResponse.serializer)
      ..add(DownloadRequest.serializer)
      ..add(DownloadResponse.serializer)
      ..add(DownloadSourceKind.serializer)
      ..add(DownloadStage.serializer)
      ..add(DownloadStatus.serializer)
      ..add(DownloadUrlResponse.serializer)
      ..add(DynamicRange.serializer)
      ..add(EmailPasswordRequest.serializer)
      ..add(EngineCandidateResponse.serializer)
      ..add(EngineCatalogResponse.serializer)
      ..add(EngineCatalogResponseScopeEnum.serializer)
      ..add(EntitlementState.serializer)
      ..add(ErrorCode.serializer)
      ..add(ErrorResponse.serializer)
      ..add(EvidenceSummaryResponse.serializer)
      ..add(EvidenceValue.serializer)
      ..add(ExecutionContext.serializer)
      ..add(ExecutionMode.serializer)
      ..add(FailureClass.serializer)
      ..add(FormatResponse.serializer)
      ..add(FpsBucket.serializer)
      ..add(HighlightResponse.serializer)
      ..add(HistoryAvailability.serializer)
      ..add(HistoryRecordCursorResponse.serializer)
      ..add(HistoryRecordKind.serializer)
      ..add(HistoryRecordPageResponse.serializer)
      ..add(HistoryStatusGroup.serializer)
      ..add(IdentityState.serializer)
      ..add(ImportErrorCode.serializer)
      ..add(ImportSourceFormat.serializer)
      ..add(ImportStatus.serializer)
      ..add(InspectionRequest.serializer)
      ..add(InspectionResponse.serializer)
      ..add(IntentFailureResponse.serializer)
      ..add(IntentFailureResponseGateEnum.serializer)
      ..add(IntentFailureResponseStageEnum.serializer)
      ..add(IntentHistoryItemResponse.serializer)
      ..add(IntentHistoryItemResponseNextActionEnum.serializer)
      ..add(IntentHistoryResponse.serializer)
      ..add(IntentRequest.serializer)
      ..add(IntentResponse.serializer)
      ..add(IntentResponseNextActionEnum.serializer)
      ..add(IntentStatus.serializer)
      ..add(ItemsInner.serializer)
      ..add(ManagedUserListResponse.serializer)
      ..add(ManagedUserResponse.serializer)
      ..add(MediaImportRequest.serializer)
      ..add(MediaImportResponse.serializer)
      ..add(MediaKind.serializer)
      ..add(MediaUploadSessionResponse.serializer)
      ..add(ModelSource.serializer)
      ..add(NativeLogoutRequest.serializer)
      ..add(NativeRefreshRequest.serializer)
      ..add(NativeSessionResponse.serializer)
      ..add(NativeSessionResponseTokenTypeEnum.serializer)
      ..add(OperationLogPageResponse.serializer)
      ..add(OperationLogResponse.serializer)
      ..add(OperationLogResponseOutcomeEnum.serializer)
      ..add(OperationLogResponseSource_Enum.serializer)
      ..add(ParseHistoryRecordResponse.serializer)
      ..add(ParseHistoryRecordResponseNextActionEnum.serializer)
      ..add(ParseHistoryRecordResponseRecordTypeEnum.serializer)
      ..add(ProblemDetails.serializer)
      ..add(ProductionAdviceResponse.serializer)
      ..add(ProtectionState.serializer)
      ..add(ProviderCapability.serializer)
      ..add(ProviderCatalogEntryResponse.serializer)
      ..add(ProviderCatalogListResponse.serializer)
      ..add(ProviderIdentity.serializer)
      ..add(ProviderListResponse.serializer)
      ..add(ProviderStatusResponse.serializer)
      ..add(ProviderSupportStatus.serializer)
      ..add(PublicUrlInspectionSource.serializer)
      ..add(PublicUrlInspectionSourceKindEnum.serializer)
      ..add(RegisterRequest.serializer)
      ..add(RegistrationCodeRequest.serializer)
      ..add(RegistrationCodeResponse.serializer)
      ..add(RegistrationCodeVerificationRequest.serializer)
      ..add(RegistrationCodeVerificationResponse.serializer)
      ..add(RightsBasis.serializer)
      ..add(ScreenplayAnalysisHistoryRecordResponse.serializer)
      ..add(
          ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum.serializer)
      ..add(ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum.serializer)
      ..add(ScreenplayAnalysisResultResponse.serializer)
      ..add(ScreenplayAnalysisResultResponseKindEnum.serializer)
      ..add(ScreenplayCharacterResponse.serializer)
      ..add(ScreenplayFindingResponse.serializer)
      ..add(ScreenplayGlossaryTermResponse.serializer)
      ..add(ScreenplayRewriteResultResponse.serializer)
      ..add(ScreenplayRewriteResultResponseKindEnum.serializer)
      ..add(ScreenplaySceneResponse.serializer)
      ..add(ScreenplayStructureResponse.serializer)
      ..add(SemanticPlanResponse.serializer)
      ..add(ShotResponse.serializer)
      ..add(SourceDiscoveryItemResponse.serializer)
      ..add(SourceDiscoveryRequest.serializer)
      ..add(SourceDiscoveryRequestKindEnum.serializer)
      ..add(SourceDiscoveryResponse.serializer)
      ..add(SourceOrigin.serializer)
      ..add(StorageCleanupRequest.serializer)
      ..add(StorageCleanupResponse.serializer)
      ..add(StoredFileCategory.serializer)
      ..add(StoredFileListResponse.serializer)
      ..add(StoredFileResponse.serializer)
      ..add(StructuredReportResultResponse.serializer)
      ..add(StructuredReportResultResponseKindEnum.serializer)
      ..add(StructuredReportSectionResponse.serializer)
      ..add(UpdateAiProviderProfileRequest.serializer)
      ..add(UpdateProfileRequest.serializer)
      ..add(UpdateProviderCatalogEntryRequest.serializer)
      ..add(UpdateUserAccessRequest.serializer)
      ..add(UploadPartResponse.serializer)
      ..add(UserQuotaSettings.serializer)
      ..add(UserResponse.serializer)
      ..add(UserRole.serializer)
      ..add(VideoAnalysisHistoryRecordResponse.serializer)
      ..add(VideoAnalysisHistoryRecordResponseAllowedActionsEnum.serializer)
      ..add(VideoAnalysisHistoryRecordResponseRecordTypeEnum.serializer)
      ..add(VideoAnalysisResultResponse.serializer)
      ..add(VideoAnalysisResultResponseKindEnum.serializer)
      ..add(VideoArticleEvidenceResponse.serializer)
      ..add(VideoArticleResultResponse.serializer)
      ..add(VideoArticleResultResponseKindEnum.serializer)
      ..add(VideoArticleSectionResponse.serializer)
      ..add(VideoCodecFamily.serializer)
      ..add(VideoSceneResponse.serializer)
      ..add(VisualAssetResponse.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AiModelResponse)]),
          () => ListBuilder<AiModelResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AiProviderProfileResponse)]),
          () => ListBuilder<AiProviderProfileResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(AnalysisAnalyticsDailyResponse)]),
          () => ListBuilder<AnalysisAnalyticsDailyResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(AnalysisAnalyticsInputResponse)]),
          () => ListBuilder<AnalysisAnalyticsInputResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AnalysisInputKind)]),
          () => ListBuilder<AnalysisInputKind>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(AnalysisReportArtifactResponse)]),
          () => ListBuilder<AnalysisReportArtifactResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AnalysisRunHistoryResponse)]),
          () => ListBuilder<AnalysisRunHistoryResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AnalysisSkillResponse)]),
          () => ListBuilder<AnalysisSkillResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CompletedPartRequest)]),
          () => ListBuilder<CompletedPartRequest>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CompletedPartRequest)]),
          () => ListBuilder<CompletedPartRequest>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DocumentResponse)]),
          () => ListBuilder<DocumentResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(DownloadAnalyticsDailyResponse)]),
          () => ListBuilder<DownloadAnalyticsDailyResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(DownloadAnalyticsSourceResponse)]),
          () => ListBuilder<DownloadAnalyticsSourceResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(DownloadHistoryItemResponse)]),
          () => ListBuilder<DownloadHistoryItemResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(EngineCandidateResponse)]),
          () => ListBuilder<EngineCandidateResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(FormatResponse)]),
          () => ListBuilder<FormatResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(IntentHistoryItemResponse)]),
          () => ListBuilder<IntentHistoryItemResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ItemsInner)]),
          () => ListBuilder<ItemsInner>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ManagedUserResponse)]),
          () => ListBuilder<ManagedUserResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(OperationLogResponse)]),
          () => ListBuilder<OperationLogResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ProviderCapability)]),
          () => ListBuilder<ProviderCapability>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProviderCatalogEntryResponse)]),
          () => ListBuilder<ProviderCatalogEntryResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProviderStatusResponse)]),
          () => ListBuilder<ProviderStatusResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(
                ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum)
          ]),
          () => ListBuilder<
              ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ScreenplayCharacterResponse)]),
          () => ListBuilder<ScreenplayCharacterResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ScreenplaySceneResponse)]),
          () => ListBuilder<ScreenplaySceneResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ScreenplayFindingResponse)]),
          () => ListBuilder<ScreenplayFindingResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ScreenplayFindingResponse)]),
          () => ListBuilder<ScreenplayFindingResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ScreenplayFindingResponse)]),
          () => ListBuilder<ScreenplayFindingResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ScreenplayFindingResponse)]),
          () => ListBuilder<ScreenplayFindingResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ScreenplayFindingResponse)]),
          () => ListBuilder<ScreenplayFindingResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(ScreenplayGlossaryTermResponse)]),
          () => ListBuilder<ScreenplayGlossaryTermResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ShotResponse)]),
          () => ListBuilder<ShotResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(VideoSceneResponse)]),
          () => ListBuilder<VideoSceneResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(HighlightResponse)]),
          () => ListBuilder<HighlightResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VisualAssetResponse)]),
          () => ListBuilder<VisualAssetResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(SourceDiscoveryItemResponse)]),
          () => ListBuilder<SourceDiscoveryItemResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(StoredFileResponse)]),
          () => ListBuilder<StoredFileResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VideoArticleEvidenceResponse)]),
          () => ListBuilder<VideoArticleEvidenceResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(StructuredReportSectionResponse)]),
          () => ListBuilder<StructuredReportSectionResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UploadPartResponse)]),
          () => ListBuilder<UploadPartResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UploadPartResponse)]),
          () => ListBuilder<UploadPartResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(VideoAnalysisHistoryRecordResponseAllowedActionsEnum)
          ]),
          () => ListBuilder<
              VideoAnalysisHistoryRecordResponseAllowedActionsEnum>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VideoArticleEvidenceResponse)]),
          () => ListBuilder<VideoArticleEvidenceResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VideoArticleSectionResponse)]),
          () => ListBuilder<VideoArticleSectionResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType.nullable(EvidenceValue)
          ]),
          () => MapBuilder<String, EvidenceValue?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
