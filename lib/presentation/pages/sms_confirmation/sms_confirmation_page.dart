import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/components.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/view_models/sms_confirmation/sms_confirmation_provider.dart';

class SMSConfirmationPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(smsConfirmationProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.blueBg,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - SpacingAlias.Spacing32,
          child: Padding(
            padding: const EdgeInsets.all(SpacingAlias.Spacing32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: LabelCustom(
                    label: LocaleKeys.confirmSmsText.tr(),
                    color: AppColors.yellow,
                    fontSize: FontAlias.fontAlias20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SpacingAlias.SizeHeight80,
                LabelCustom(
                  label: LocaleKeys.smsVerificationNumber.tr(),
                  color: AppColors.yellow,
                  fontSize: FontAlias.fontAlias15,
                  fontWeight: FontWeight.w400,
                ),
                TextFormFieldCustom(
                  fillColor: AppColors.grey4,
                  borderRadius: 8,
                  borderColor: AppColors.yellow,
                  filled: true,
                ),
                SpacingAlias.SizeHeight32,
                Center(
                  child: LabelCustom(
                    label: LocaleKeys.resend.tr(),
                    color: AppColors.yellow,
                    fontSize: FontAlias.fontAlias15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SpacingAlias.SizeHeight100,
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
                      onPressed: viewModel.submitAction),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
