import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/styles.dart';

class CircularText extends StatelessWidget {
  CircularText({
    required this.size,
    required this.text,
  });

  final double size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        color: Colors.orange,
        borderRadius: new BorderRadius.all(
          Radius.circular(size / 2),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.text10.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
