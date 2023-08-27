import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

class TabItemWidget extends StatelessWidget {
  TabItemWidget({required this.title, this.countNotification});

  final String title;
  final int? countNotification;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.zero,
        width: 120,
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey, width: 0.5))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              if (countNotification != null) SpacingAlias.SizeWidth8,
              if (countNotification != null)
                badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                      shape: badges.BadgeShape.square,
                      badgeColor: AppColors.badgeNotification,
                      elevation: 0),
                  badgeContent: Text("$countNotification",
                      style: TextStyle(color: AppColors.white, fontSize: 10)),
                  position: badges.BadgePosition.topStart(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
