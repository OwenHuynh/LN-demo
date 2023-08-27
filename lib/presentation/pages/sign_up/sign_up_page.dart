import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/checkbox/checkbox_custom.dart';
import 'package:lnsp/presentation/components/components.dart';
import 'package:lnsp/presentation/components/input/text_form_field_with_title.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/view_models/sign_up/sign_up_provider.dart';

class SignUpPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpViewModel = ref.read(signUpProvider.notifier);
    final signUpState = ref.watch(signUpProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(SpacingAlias.Spacing16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingAlias.SizeHeight32,
                Center(
                  child: LabelCustom(
                    label: LocaleKeys.letUsKnowAboutYou.tr(),
                    color: AppColors.yellow,
                    fontWeight: FontWeight.w400,
                    fontSize: FontAlias.fontAlias20,
                  ),
                ),
                SpacingAlias.SizeHeight18,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextFormFieldCustomWithTitle(
                          title: LocaleKeys.surName.tr(),
                          textColor: AppColors.purple1,
                          fontWeight: FontWeight.w600,
                          borderRadius: 8,
                          borderColor: AppColors.purple1,
                          borderWidth: 1),
                    ),
                    SpacingAlias.SizeWidth4,
                    Expanded(
                      child: TextFormFieldCustomWithTitle(
                          title: LocaleKeys.name.tr(),
                          textColor: AppColors.purple1,
                          fontWeight: FontWeight.w600,
                          borderRadius: 8,
                          borderColor: AppColors.purple1,
                          borderWidth: 1),
                    ),
                  ],
                ),
                SpacingAlias.SizeHeight20,
                TextFormFieldCustomWithTitle(
                    title: LocaleKeys.notationName.tr(),
                    textColor: AppColors.purple1,
                    fontWeight: FontWeight.w600,
                    borderRadius: 8,
                    borderColor: AppColors.purple1,
                    borderWidth: 1),
                SpacingAlias.SizeHeight20,
                TextFormFieldCustomWithTitle(
                    textColor: AppColors.purple1,
                    title: LocaleKeys.mailAddress.tr(),
                    fontWeight: FontWeight.w600,
                    borderRadius: 8,
                    showToolTip: true,
                    borderColor: AppColors.purple1,
                    borderWidth: 1),
                SpacingAlias.SizeHeight20,
                TextFormFieldCustomWithTitle(
                    title: LocaleKeys.walletAddress.tr(),
                    textColor: AppColors.purple1,
                    fontWeight: FontWeight.w600,
                    borderRadius: 8,
                    showToolTip: true,
                    borderColor: AppColors.purple1,
                    borderWidth: 1),
                SpacingAlias.SizeHeight20,
                TextFormFieldCustomWithTitle(
                    title: LocaleKeys.telephoneNumber.tr(),
                    textColor: AppColors.purple1,
                    fontWeight: FontWeight.w600,
                    borderRadius: 8,
                    showToolTip: true,
                    textToolTip: LocaleKeys.smsAuthentication.tr(),
                    borderColor: AppColors.purple1,
                    borderWidth: 1),
                SpacingAlias.SizeHeight20,
                TextFormFieldCustomWithTitle(
                    title: LocaleKeys.passwordLabel.tr(),
                    textColor: AppColors.purple1,
                    fontWeight: FontWeight.w600,
                    borderRadius: 8,
                    borderColor: AppColors.purple1,
                    borderWidth: 1),
                SpacingAlias.SizeHeight20,
                TextFormFieldCustomWithTitle(
                    title: LocaleKeys.reEnterPassword.tr(),
                    textColor: AppColors.purple1,
                    fontWeight: FontWeight.w600,
                    borderRadius: 8,
                    borderColor: AppColors.purple1,
                    borderWidth: 1),
                SpacingAlias.SizeHeight20,
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: CheckBoxCustom(
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.yellow,
                    checkColor: AppColors.white,
                    fontSize: FontAlias.fontAlias15,
                    textColor: AppColors.grey2,
                    inActiveColor: AppColors.yellow,
                    fontWeight: FontWeight.w600,
                    label: LocaleKeys.termsOfUse.tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: CheckBoxCustom(
                    value: false,
                    activeColor: AppColors.yellow,
                    fontSize: FontAlias.fontAlias15,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.grey2,
                    inActiveColor: AppColors.yellow,
                    checkColor: AppColors.white,
                    onChanged: (value) {},
                    label: LocaleKeys.privacyPolicy.tr(),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing8),
                  child: FlatButtonComponent(
                      title: LocaleKeys.submit.tr(),
                      fontSize: FontAlias.fontAlias15,
                      color: AppColors.yellow,
                      borderRadius: 15,
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w600,
                      elevation: 3,
                      padding: EdgeInsets.symmetric(
                          vertical: SpacingAlias.Spacing16),
                      onPressed: signUpViewModel.signUpAction),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
