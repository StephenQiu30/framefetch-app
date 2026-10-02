import 'package:flutter/material.dart';
import 'package:flutter_file_saver/flutter_file_saver.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/analysis/data/analysis_markdown_repository.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AnalysisMarkdownButton extends ConsumerStatefulWidget {
  const AnalysisMarkdownButton({required this.analysisId, super.key});
  final String analysisId;
  @override
  ConsumerState<AnalysisMarkdownButton> createState() =>
      _AnalysisMarkdownButtonState();
}

final class _AnalysisMarkdownButtonState
    extends ConsumerState<AnalysisMarkdownButton> {
  bool _busy = false;
  Future<void> _save() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final bytes = await ref
          .read(analysisMarkdownRepositoryProvider)
          .fetch(widget.analysisId);
      if (!mounted) return;
      await FlutterFileSaver().writeFileAsBytes(
        fileName: 'analysis-report-${widget.analysisId}.md',
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
  Widget build(BuildContext context) => ShadButton.secondary(
    key: const Key('export-analysis-markdown'),
    onPressed: _busy ? null : _save,
    enabled: !_busy,
    leading: const Icon(PhosphorIconsRegular.download),
    height: 0,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    child: Flexible(child: Text(AppLocalizations.of(context).exportMarkdown)),
  );
}
