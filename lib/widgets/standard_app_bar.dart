import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StandardAppBar extends StatelessWidget implements PreferredSize {
  const StandardAppBar({
    super.key,
    required this.elevation,
    this.background,
    this.title,
    this.actions,
  });

  final Color? background;
  final double elevation;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      elevation: elevation,
      title: Center(child: Text(('home-page.app_bar_title'.tr()))),
      titleTextStyle: const TextStyle(fontSize: 16),
      centerTitle: false,
      actions: [if (actions != null) ...actions!],
    );
  }

  @override
  Widget get child => const SizedBox.shrink();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
