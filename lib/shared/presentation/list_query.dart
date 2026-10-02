import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class ListQuery {
  const ListQuery({
    this.page = 1,
    this.pageSize = 10,
    this.search = '',
    this.status,
  });
  final int page;
  final int pageSize;
  final String search;
  final String? status;
}

final class ListQueryController extends Notifier<ListQuery> {
  @override
  ListQuery build() => const ListQuery();
  void page(int value) => state = ListQuery(
    page: value,
    pageSize: state.pageSize,
    search: state.search,
    status: state.status,
  );
  void pageSize(int value) => state = ListQuery(
    pageSize: value,
    search: state.search,
    status: state.status,
  );
  void filter({String? search, String? status}) => state = ListQuery(
    pageSize: state.pageSize,
    search: search ?? state.search,
    status: status,
  );
}

final class ListPagination extends StatelessWidget {
  const ListPagination({
    required this.page,
    required this.total,
    required this.onPage,
    this.pageSize = 10,
    this.onPageSize,
    this.busy = false,
    super.key,
  });
  final int page;
  final int total;
  final int pageSize;
  final ValueChanged<int>? onPageSize;
  final bool busy;
  final ValueChanged<int> onPage;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final pages = (total / pageSize).ceil().clamp(1, 1000000);
    return Wrap(
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      children: [
        if (onPageSize != null)
          SizedBox(
            width: 150,
            child: AppDropdownField<int>(
              value: pageSize,
              label: l.pageSizeLabel,
              showLabel: false,
              options: [
                for (final size in [10, 20, 50])
                  AppDropdownOption(value: size, label: l.pageSizeOption(size)),
              ],
              enabled: !busy,
              onSelected: (value) {
                if (!busy && value != null) onPageSize!(value);
              },
            ),
          ),
        Semantics(
          label: l.previousPage,
          child: ShadIconButton.ghost(
            onPressed: !busy && page > 1 ? () => onPage(page - 1) : null,
            enabled: !busy && page > 1,
            icon: const Icon(PhosphorIconsRegular.caretLeft),
          ),
        ),
        Semantics(liveRegion: true, child: Text('$page / $pages')),
        Semantics(
          label: l.nextPage,
          child: ShadIconButton.ghost(
            onPressed: !busy && page < pages ? () => onPage(page + 1) : null,
            enabled: !busy && page < pages,
            icon: const Icon(PhosphorIconsRegular.caretRight),
          ),
        ),
      ],
    );
  }
}
