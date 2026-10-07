import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for AnalysesApi
void main() {
  final instance = FramefetchServerApi().getAnalysesApi();

  group(AnalysesApi, () {
    // 取消视频分析任务
    //
    // 请求取消尚未结束的视频分析任务。
    //
    //Future<ApiResponseAnalysisResponse> cancelAnalysis(String analysisId) async
    test('test cancelAnalysis', () async {
      // TODO
    });

    // 创建视频分析任务
    //
    //Future<ApiResponseAnalysisResponse> createAnalysis(String downloadId, String idempotencyKey, AnalysisRequest analysisRequest) async
    test('test createAnalysis', () async {
      // TODO
    });

    // 创建剧本分析任务
    //
    //Future<ApiResponseAnalysisResponse> createDocumentAnalysis(String documentId, String idempotencyKey, AnalysisRequest analysisRequest) async
    test('test createDocumentAnalysis', () async {
      // TODO
    });

    // 删除视频分析与报告
    //
    // 隐藏分析任务并异步清理其私有报告对象。
    //
    //Future deleteAnalysis(String analysisId) async
    test('test deleteAnalysis', () async {
      // TODO
    });

    // 导出 Markdown 分析报告
    //
    // 导出与前端预览、DOCX 转换共用的唯一 Markdown 报告。
    //
    //Future<Uint8List> exportAnalysisMarkdown(String analysisId) async
    test('test exportAnalysisMarkdown', () async {
      // TODO
    });

    // 导出视频分析报告
    //
    // 将已完成的结构化分析结果导出为 DOCX 报告。
    //
    //Future<Uint8List> exportAnalysisReport(String analysisId) async
    test('test exportAnalysisReport', () async {
      // TODO
    });

    // 查询分析任务
    //
    // 查询分析进度及经过证据校验的结果。
    //
    //Future<ApiResponseAnalysisResponse> getAnalysis(String analysisId) async
    test('test getAnalysis', () async {
      // TODO
    });

    // 读取分析来源与历史摘要
    //
    //Future<ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseContentCreationHistoryRecordResponseSkillAnalysisHistoryRecordResponse> getAnalysisHistoryRecord(String analysisId) async
    test('test getAnalysisHistoryRecord', () async {
      // TODO
    });

    // 读取文档最近的剧本分析
    //
    // 恢复当前用户在该剧本文档上最近创建的分析与报告。
    //
    //Future<ApiResponseUnionAnalysisResponseNoneType> getLatestDocumentAnalysis(String documentId) async
    test('test getLatestDocumentAnalysis', () async {
      // TODO
    });

    // 读取下载任务最近的视频分析
    //
    // 恢复当前用户在该下载任务上最近创建的分析与报告。
    //
    //Future<ApiResponseUnionAnalysisResponseNoneType> getLatestDownloadAnalysis(String downloadId) async
    test('test getLatestDownloadAnalysis', () async {
      // TODO
    });

    // 分页读取分析运行记录
    //
    //Future<ApiResponseAnalysisRunHistoryPageResponse> listAnalysisRuns(String analysisId, { int beforeRunNo, int limit }) async
    test('test listAnalysisRuns', () async {
      // TODO
    });

    // 列出输入兼容的分析 Skill
    //
    //Future<ApiResponseTupleAnalysisSkillResponse> listAnalysisSkills(AnalysisInputKind inputKind) async
    test('test listAnalysisSkills', () async {
      // TODO
    });

    // 重新执行原分析任务
    //
    //Future<ApiResponseAnalysisResponse> retryAnalysis(String analysisId, String idempotencyKey) async
    test('test retryAnalysis', () async {
      // TODO
    });
  });
}
