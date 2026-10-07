import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/features/download/application/download_intake_controller.dart';
import 'package:framefetch/features/download/presentation/download_intake_workspace.dart';
import 'package:framefetch/features/download/presentation/intake_failure_message.dart';
import 'package:framefetch/features/history/application/activity_history_provider.dart';
import 'package:framefetch/features/history/application/download_history_provider.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_navigation_bar.dart';
import 'package:framefetch/shared/presentation/app_spinner.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:go_router/go_router.dart';

final class InspectionResultScreen extends ConsumerStatefulWidget {
  const InspectionResultScreen({
    this.intentId,
    this.inspectionId,
    this.discoveryId,
    super.key,
  });
  final String? intentId;
  final String? inspectionId;
  final String? discoveryId;

  @override
  ConsumerState<InspectionResultScreen> createState() =>
      _InspectionResultScreenState();
}

final class _InspectionResultScreenState
    extends ConsumerState<InspectionResultScreen> {
  bool _loading = true;

  @override
  void didUpdateWidget(InspectionResultScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.intentId != widget.intentId ||
        oldWidget.inspectionId != widget.inspectionId ||
        oldWidget.discoveryId != widget.discoveryId) {
      setState(() => _loading = true);
      unawaited(_restore());
    }
  }

  @override
  void initState() {
    super.initState();
    unawaited(_restore());
  }

  Future<void> _restore() async {
    final controller = ref.read(downloadIntakeControllerProvider.notifier);
    if (widget.intentId case final id?) {
      await controller.resume(id);
    } else if (widget.inspectionId case final id?) {
      await controller.resumeInspection(id);
    } else if (widget.discoveryId case final id?) {
      await controller.resumeDiscovery(id);
    }
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _create() async {
    final job = await ref
        .read(downloadIntakeControllerProvider.notifier)
        .createDownload();
    if (!mounted || job == null) return;
    ref.invalidate(downloadHistoryProvider);
    ref.invalidate(activityHistoryProvider);
    unawaited(context.push<void>('/downloads/${Uri.encodeComponent(job.id)}'));
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final state = ref.watch(downloadIntakeControllerProvider);
    final controller = ref.read(downloadIntakeControllerProvider.notifier);
    return Scaffold(
      appBar: const AppNavigationBar(backFallbackLocation: '/'),
      body: DataPageView(
        title: state.inspection?.title ?? l.inspectionResultTitle,
        refreshLabel: l.refreshAction,
        onRefresh: _restore,
        children: [
          if (_loading)
            const Center(child: AppSpinner())
          else if (widget.intentId == null &&
              widget.inspectionId == null &&
              widget.discoveryId == null)
            DataStateMessage(
              title: l.loadFailedTitle,
              description: l.createDownloadFromHomeAction,
              actionLabel: l.reparseDownloadAction,
              onAction: () => context.go('/'),
            )
          else ...[
            if (state.error case final error?)
              Text(
                intakeFailureMessage(l, error),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            DownloadIntakeWorkspace(
              state: state,
              onCancelIntent: () => unawaited(controller.cancelIntent()),
              onCreate: () => unawaited(_create()),
              onOpenJob: (id) => unawaited(
                context.push<void>('/downloads/${Uri.encodeComponent(id)}'),
              ),
              onRefreshIntent: () => unawaited(controller.refreshIntent()),
              onRetryInspection: () => unawaited(_restore()),
              onSelectFormat: controller.selectFormat,
              onSelectItem: (id) => unawaited(controller.inspectItem(id)),
              onUseUpload: () => context.go('/?intake=video'),
              onReparse: () {
                controller.clearResult();
                context.go('/');
              },
            ),
          ],
        ],
      ),
    );
  }
}
