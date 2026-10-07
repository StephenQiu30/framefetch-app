import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/landing/domain/public_home_links.dart';
import 'package:framefetch/l10n/app_localizations_zh.dart';

void main() {
  test('retains public product and self-hosting content', () {
    final l10n = AppLocalizationsZh();

    expect(l10n.publicHomeEyebrow, '帧取 Framefetch · 开源视频工作流');
    expect(l10n.publicHomeTitle, '把素材，\n带回本地。');
    expect(
      l10n.publicHomeDescription,
      '开源、自托管地完成公开视频解析、本地视频与剧本文档导入、制品管理和 AI 分析。数据与运行边界由你掌控。',
    );
    expect(l10n.publicWorkflowEyebrow, '工作流');
    expect(
      [
        (
          l10n.publicWorkflowInspectTitle,
          l10n.publicWorkflowInspectDescription,
        ),
        (l10n.publicWorkflowSelectTitle, l10n.publicWorkflowSelectDescription),
        (
          l10n.publicWorkflowExecuteTitle,
          l10n.publicWorkflowExecuteDescription,
        ),
        (
          l10n.publicWorkflowDeliverTitle,
          l10n.publicWorkflowDeliverDescription,
        ),
      ],
      [
        ('解析', '识别公开媒体或文章中的候选视频'),
        ('选择', '确认目标与格式，避免隐式下载'),
        ('执行', '由隔离 Worker 处理下载、导入和分析'),
        ('交付', '通过授权短时入口预览或获取制品'),
      ],
    );
    expect(l10n.publicHomeCapabilitiesTitle, '视频解析、剧本处理与 AI 分析');
    expect(
      [
        (l10n.publicVideoTitle, l10n.publicVideoDescription),
        (l10n.publicDocumentTitle, l10n.publicDocumentDescription),
        (l10n.publicAnalysisTitle, l10n.publicAnalysisDescription),
      ],
      [
        ('公开视频工作流', '解析有权处理的公开链接，选择真实可用格式，并跟踪下载与最终制品。'),
        ('剧本与文档处理', '导入获授权的剧本文档，在同一工作区完成规范化、分析与处理记录。'),
        ('结构化 AI 视频分析', '围绕场景、分镜、高光和内容资产生成结构化结果与运行证据。'),
      ],
    );
    expect(l10n.publicTrustEyebrow, '自托管架构');
    expect(
      l10n.publicTrustDescription,
      'FastAPI、Next.js、PostgreSQL、RabbitMQ、MinIO、FFmpeg 与 yt-dlp 组成可独立部署的工作流。MIT 许可证允许你免费检查、修改和自托管。',
    );
    expect(l10n.publicSafeguardAuthorization, '公开视频并不等于可自由使用，请仅处理已获授权的内容。');
    expect(l10n.publicFaqEyebrow, '常见问题');
    expect(
      [
        l10n.publicFaqWhatQuestion,
        l10n.publicFaqReportsQuestion,
        l10n.publicFaqImportQuestion,
        l10n.publicFaqCostQuestion,
        l10n.publicFaqPlatformsQuestion,
        l10n.publicFaqMobileQuestion,
      ],
      [
        '帧取 Framefetch 是什么？',
        'AI 视频分析可以输出什么？',
        '可以直接分析本地视频和剧本吗？',
        '开源免费是否意味着运行没有成本？',
        '是否支持所有视频平台和所有链接？',
        '手机端是否能独立运行 AI 分析？',
      ],
    );
    expect(l10n.publicGuideAction, '阅读视频分析与自托管使用指南');
    expect(l10n.publicStartTitle, '在自己的基础设施上运行 Framefetch');
  });

  test('uses the Web repository as the shared project source', () {
    expect(
      PublicHomeLinks.repository.toString(),
      'https://github.com/StephenQiu30/framefetch-server',
    );
    expect(
      PublicHomeLinks.quickStart.toString(),
      'https://github.com/StephenQiu30/framefetch-server/blob/main/README.md#%E5%BF%AB%E9%80%9F%E5%BC%80%E5%A7%8B',
    );
    expect(
      PublicHomeLinks.mobileRepository.toString(),
      'https://github.com/StephenQiu30/framefetch-app',
    );
  });
}
