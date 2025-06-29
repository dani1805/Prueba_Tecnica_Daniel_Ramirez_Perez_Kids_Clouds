import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/helpers/colors.dart';

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
      title: Text(
        ('home-page.app_bar_title'.tr()),
        style: GoogleFonts.openSans(fontSize: 15, color: Mcolor.blue),
      ),
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
