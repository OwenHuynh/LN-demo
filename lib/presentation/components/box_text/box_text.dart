import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/styles.dart';

class BoxText extends StatelessWidget {
  const BoxText({
    required this.text,
    this.color,
    this.textStyle,
    this.radius = 8,
    this.padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final double radius;
  final EdgeInsets padding;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.backgroundBoxText,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      padding: padding,
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.text14,
      ),
    );
  }
}
