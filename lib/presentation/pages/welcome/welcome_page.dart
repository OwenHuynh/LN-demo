import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/buttons/flat_button_component.dart';
import 'package:lnsp/presentation/components/input/gradient_text.dart';
import 'package:lnsp/presentation/components/input/text_form_label.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

class WelcomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: AppColors.blueBg,
        body: Padding(
          padding: EdgeInsets.all(SpacingAlias.Spacing32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LabelCustom(
                label: LocaleKeys.welcome.tr(),
                color: AppColors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
              SpacingAlias.SizeHeight80,
              LabelCustom(
                label: LocaleKeys.lumireNoteLabel.tr(),
                color: AppColors.white,
                textAlign: TextAlign.center,
                fontSize: FontAlias.fontAlias13,
                fontWeight: FontWeight.w400,
              ),
              SpacingAlias.SizeHeight40,
              Image.asset(
                'assets/images/icon_app.png',
                fit: BoxFit.cover,
              ),
              SpacingAlias.SizeHeight12,
              GradientText(
                LocaleKeys.lumiereNote.tr(),
                gradient: RadialGradient(colors: [
                  AppColors.white,
                  AppColors.yellow1,
                  AppColors.yellow2
                ]),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.5,
                  fontSize: 30,
                ),
              ),
              SpacingAlias.SizeHeight12,
              LabelCustom(
                label: LocaleKeys.lampNotebook.tr(),
                color: AppColors.white,
                textAlign: TextAlign.center,
                fontSize: FontAlias.fontAlias13,
                fontWeight: FontWeight.w400,
              ),
              SpacingAlias.SizeHeight80,
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing8),
                child: FlatButtonComponent(
                    title: LocaleKeys.goToProject.tr(),
                    fontSize: FontAlias.fontAlias15,
                    color: AppColors.yellow,
                    borderRadius: 15,
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w600,
                    elevation: 3,
                    padding:
                        EdgeInsets.symmetric(vertical: SpacingAlias.Spacing16),
                    onPressed: () {}),
              )
            ],
          ),
        ));
  }
}
