import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/input/text_common.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/view_models/home/home_provider.dart';

List<String> _tabBarHomeTitle = [
  LocaleKeys.trend.tr(),
  LocaleKeys.newText.tr(),
  LocaleKeys.feature.tr(),
  LocaleKeys.favorite.tr(),
];

class TabBarMain extends StatelessWidget {
  const TabBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 8, left: 10, right: 10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _tabBarHomeTitle.length,
            (index) => _tabItem(
              _tabBarHomeTitle[index],
              index,
            ),
          ),
        ),
      ),
    );
  }

  static Consumer _tabItem(
    String label,
    int index,
  ) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(homeProvider);
      final viewModel = ref.read(homeProvider.notifier);
      final bool isActive = index == state.tabBarSelected;

      return GestureDetector(
        onTap: () {
          viewModel.setTabIndex(index);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  width: 2,
                  color: isActive ? AppColors.yellow : AppColors.transparent),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5)
              .copyWith(top: 10),
          child: TextCommon(
            text: label,
            fontSize: FontAlias.fontAlias14,
            fontWeight: FontWeight.w700,
            color: isActive ? AppColors.yellow : AppColors.white,
          ),
        ),
      );
    });
  }
}
