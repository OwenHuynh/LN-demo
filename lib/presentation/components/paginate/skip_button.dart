import 'package:flutter/material.dart';
import 'package:lnsp/presentation/components/paginate/button_arrow.dart';
import 'package:lnsp/presentation/theme/colors.dart';

enum SkipButtonType { prev, next }

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
    required this.buttonStyles,
    required this.height,
    required this.skipButtonType,
    required this.onTap,
    this.radius = 20,
  }) : super(key: key);

  final PaginateSkipButton buttonStyles;
  final double height;
  final SkipButtonType skipButtonType;
  final VoidCallback onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      height: height,
      child: ClipRRect(
        borderRadius: buttonStyles.getBorderRadius,
        child: Material(
          color: buttonStyles.getButtonBackgroundColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.grey, width: 1),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: skipButtonType == SkipButtonType.prev
                  ? buttonStyles.icon ??
                      const Icon(
                        Icons.chevron_left,
                        color: Colors.grey,
                        size: 28,
                      )
                  : buttonStyles.icon ??
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                        size: 28,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
