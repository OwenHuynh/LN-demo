import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/theme/styles.dart';

enum AssistStatus {
  Succeed,
  Closed,
  None,
}

const double kSizeIcon = 20;

class TextStatus extends StatelessWidget {
  TextStatus({
    required this.assistStatus,
  });

  final AssistStatus assistStatus;

  @override
  Widget build(BuildContext context) {
    return assistStatus != AssistStatus.None
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: kSizeIcon,
                height: kSizeIcon,
                decoration: BoxDecoration(
                    color: AppColors.bgLine,
                    borderRadius: BorderRadius.circular(kSizeIcon)),
                child: Icon(
                  Icons.done_rounded,
                  color: AppColors.white,
                  size: kSizeIcon,
                ),
              ),
              SpacingAlias.SizeWidth4,
              Text(
                LocaleKeys.succeedLabel.tr(),
                style: Theme.of(context).textTheme.text14.copyWith(
                      color: AppColors.bgLine,
                    ),
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
