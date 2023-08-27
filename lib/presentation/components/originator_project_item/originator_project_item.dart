import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/theme/styles.dart';

class OriginatorProjectItem extends StatelessWidget {
  const OriginatorProjectItem({
    required this.title,
    required this.imageUrl,
    required this.dayLeftCount,
    required this.currency,
    required this.value,
    required this.max,
  });

  final String title;
  final int dayLeftCount;
  final double currency;
  final String imageUrl;
  final int value;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              height: 106,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            imageUrl: imageUrl,
          ),
          SpacingAlias.SizeHeight4,
          Text(
            title,
            style: Theme.of(context).textTheme.text10.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          SpacingAlias.SizeHeight6,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${dayLeftCount} ${LocaleKeys.dayLeftLabel.tr()}",
                style: Theme.of(context).textTheme.text10.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.yellow,
                    ),
              ),
              Text(
                "${currency}${LocaleKeys.currencyEthUnitLabel.tr()}",
                style: Theme.of(context).textTheme.text10.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.yellow,
                    ),
              ),
            ],
          ),
          SpacingAlias.SizeHeight6,
          Container(
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: AppColors.greyDescription,
                width: 1,
              ),
            ),
            child: LinearProgressIndicator(
              value: value / max,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.yellow,
              ),
              backgroundColor: AppColors.white,
            ),
          ),
          SpacingAlias.SizeHeight6,
          Text(
            "${value}${LocaleKeys.percentageLabel.tr()}",
            style: Theme.of(context).textTheme.text10.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.yellow,
                ),
          ),
        ],
      ),
    );
  }
}
