import 'package:flutter/material.dart';
import 'package:flutter_file_saver/flutter_file_saver.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/analysis/data/analysis_docx_repository.dart';
import 'package:framegrab/features/analysis/data/analysis_markdown_repository.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum AnalysisReportFormat { docx, markdown }

final class AnalysisReportDownloadButton extends ConsumerStatefulWidget {
  const AnalysisReportDownloadButton({
    required this.analysisId,
    required this.format,
    super.key,
  });

  final String analysisId;
  final AnalysisReportFormat format;

  @override
  ConsumerState<AnalysisReportDownloadButton> createState() =>
      _AnalysisReportDownloadButtonState();
}

final class _AnalysisReportDownloadButtonState
    extends ConsumerState<AnalysisReportDownloadButton> {
  bool _busy = false;

  Future<void> _save() async {
    if (_busy) return;
    final analysisId = widget.analysisId;
    final format = widget.format;
    setState(() => _busy = true);
    try {
      final bytes = await switch (format) {
        AnalysisReportFormat.docx =>
          ref.read(analysisDocxRepositoryProvider).fetch(analysisId),
        AnalysisReportFormat.markdown =>
          ref.read(analysisMarkdownRepositoryProvider).fetch(analysisId),
      };
      if (!mounted) return;
      final extension = format == AnalysisReportFormat.docx ? 'docx' : 'md';
      await FlutterFileSaver().writeFileAsBytes(
        fileName: 'analysis-report-$analysisId.$extension',
        bytes: bytes,
      );
    } catch (_) {
      if (mounted) {
        ShadSonner.of(context).show(
          ShadToast(
            description: Text(
              AppLocalizations.of(context).analysisReportDownloadFailed,
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ShadButton.secondary(
      key: Key('export-analysis-${widget.format.name}'),
      onPressed: _busy ? null : _save,
      enabled: !_busy,
      leading: const Icon(PhosphorIconsRegular.download),
      height: 0,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Flexible(
        child: Text(
          widget.format == AnalysisReportFormat.docx
              ? l10n.exportDocx
              : l10n.exportMarkdown,
        ),
      ),
    );
  }
}
