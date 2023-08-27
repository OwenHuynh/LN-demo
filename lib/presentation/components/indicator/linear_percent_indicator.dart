import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/domain/entities/trend/trend.dart';
import 'package:lnsp/presentation/components/input/text_form_label.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomLinearPercentIndicator extends StatelessWidget {
  const CustomLinearPercentIndicator({Key? key, required this.item})
      : super(key: key);

  final TrendItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelCustom(
                label: '${item.dayLeft.toString()} days left',
                fontSize: FontAlias.fontAlias11,
                color: AppColors.yellow,
                padding: EdgeInsets.all(0),
                fontWeight: FontWeight.w600),
            LabelCustom(
              label: item.quantity,
              fontSize: FontAlias.fontAlias11,
              color: AppColors.yellow,
              fontWeight: FontWeight.w600,
              padding: EdgeInsets.all(0),
            )
          ],
        ),
        SpacingAlias.SizeHeight4,
        Container(
          height: 10,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: AppColors.primary),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: LinearPercentIndicator(
            padding: EdgeInsets.all(0),
            percent: item.percent > 100 ? 1 : item.percent / 100,
            barRadius: Radius.circular(8),
            backgroundColor: AppColors.white,
            lineHeight: 8,
            progressColor: AppColors.yellow,
          ),
        ),
        SpacingAlias.SizeHeight6,
        LabelCustom(
            label: '${item.percent.toString()}%',
            fontSize: FontAlias.fontAlias11,
            color: AppColors.yellow,
            fontWeight: FontWeight.w600)
      ],
    );
  }
}
