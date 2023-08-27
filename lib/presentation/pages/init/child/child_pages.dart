import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/pages/notification/notification_page.dart';
import 'package:lnsp/presentation/pages/pages.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text(LocaleKeys.pleaseAddContent.tr()),
          ),
        ),
      );
}

List<Widget> buildInitScreen() => [
      HomePage(),
      SearchPage(),
      ShakeHandPage(),
      NotificationPage(),
      MyAccountPage(),
    ];

List<PersistentBottomNavBarItem> navBarsInitScreen(int index) => [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/svg/ic_home.svg",
          color: index == 0 ? AppColors.iconsSelected : Colors.white,
        ),
        title: LocaleKeys.homeTitle.tr(),
        activeColorPrimary: AppColors.iconsSelected,
        inactiveColorPrimary: AppColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/svg/ic_round-search.svg",
          color: index == 1 ? AppColors.iconsSelected : Colors.white,
        ),
        title: LocaleKeys.searchText.tr(),
        activeColorPrimary: AppColors.iconsSelected,
        inactiveColorPrimary: AppColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/svg/ic_handshake.svg",
          color: index == 2 ? AppColors.iconsSelected : Colors.white,
        ),
        title: LocaleKeys.handshakeText.tr(),
        activeColorPrimary: AppColors.iconsSelected,
        inactiveColorPrimary: AppColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/svg/ic_bell.svg",
          color: index == 3 ? AppColors.iconsSelected : Colors.white,
        ),
        title: LocaleKeys.notificationText.tr(),
        activeColorPrimary: AppColors.iconsSelected,
        inactiveColorPrimary: AppColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/svg/ic_account.svg",
          color: index == 4 ? AppColors.iconsSelected : Colors.white,
        ),
        title: LocaleKeys.myPageText.tr(),
        activeColorPrimary: AppColors.iconsSelected,
        inactiveColorPrimary: AppColors.white,
      ),
    ];

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget({
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: SpacingAlias.Spacing60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SpacingAlias.SizeHeight10,
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: SpacingAlias.Spacing24,
                  color: isSelected
                      ? (item.activeColorSecondary == null
                          ? item.activeColorPrimary
                          : item.activeColorSecondary)
                      : item.inactiveColorPrimary == null
                          ? item.activeColorPrimary
                          : item.inactiveColorPrimary),
              child: item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                item.title ?? "",
                style: TextStyle(
                    color: isSelected
                        ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                        : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: SpacingAlias.Spacing12),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Container(
        width: double.infinity,
        height: SpacingAlias.Spacing60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            final index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
