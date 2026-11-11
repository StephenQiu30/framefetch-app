import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/admin/application/admin_mutation_controller.dart';
import 'package:framefetch/features/admin/application/admin_providers.dart';
import 'package:framefetch/features/admin/data/admin_configuration_repository.dart';
import 'package:framefetch/features/admin/data/admin_repository.dart';
import 'package:framefetch/features/admin/presentation/admin_ai_provider_row.dart';
import 'package:framefetch/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framefetch/features/admin/presentation/admin_page.dart';
import 'package:framefetch/features/admin/presentation/ai_provider_editor.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/data_request_failure_message.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminAiProvidersScreen extends ConsumerStatefulWidget {
  const AdminAiProvidersScreen({super.key});
  @override
  ConsumerState<AdminAiProvidersScreen> createState() =>
      _AdminAiProvidersScreenState();
}

final class _AdminAiProvidersScreenState
    extends ConsumerState<AdminAiProvidersScreen> {
  AiProviderEngine? _busyEngine;

  Future<void> _activate(AiProviderEngine engine) async {
    setState(() => _busyEngine = engine);
    try {
      await ref.read(adminRepositoryProvider).activateAiProvider(engine);
      if (mounted) {
        ref.invalidate(adminAiProvidersProvider);
      }
    } catch (_) {
      if (mounted) {
        ShadSonner.of(context).show(
          ShadToast(
            description: Text(AppLocalizations.of(context).adminActionFailed),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busyEngine = null);
    }
  }

  Future<void> _delete(AiProviderProfileResponse item) async {
    final l = AppLocalizations.of(context);
    if (!await confirmAdminDelete(
          context,
          description: l.adminDeleteAiDescription,
        ) ||
        !mounted) {
      return;
    }
    final result = await ref
        .read(adminAiMutationProvider.notifier)
        .run(
          () => ref
              .read(adminConfigurationRepositoryProvider)
              .deleteAi(item.engine),
        );
    if (!mounted || result == AdminMutationResult.stale) return;
    if (result == AdminMutationResult.failed) {
      ShadSonner.of(
        context,
      ).show(ShadToast(description: Text(l.adminActionFailed)));
      return;
    }
    ref.invalidate(adminAiProvidersProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final result = ref.watch(adminAiProvidersProvider);
    final busy = ref.watch(adminAiMutationProvider) || _busyEngine != null;
    return AdminPage(
      title: l.adminAiProvidersTitle,
      refreshLabel: l.refreshAction,
      onRefresh: () =>
          ref.refresh(adminAiProvidersProvider.future).then((_) {}),
      children: [
        ...result.when(
          data: (data) => [
            Text(
              data.agentAvailable
                  ? l.adminAgentAvailable
                  : l.adminAgentUnavailable,
            ),
            const SizedBox(height: AppSpacing.medium),
            for (final item in data.items)
              AdminAiProviderRow(
                key: ValueKey('ai-${item.engine.name}'),
                item: item,
                busy: busy,
                onActivate: () => _activate(item.engine),
                onEdit: () => configureAiService(context, ref, item),
                onDelete: () => _delete(item),
              ),
          ],
          error: (error, _) => adminError(
            action: l.retryAction,
            title: l.loadFailedTitle,
            description: dataRequestFailureMessage(l, error),
            retry: () => ref.invalidate(adminAiProvidersProvider),
          ),
          loading: () => adminLoading(l.loadingData),
        ),
      ],
    );
  }
}
