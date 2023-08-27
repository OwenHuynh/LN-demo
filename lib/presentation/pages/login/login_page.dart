import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/components.dart';
import 'package:lnsp/presentation/components/input/gradient_text.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/view_models/login/login_provider.dart';
import 'package:lnsp/utils/validation/validate_util.dart';

class LoginPage extends HookConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    final enableButton = useMemoized(
        () =>
            !ValidateUtil.isNullOrEmpty(state.email) ||
            !ValidateUtil.isNullOrEmpty(state.password),
        [state.email, state.password]);

    return Scaffold(
      backgroundColor: AppColors.blueBg,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - SpacingAlias.Spacing32,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SpacingAlias.Spacing32,
                horizontal: SpacingAlias.Spacing24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SpacingAlias.SizeHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: LabelCustom(
                        label: LocaleKeys.language.tr(),
                        color: AppColors.yellow,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Spacer(),
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
                SpacingAlias.SizeHeight40,
                LabelCustom(
                  label: LocaleKeys.findOut.tr(),
                  color: AppColors.white,
                  fontSize: FontAlias.fontAlias20,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.05,
                ),
                SpacingAlias.SizeHeight16,
                LabelCustom(
                  label: LocaleKeys.crownFunding.tr(),
                  color: AppColors.white,
                  fontSize: FontAlias.fontAlias14,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.035,
                ),
                SpacingAlias.SizeHeight20,
                GestureDetector(
                  onTap: viewModel.goToSignUpPage,
                  child: LabelCustom(
                    label: LocaleKeys.createNewAccount.tr(),
                    fontWeight: FontWeight.w600,
                    color: AppColors.yellow,
                    fontSize: FontAlias.fontAlias14,
                  ),
                ),
                SpacingAlias.SizeHeight12,
                TextFormFieldCustom(
                  controller: emailController,
                  onChanged: viewModel.onEmailChange,
                  hintText: LocaleKeys.openAddress.tr(),
                  textAlign: TextAlign.center,
                  fillColor: AppColors.grey4,
                  borderRadius: 7,
                  hintStyle: TextStyle(
                    color: AppColors.purple1,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.05,
                    fontSize: FontAlias.fontAlias14,
                  ),
                  filled: true,
                ),
                SpacingAlias.SizeHeight16,
                TextFormFieldCustom(
                  controller: passwordController,
                  onChanged: viewModel.onPasswordChange,
                  hintText: LocaleKeys.password.tr(),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  fillColor: AppColors.grey4,
                  borderRadius: 7,
                  hintStyle: TextStyle(
                    color: AppColors.purple1,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.05,
                    fontSize: FontAlias.fontAlias14,
                  ),
                  filled: true,
                ),
                SpacingAlias.SizeHeight16,
                FlatButtonComponent(
                  enabled: enableButton,
                  title: LocaleKeys.signIn.tr(),
                  onPressed: () async {
                    final isLoginSuccess = await viewModel.loginAction();
                    if (isLoginSuccess) {
                      emailController.clear();
                      passwordController.clear();
                      viewModel.gotoHome();
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: AppColors.yellow3,
                  textColor: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: FontAlias.fontAlias14,
                  borderRadius: 15,
                ),
                SpacingAlias.SizeHeight32,
                FlatButtonComponent(
                  enabled: true,
                  title: LocaleKeys.signInWithGoogle,
                  fontWeight: FontWeight.bold,
                  fontSize: FontAlias.fontAlias18,
                  onPressed: () async {
                    await viewModel.loginWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
