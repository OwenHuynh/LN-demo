import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/domain/entities/trend/trend.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/components.dart';
import 'package:lnsp/presentation/components/home_component/item_trend.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

class TrendTab extends HookConsumerWidget {
  const TrendTab({required this.lists});

  final List<TrendItem> lists;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 24, 4, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelCustom(
            padding: EdgeInsets.only(left: SpacingAlias.Spacing8),
            label: LocaleKeys.trendOfThisWeek.tr(),
            color: AppColors.blueBg,
            fontSize: FontAlias.fontAlias15,
            fontWeight: FontWeight.w600,
          ),
          SpacingAlias.SizeHeight4,
          Expanded(
            child: GridView.builder(
                itemCount: lists.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    mainAxisExtent: 260,
                    childAspectRatio: (MediaQuery.of(context).size.width / 3) /
                        (MediaQuery.of(context).size.height / 5.6)),
                itemBuilder: (context, index) {
                  return ItemTrend(item: lists[index]);
                }),
          )
        ],
      ),
    );
  }
}
