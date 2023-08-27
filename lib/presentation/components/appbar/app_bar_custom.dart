import 'package:flutter/material.dart';
import 'package:lnsp/gen/fonts.gen.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom(
      {this.title = "",
      this.customTitle,
      this.centerTitle = true,
      this.heightBar = kToolbarHeight,
      this.child,
      this.backgroundColor = AppColors.primary});

  final String title;
  final Widget? customTitle;
  final Color? backgroundColor;
  final bool centerTitle;
  final double heightBar;

  final Widget? child;

  @override
  Size get preferredSize => Size.fromHeight(heightBar);

  Widget build(BuildContext context) {
    return child != null
        ? PreferredSize(
            preferredSize: Size.fromHeight(heightBar),
            child: Container(
              color: backgroundColor,
              child: child,
            ))
        : AppBar(
            title: customTitle ??
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: FontFamily.sFProTextRegular,
                    color: AppColors.white,
                    fontSize: FontAlias.fontAlias16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            backgroundColor: backgroundColor,
            centerTitle: centerTitle,
          );
  }
}
