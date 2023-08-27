import 'package:flutter/material.dart';
import 'package:lnsp/domain/entities/trend/trend.dart';
import 'package:lnsp/presentation/components/components.dart';
import 'package:lnsp/presentation/components/indicator/linear_percent_indicator.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

class ItemTrend extends StatelessWidget {
  const ItemTrend({Key? key, required this.item}) : super(key: key);

  final TrendItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: Image.network(
                item.imageUrl,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SpacingAlias.SizeHeight4,
            Flexible(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      LabelCustom(
                        label: item.description,
                        fontSize: FontAlias.fontAlias11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        //aletterSpacing: 0.05,
                        maxLines: 5,
                      ),
                      Spacer(),
                      SizedBox(
                        height: 55,
                        child: CustomLinearPercentIndicator(item: item),
                      ),
                    ],
                  ),
                ))
          ]),
    );
  }
}
