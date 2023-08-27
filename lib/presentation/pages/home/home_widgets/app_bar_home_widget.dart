import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarHomeWidget({
    required this.title,
    required this.shareCallBack,
    this.height = kToolbarHeight,
  });

  final String title;
  final double height;
  final VoidCallback shareCallBack;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 16,
        ),
        onPressed: () => {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.ios_share,
            size: 16,
          ),
          onPressed: () => shareCallBack,
        ),
      ],
      title: Text(title),
      backgroundColor: AppColors.blueBg,
      centerTitle: true,
      elevation: 0.5,
    );
  }
}
