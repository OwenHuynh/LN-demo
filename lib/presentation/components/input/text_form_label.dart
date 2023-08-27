import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/gen/fonts.gen.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/input/readmore.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

class LabelCustom extends StatelessWidget {
  const LabelCustom({
    Key? key,
    this.label = "",
    this.fontWeight,
    this.fontSize = FontAlias.fontAlias12,
    this.color,
    this.maxLines,
    this.textOverflow,
    this.isReadMore = false,
    this.padding,
    this.letterSpacing,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final String label;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color? color;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final bool isReadMore;
  final EdgeInsets? padding;
  final double? letterSpacing;
  final TextAlign textAlign;

  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: SpacingAlias.Spacing8),
      child: isReadMore
          ? ReadMoreText(
              label,
              style: TextStyle(
                fontFamily: FontFamily.sFProTextRegular,
                color: color ?? AppColors.colorTextBase,
                fontSize: fontSize,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
              trimLines: maxLines ?? 3,
              colorClickableText: AppColors.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: LocaleKeys.showMoreLabel.tr(),
              trimExpandedText: LocaleKeys.showLessLabel.tr(),
              moreStyle: TextStyle(
                  fontFamily: FontFamily.sFProTextRegular,
                  color: AppColors.primary,
                  letterSpacing: letterSpacing,
                  fontSize: fontSize,
                  fontWeight: fontWeight ?? FontWeight.w600),
            )
          : Text(
              label,
              maxLines: maxLines,
              overflow: textOverflow,
              textAlign: textAlign,
              style: TextStyle(
                fontFamily: FontFamily.sFProTextRegular,
                color: color ?? AppColors.colorTextBase,
                fontSize: fontSize,
                letterSpacing: letterSpacing,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
            ),
    );
  }
}
