import 'package:video_server_api/video_server_api.dart';

DownloadAnalyticsResponse adminDownloadAnalyticsFixture({bool empty = false}) =>
    DownloadAnalyticsResponse(
      (b) => b
        ..periodDays = 7
        ..start = DateTime.utc(2026, 9, 25)
        ..end = DateTime.utc(2026, 10, 1)
        ..summary.replace(
          DownloadAnalyticsSummaryResponse(
            (s) => s
              ..total = empty ? 0 : 12
              ..succeeded = empty ? 0 : 8
              ..failed = empty ? 0 : 2
              ..cancelled = empty ? 0 : 1
              ..active = empty ? 0 : 1
              ..uniqueUsers = empty ? 0 : 3
              ..downloadedBytes = empty ? 0 : 180000000
              ..averageDurationSeconds = empty ? 0 : 124
              ..successRate = empty ? 0 : 80,
          ),
        )
        ..daily.addAll([
          for (var day = 25; day <= 30; day++)
            DownloadAnalyticsDailyResponse(
              (d) => d
                ..date = Date(2026, 9, day)
                ..total = empty ? 0 : 2
                ..succeeded = empty ? 0 : ([26, 28].contains(day) ? 2 : 1)
                ..failed = empty ? 0 : ([27, 29].contains(day) ? 1 : 0)
                ..cancelled = empty ? 0 : (day == 25 ? 1 : 0),
            ),
        ])
        ..sources.addAll(
          empty
              ? []
              : [
                  DownloadAnalyticsSourceResponse(
                    (s) => s
                      ..sourceKey = 'synthetic-upload'
                      ..sourceName = '本地导入'
                      ..total = 12
                      ..succeeded = 8
                      ..failed = 2
                      ..cancelled = 1
                      ..active = 1
                      ..uniqueUsers = 3
                      ..downloadedBytes = 180000000
                      ..successRate = 80,
                  ),
                ],
        ),
    );

AnalysisAnalyticsResponse adminAnalysisAnalyticsFixture({
  bool empty = false,
  bool noDuration = false,
}) => AnalysisAnalyticsResponse(
  (b) => b
    ..periodDays = 7
    ..start = DateTime.utc(2026, 9, 25)
    ..end = DateTime.utc(2026, 10, 1)
    ..summary.replace(
      AnalysisAnalyticsSummaryResponse(
        (s) => s
          ..total = empty ? 0 : 12
          ..succeeded = empty ? 0 : 8
          ..failed = empty ? 0 : 2
          ..cancelled = empty ? 0 : 1
          ..active = empty ? 0 : 1
          ..averageDurationSeconds = empty || noDuration ? null : 123.4
          ..completedDurationCount = empty || noDuration ? 0 : 10,
      ),
    )
    ..daily.addAll([
      for (var day = 25; day <= 30; day++)
        AnalysisAnalyticsDailyResponse(
          (d) => d
            ..date = Date(2026, 9, day)
            ..total = empty ? 0 : 2
            ..succeeded = empty ? 0 : ([26, 28].contains(day) ? 2 : 1)
            ..failed = empty ? 0 : ([27, 29].contains(day) ? 1 : 0)
            ..cancelled = empty ? 0 : (day == 25 ? 1 : 0)
            ..active = empty ? 0 : (day == 30 ? 1 : 0),
        ),
    ])
    ..inputs.addAll(
      empty
          ? []
          : [
              AnalysisAnalyticsInputResponse(
                (i) => i
                  ..inputKind = AnalysisInputKind.video
                  ..total = 9,
              ),
              AnalysisAnalyticsInputResponse(
                (i) => i
                  ..inputKind = AnalysisInputKind.screenplay
                  ..total = 3,
              ),
            ],
    ),
);

OperationLogPageResponse adminOperationLogsFixture({bool empty = false}) =>
    OperationLogPageResponse(
      (b) => b
        ..page = 1
        ..pageSize = 10
        ..total = empty ? 0 : 2
        ..items.addAll(
          empty
              ? []
              : [
                  OperationLogResponse(
                    (l) => l
                      ..id = 'synthetic-log-1'
                      ..createdAt = DateTime.utc(2026, 10, 1, 8)
                      ..finishedAt = DateTime.utc(2026, 10, 1, 8, 0, 2)
                      ..actorId = 'synthetic-account'
                      ..actorName = '演示管理员'
                      ..operation = 'admin.users.update'
                      ..description = '更新账户访问权限'
                      ..method = 'PATCH'
                      ..route = '/api/admin/users/synthetic-account'
                      ..resourceKey = 'synthetic-account'
                      ..outcome = OperationLogResponseOutcomeEnum.succeeded
                      ..source_ = OperationLogResponseSource_Enum.request
                      ..statusCode = 200,
                  ),
                  OperationLogResponse(
                    (l) => l
                      ..id = 'synthetic-log-2'
                      ..createdAt = DateTime.utc(2026, 10, 1, 8, 5)
                      ..operation = 'analysis.state'
                      ..description = 'AI 分析状态更新'
                      ..method = 'TASK'
                      ..route = '/analysis'
                      ..resourceId = 'synthetic-analysis'
                      ..outcome = OperationLogResponseOutcomeEnum.succeeded
                      ..source_ = OperationLogResponseSource_Enum.task
                      ..taskState = 'retry_wait',
                  ),
                ],
        ),
    );
