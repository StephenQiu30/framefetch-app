import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AppResourceMenu extends StatefulWidget {
  const AppResourceMenu({super.key});
  @override
  State<AppResourceMenu> createState() => _AppResourceMenuState();
}

final class _AppResourceMenuState extends State<AppResourceMenu> {
  final _controller = ShadPopoverController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return ShadPopover(
      controller: _controller,
      popover: (context) => SizedBox(
        width: 220,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final entry in [
              (l.guideNavigation, '/guide', PhosphorIconsRegular.bookOpen),
              (
                l.selfHostingNavigation,
                '/self-hosting',
                PhosphorIconsRegular.desktopTower,
              ),
              (l.aboutNavigation, '/about', PhosphorIconsRegular.info),
            ])
              ShadButton.ghost(
                expands: true,
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                mainAxisAlignment: MainAxisAlignment.start,
                leading: Icon(entry.$3, size: 18),
                onPressed: () {
                  _controller.hide();
                  this.context.push(entry.$2);
                },
                child: Text(entry.$1),
              ),
          ],
        ),
      ),
      child: Semantics(
        label: l.resourcesNavigation,
        button: true,
        child: ShadIconButton.ghost(
          key: const Key('resource-menu-button'),
          icon: const Icon(PhosphorIconsRegular.list),
          onPressed: _controller.toggle,
        ),
      ),
    );
  }
}
