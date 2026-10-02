import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Cursor feeds know whether another page exists, not a fabricated total.
final class CursorPagination extends StatelessWidget {
  const CursorPagination({
    required this.page,
    required this.hasNext,
    required this.onPrevious,
    required this.onNext,
    this.pageSize = 10,
    this.onPageSize,
    this.busy = false,
    super.key,
  });
  final int page;
  final bool hasNext;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final int pageSize;
  final ValueChanged<int>? onPageSize;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Wrap(
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      runSpacing: 8,
      children: [
        if (onPageSize != null)
          SizedBox(
            width: 150,
            child: AppDropdownField<int>(
              value: pageSize,
              label: l.pageSizeLabel,
              showLabel: false,
              enabled: !busy,
              options: [
                for (final size in [10, 20, 50])
                  AppDropdownOption(value: size, label: l.pageSizeOption(size)),
              ],
              onSelected: (value) {
                if (!busy && value != null) onPageSize!(value);
              },
            ),
          ),
        Semantics(
          label: l.previousPage,
          child: ShadIconButton.ghost(
            enabled: !busy && page > 1,
            onPressed: !busy && page > 1 ? onPrevious : null,
            icon: const Icon(PhosphorIconsRegular.caretLeft),
          ),
        ),
        Semantics(liveRegion: true, child: Text(l.currentPageLabel(page))),
        Semantics(
          label: l.nextPage,
          child: ShadIconButton.ghost(
            enabled: !busy && hasNext,
            onPressed: !busy && hasNext ? onNext : null,
            icon: const Icon(PhosphorIconsRegular.caretRight),
          ),
        ),
      ],
    );
  }
}
