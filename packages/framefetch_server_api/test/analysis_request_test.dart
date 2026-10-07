import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

// tests for AnalysisRequest
void main() {
  final instance = AnalysisRequestBuilder();
  // TODO add properties to the builder and call build()

  group(AnalysisRequest, () {
    // 由分析 Skill 清单提供的稳定任务标识。
    // String skillId
    test('to test the property `skillId`', () async {
      // TODO
    });

    // 结果语言；本项目支持 zh-CN 和 en-US。
    // String outputLanguage
    test('to test the property `outputLanguage`', () async {
      // TODO
    });

    // 可编辑的任务要求；不能覆盖来源、安全、工具或结果结构。
    // String customPrompt
    test('to test the property `customPrompt`', () async {
      // TODO
    });
  });
}
