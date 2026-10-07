import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/history/application/activity_history_query.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_dropdown_field.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class ActivityHistoryFilters extends StatefulWidget {
  const ActivityHistoryFilters({
    required this.query,
    required this.onFilter,
    required this.skills,
    super.key,
  });
  final ActivityHistoryQuery query;
  final ValueChanged<ActivityHistoryQuery> onFilter;
  final List<AnalysisSkillResponse> skills;

  @override
  State<ActivityHistoryFilters> createState() => _ActivityHistoryFiltersState();
}

final class _ActivityHistoryFiltersState extends State<ActivityHistoryFilters> {
  late final _search = TextEditingController(text: widget.query.search);
  final _from = TextEditingController();
  final _to = TextEditingController();
  bool _invalidDates = false;

  @override
  void dispose() {
    _search.dispose();
    _from.dispose();
    _to.dispose();
    super.dispose();
  }

  void _apply() {
    final from = ActivityHistoryQuery.dateBoundary(_from.text.trim());
    final to = ActivityHistoryQuery.dateBoundary(_to.text.trim(), end: true);
    if ((_from.text.isNotEmpty && from == null) ||
        (_to.text.isNotEmpty && to == null) ||
        (from != null && to != null && !from.isBefore(to))) {
      setState(() => _invalidDates = true);
      return;
    }
    setState(() => _invalidDates = false);
    widget.onFilter(
      widget.query.filter(
        search: _search.text.trim(),
        createdFrom: from,
        createdTo: to,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final query = widget.query;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.small,
          children: [
            for (final category in ActivityCategory.values)
              ShadButton.ghost(
                key: Key('activity-category-${category.name}'),
                onPressed: () => widget.onFilter(
                  query.filter(
                    category: category,
                    screenplayMode: ScreenplayHistoryMode.all,
                    skillId: null,
                  ),
                ),
                backgroundColor: query.category == category
                    ? Theme.of(context).colorScheme.surfaceContainerHighest
                    : null,
                child: Text(switch (category) {
                  ActivityCategory.all => l.activityHistoryAll,
                  ActivityCategory.parse => l.activityHistoryLink,
                  ActivityCategory.video => l.activityHistoryVideo,
                  ActivityCategory.screenplay => l.activityHistoryScreenplay,
                }),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.medium),
        ShadInput(
          key: const Key('activity-search'),
          controller: _search,
          placeholder: Text(l.activityHistorySearch),
          onSubmitted: (_) => _apply(),
        ),
        const SizedBox(height: AppSpacing.medium),
        Wrap(
          spacing: AppSpacing.medium,
          runSpacing: AppSpacing.medium,
          children: [
            SizedBox(
              width: 160,
              child: _DateField(
                label: l.activityHistoryFrom,
                controller: _from,
              ),
            ),
            SizedBox(
              width: 160,
              child: _DateField(label: l.activityHistoryTo, controller: _to),
            ),
            ShadButton.outline(onPressed: _apply, child: Text(l.searchAction)),
            ShadButton.ghost(
              key: const Key('activity-clear-filters'),
              onPressed: () {
                _search.clear();
                _from.clear();
                _to.clear();
                setState(() => _invalidDates = false);
                widget.onFilter(
                  ActivityHistoryQuery(
                    pageSize: query.pageSize,
                    documentId: query.documentId,
                    downloadId: query.downloadId,
                  ),
                );
              },
              child: Text(l.clearFiltersAction),
            ),
          ],
        ),
        if (_invalidDates)
          Text(
            l.invalidConfiguration,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        const SizedBox(height: AppSpacing.medium),
        Wrap(
          spacing: AppSpacing.medium,
          runSpacing: AppSpacing.medium,
          children: [
            SizedBox(
              width: 180,
              child: AppDropdownField<HistoryStatusGroup?>(
                label: l.statusLabel,
                value: query.status,
                options: [
                  AppDropdownOption(value: null, label: l.allStatuses),
                  AppDropdownOption(
                    value: HistoryStatusGroup.processing,
                    label: l.activeLabel,
                  ),
                  AppDropdownOption(
                    value: HistoryStatusGroup.completed,
                    label: l.succeededLabel,
                  ),
                  AppDropdownOption(
                    value: HistoryStatusGroup.failed,
                    label: l.failedLabel,
                  ),
                  AppDropdownOption(
                    value: HistoryStatusGroup.cancelled,
                    label: l.cancelledLabel,
                  ),
                  AppDropdownOption(
                    value: HistoryStatusGroup.expired,
                    label: l.intentExpired,
                  ),
                ],
                onSelected: (value) =>
                    widget.onFilter(query.filter(status: value)),
              ),
            ),
            if (query.category == ActivityCategory.screenplay)
              SizedBox(
                width: 180,
                child: AppDropdownField<ScreenplayHistoryMode>(
                  label: l.activityHistoryScreenplay,
                  value: query.screenplayMode,
                  options: [
                    for (final mode in ScreenplayHistoryMode.values)
                      AppDropdownOption(
                        value: mode,
                        label: switch (mode) {
                          ScreenplayHistoryMode.all => l.activityHistoryAll,
                          ScreenplayHistoryMode.basic => l.activityHistoryBasic,
                          ScreenplayHistoryMode.analysis =>
                            l.screenplayAnalysisTitle,
                          ScreenplayHistoryMode.rewrite =>
                            l.activityHistoryRewrite,
                        },
                      ),
                  ],
                  onSelected: (value) {
                    if (value != null) {
                      widget.onFilter(
                        query.filter(screenplayMode: value, skillId: null),
                      );
                    }
                  },
                ),
              ),
            if (query.category != ActivityCategory.parse &&
                query.screenplayMode != ScreenplayHistoryMode.basic)
              SizedBox(
                width: 230,
                child: AppDropdownField<String?>(
                  label: l.activityHistorySkill,
                  value: query.skillId,
                  options: [
                    AppDropdownOption(value: null, label: l.activityHistoryAll),
                    for (final skill in widget.skills.where(
                      (s) =>
                          query.category != ActivityCategory.video &&
                              query.category != ActivityCategory.screenplay ||
                          s.inputKinds.contains(
                            (query.category == ActivityCategory.video
                                ? AnalysisInputKind.video
                                : AnalysisInputKind.screenplay),
                          ),
                    ))
                      AppDropdownOption(
                        value: skill.id,
                        label: skill.displayName,
                      ),
                  ],
                  onSelected: (value) =>
                      widget.onFilter(query.filter(skillId: value)),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

final class _DateField extends StatelessWidget {
  const _DateField({required this.label, required this.controller});
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: Theme.of(context).textTheme.labelMedium),
      const SizedBox(height: AppSpacing.xSmall),
      ShadInput(
        controller: controller,
        placeholder: const Text('YYYY-MM-DD'),
        maxLength: 10,
        keyboardType: TextInputType.datetime,
      ),
    ],
  );
}
