import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AppDropdownOption<T> {
  const AppDropdownOption({
    required this.label,
    required this.value,
    this.enabled = true,
  });

  final String label;
  final T value;
  final bool enabled;
}

final class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    required this.label,
    required this.onSelected,
    required this.options,
    required this.value,
    this.enabled = true,
    this.showLabel = true,
    super.key,
  });

  final bool enabled;
  final bool showLabel;
  final String label;
  final ValueChanged<T?> onSelected;
  final List<AppDropdownOption<T>> options;
  final T value;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: showLabel ? null : label,
      child: ShadInputDecorator(
        label: showLabel ? Text(label) : null,
        child: LayoutBuilder(
          builder: (context, constraints) => ShadSelect<T>(
            key: ValueKey(value),
            enabled: enabled,
            initialValue: value,
            trailing: const Icon(PhosphorIconsRegular.caretDown, size: 16),
            placeholder: Text(
              options
                      .where((option) => option.value == value)
                      .firstOrNull
                      ?.label ??
                  label,
            ),
            minWidth: constraints.maxWidth.isFinite
                ? constraints.maxWidth
                : null,
            maxHeight: 304,
            onChanged: onSelected,
            selectedOptionBuilder: (context, selected) => Text(
              options
                      .where((option) => option.value == selected)
                      .firstOrNull
                      ?.label ??
                  '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            options: [
              for (final option in options)
                if (option.enabled)
                  ShadOption<T>(value: option.value, child: Text(option.label))
                else
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Semantics(
                      enabled: false,
                      child: Text(
                        option.label,
                        style: ShadTheme.of(context).textTheme.muted,
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
