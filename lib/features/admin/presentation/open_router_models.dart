import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/application/ai_provider_protocol.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class OpenRouterModels extends ConsumerStatefulWidget {
  const OpenRouterModels({required this.onSelected, super.key});
  final ValueChanged<String> onSelected;
  @override
  ConsumerState<OpenRouterModels> createState() => _OpenRouterModelsState();
}

final class _OpenRouterModelsState extends ConsumerState<OpenRouterModels> {
  bool _loaded = false;
  String _search = '';
  String? _selection;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final result = _loaded ? ref.watch(openRouterModelsProvider) : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShadButton.outline(
          enabled: result?.isLoading != true,
          onPressed: () {
            ref.invalidate(openRouterModelsProvider);
            setState(() => _loaded = true);
          },
          child: Text(
            result?.isLoading == true ? l.loadingData : l.adminReadModels,
          ),
        ),
        if (result != null)
          ...result.when(
            data: (data) {
              final items = data.items
                  .where(
                    (item) =>
                        supportsStructuredText(item) &&
                        '${item.name} ${item.id}'.toLowerCase().contains(
                          _search.toLowerCase(),
                        ),
                  )
                  .toList();
              return [
                const SizedBox(height: AppSpacing.medium),
                ShadInput(
                  placeholder: Text(l.adminModelSearch),
                  onChanged: (v) => setState(() => _search = v),
                ),
                const SizedBox(height: AppSpacing.medium),
                if (items.isEmpty)
                  Text(l.adminModelsEmpty)
                else
                  AppDropdownField<String>(
                    value: items.any((m) => m.id == _selection)
                        ? _selection!
                        : '',
                    label: l.adminModelDirectory,
                    options: [
                      for (final model in items)
                        AppDropdownOption(
                          value: model.id,
                          label:
                              '${model.id} · ${model.inputModalities.contains('image') ? l.adminImageSupported : l.adminTextOnly}',
                        ),
                    ],
                    onSelected: (id) {
                      if (id == null) return;
                      setState(() => _selection = id);
                      widget.onSelected(id);
                    },
                  ),
              ];
            },
            loading: () => <Widget>[],
            error: (error, _) => [
              ShadAlert.destructive(
                description: Text(dataRequestFailureMessage(l, error)),
              ),
            ],
          ),
        const SizedBox(height: AppSpacing.small),
        Text(l.adminModelsHint, style: ShadTheme.of(context).textTheme.muted),
      ],
    );
  }
}
