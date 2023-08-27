import 'package:flutter/material.dart';
import 'package:lnsp/presentation/components/components.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

class CheckBoxCustom extends StatelessWidget {
  const CheckBoxCustom(
      {Key? key,
      required this.value,
      required this.label,
      this.checkColor = AppColors.grey,
      this.activeColor = AppColors.grey,
      this.textColor = AppColors.grey,
      this.widthBorder,
      this.fontSize,
      this.fontWeight,
      required this.onChanged,
      this.inActiveColor = AppColors.grey})
      : super(key: key);

  final bool? value;
  final String label;
  final ValueChanged<bool?> onChanged;
  final Color checkColor;
  final Color activeColor;
  final double? widthBorder;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color textColor;
  final Color inActiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Theme(
            data: ThemeData(unselectedWidgetColor: inActiveColor),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                  activeColor: activeColor,
                  checkColor: checkColor,
                  value: value,
                  onChanged: onChanged),
            ),
          ),
        ),
        SpacingAlias.SizeWidth10,
        LabelCustom(
          label: label,
          fontSize: fontSize ?? 12,
          color: textColor,
          fontWeight: fontWeight,
          textOverflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
