import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

class AppStyles {
  static final paddingContainer = EdgeInsets.only(
      left: SpacingAlias.Spacing16,
      right: SpacingAlias.Spacing16,
      bottom: SpacingAlias.Spacing16);

  static final paddingButtonFooter = EdgeInsets.only(
      top: SpacingAlias.Spacing12,
      left: SpacingAlias.Spacing16,
      right: SpacingAlias.Spacing16,
      bottom: SpacingAlias.Spacing16);

  static final titlePaddingSm = EdgeInsets.only(
      top: SpacingAlias.Spacing16, left: SpacingAlias.Spacing10);

  static final titlePaddingLg = EdgeInsets.only(
      top: SpacingAlias.Spacing16, left: SpacingAlias.Spacing20);

  static final titlePadding0 =
      EdgeInsets.only(top: SpacingAlias.Spacing16, left: SpacingAlias.Spacing0);

  static final contentPaddingSm = EdgeInsets.only(
      top: 8, left: SpacingAlias.Spacing24, right: SpacingAlias.Spacing24);

  static final contentPaddingLg = EdgeInsets.only(
      top: 28, left: SpacingAlias.Spacing24, right: SpacingAlias.Spacing24);

  static final warningPaddingSm = EdgeInsets.only(
      top: 6, left: SpacingAlias.Spacing24, right: SpacingAlias.Spacing24);

  static final warningPaddingLg = EdgeInsets.only(
      top: 28, left: SpacingAlias.Spacing24, right: SpacingAlias.Spacing24);
}

extension CustomStyles on TextTheme {
  TextStyle get buttonWhite => Typography.material2018()
      .englishLike
      .button!
      .copyWith(color: AppColors.white, letterSpacing: 1);

  TextStyle get buttonPrimary => Typography.material2018()
      .englishLike
      .button!
      .copyWith(color: AppColors.primary, letterSpacing: 1);

  TextStyle get subtitle3 => Typography.material2018()
      .englishLike
      .subtitle2!
      .copyWith(fontSize: FontAlias.fontAlias14, fontWeight: FontWeight.w300);

  TextStyle get title =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: FontAlias.fontAlias18,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.bold,
          );

  TextStyle get text8 =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: FontAlias.fontAlias8,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.w500,
          );

  TextStyle get text10 =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: FontAlias.fontAlias10,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.w500,
          );

  TextStyle get text12 =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: FontAlias.fontAlias12,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.w500,
          );

  TextStyle get text14 =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: FontAlias.fontAlias14,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.w500,
          );

  TextStyle get text16 =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: FontAlias.fontAlias16,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.w500,
          );

  TextStyle get text18 =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: FontAlias.fontAlias18,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.w500,
          );

  TextStyle get text20 =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: 20,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.w500,
          );

  TextStyle get text24 =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: 24,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.w500,
          );

  TextStyle get text32 =>
      Typography.material2018().englishLike.subtitle2!.copyWith(
            fontSize: 32,
            color: AppColors.colorTextBase,
            fontWeight: FontWeight.w500,
          );
}
