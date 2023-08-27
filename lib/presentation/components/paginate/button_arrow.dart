import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';

class PaginateButtonArrowStyles {
  PaginateButtonArrowStyles(
      {this.fontSize,
      this.backgroundColor,
      this.activeBackgroundColor,
      this.paginateButtonBorderRadius,
      this.textStyle,
      this.activeTextStyle});

  final double? fontSize;
  final BorderRadius? paginateButtonBorderRadius;
  final Color? backgroundColor;
  final Color? activeBackgroundColor;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;

  double get getFontSize {
    return fontSize ?? 14.0;
  }

  Color get getBackgroundColor {
    return backgroundColor ?? Colors.white;
  }

  Color get getActiveBackgroundColor {
    return activeBackgroundColor ?? Colors.white;
  }

  TextStyle get getTextStyle {
    return textStyle ??
        const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        );
  }

  TextStyle get getActiveTextStyle {
    return activeTextStyle ??
        const TextStyle(
          color: AppColors.badgeNotification,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        );
  }

  BorderRadius get getPaginateButtonBorderRadius {
    return paginateButtonBorderRadius ?? BorderRadius.circular(0);
  }
}

class PaginateSkipButton extends PaginateButtonArrowStyles {
  PaginateSkipButton(
      {this.icon, this.borderRadius, this.buttonBackgroundColor});

  final Icon? icon;
  final BorderRadius? borderRadius;
  final Color? buttonBackgroundColor;

  BorderRadius get getBorderRadius {
    return borderRadius ?? BorderRadius.zero;
  }

  Color get getButtonBackgroundColor {
    return buttonBackgroundColor ?? Colors.white;
  }
}
