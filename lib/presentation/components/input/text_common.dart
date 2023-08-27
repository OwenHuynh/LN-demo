import 'package:flutter/material.dart';
import 'package:lnsp/gen/fonts.gen.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';

class TextCommon extends StatelessWidget {
  const TextCommon({
    Key? key,
    required this.text,
    this.color = AppColors.colorTextBase,
    this.fontSize = FontAlias.fontAlias16,
    this.fontWeight = FontWeight.w600,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: FontFamily.sFProTextRegular,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
