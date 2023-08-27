import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/home_component/trend_tab.dart';
import 'package:lnsp/presentation/pages/home/tabs/mock_data_trend.dart';

class BodyTabHome extends StatelessWidget {
  const BodyTabHome({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return TrendTab(lists: listTrends);
      default:
        return Center(
          child: Text(LocaleKeys.pleaseAddContent.tr()),
        );
    }
  }
}
