import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/theme/styles.dart';

class IconText extends StatelessWidget {
  IconText({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.value,
    this.isActive = false,
  });

  final Icon activeIcon;
  final Icon inactiveIcon;
  final bool isActive;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isActive ? activeIcon : inactiveIcon,
        SpacingAlias.SizeHeight6,
        Text(
          "$value",
          style: Theme.of(context).textTheme.text14.copyWith(
                color: AppColors.colorTextBase,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
