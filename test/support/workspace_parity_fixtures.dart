import 'package:framegrab/features/history/application/activity_history_query.dart';
import 'package:framegrab/features/history/data/activity_history_repository.dart';
import 'package:one_of/one_of.dart';
import 'package:video_server_api/video_server_api.dart';

import 'analysis_fakes.dart';

AnalysisResponse structuredReportFixture() {
  final result = StructuredReportResultResponse(
    (b) => b
      ..kind = StructuredReportResultResponseKindEnum.structuredReport
      ..language = 'zh-CN'
      ..title = '开场钩子复盘'
      ..summary = '目标与冲突在开场十秒建立。'
      ..media.durationMs = 60000
      ..media.container = 'mp4'
      ..media.sizeBytes = 1024
      ..sections.add(
        StructuredReportSectionResponse(
          (s) => s
            ..id = 'opening'
            ..heading = '开场判断'
            ..body = '优先保留首个反应镜头。'
            ..items.add('缩短重复铺垫')
            ..evidence.add(
              VideoArticleEvidenceResponse(
                (e) => e
                  ..startMs = 2000
                  ..endMs = 6000
                  ..note = '人物目标首次显现',
              ),
            ),
        ),
      )
      ..limitations.add('片外信息需另行核验'),
  );
  return analysisJobFixture().rebuild(
    (b) => b
      ..result.oneOf = OneOfDynamic(
        typeIndex: 2,
        types: const [
          ScreenplayAnalysisResultResponse,
          ScreenplayRewriteResultResponse,
          StructuredReportResultResponse,
          VideoAnalysisResultResponse,
          VideoArticleResultResponse,
        ],
        value: result,
      )
      ..reportMarkdown = null,
  );
}

ParseHistoryRecordResponse parseHistoryFixture() => ParseHistoryRecordResponse(
  (b) => b
    ..id = '00000000-0000-4000-8000-000000000301'
    ..inspectionId = '00000000-0000-0000-0000-000000000301'
    ..title = '演示链接解析'
    ..status = IntentStatus.ready
    ..version = 1
    ..createdAt = DateTime.utc(2026, 10, 2)
    ..updatedAt = DateTime.utc(2026, 10, 2)
    ..deadline = DateTime.utc(2099)
    ..statusGroup = HistoryStatusGroup.completed
    ..sourceAvailability = HistoryAvailability.available
    ..resultAvailability = HistoryAvailability.available
    ..recordType = ParseHistoryRecordResponseRecordTypeEnum.parse,
);

final class FakeActivityHistoryRepository implements ActivityHistoryRepository {
  @override
  Future<HistoryRecordPageResponse> fetch(ActivityHistoryQuery query) async =>
      HistoryRecordPageResponse(
        (b) => b
          ..items.add(
            ItemsInner(
              (i) => i
                ..oneOf = OneOfDynamic(
                  typeIndex: 1,
                  types: const [
                    DocumentParseHistoryRecordResponse,
                    ParseHistoryRecordResponse,
                    ScreenplayAnalysisHistoryRecordResponse,
                    VideoAnalysisHistoryRecordResponse,
                  ],
                  value: parseHistoryFixture(),
                ),
            ),
          ),
      );
}
