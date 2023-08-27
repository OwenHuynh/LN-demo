import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lnsp/data/remotes/google_sign_in.dart';
import 'package:lnsp/data/locals/app_preferences/app_preferences.dart';
import 'package:lnsp/domain/entities/user/user_detail.dart';
import 'package:lnsp/domain/repositories/login_repository.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/navigation/app_router.gr.dart';
import 'package:lnsp/presentation/navigation/navigation_handler.dart';
import 'package:lnsp/presentation/view_models/base/base_view_model.dart';
import 'package:lnsp/presentation/view_models/login/login_state.dart';
import 'package:lnsp/presentation/view_models/login/login_validate.dart';
import 'package:lnsp/utils/ui_util.dart';

class LoginViewModel extends BaseViewModel<LoginState> {
  LoginViewModel(
      {required this.navigationHandler, required this.loginRepository})
      : super(LoginState());

  final NavigationHandler navigationHandler;
  final LoginRepository loginRepository;

  @override
  Future<void> onInit() async {}

  void onEmailChange(String email) {
    setState((state) => state.copyWith(email: email));
  }

  void onPasswordChange(String password) {
    setState((state) => state.copyWith(password: password));
  }

  String getErrorMessage() {
    switch (state.formStatus) {
      case FormStatus.initial:
        return LocaleKeys.empty.tr();
      case FormStatus.invalid:
        return LocaleKeys.loginErrorLabel.tr();
      case FormStatus.valid:
        return LocaleKeys.empty.tr();
    }
  }

  Future<bool> loginAction() async {
    final isFormValid = isEmailValid() && isPasswordValid();
    setState((state) => state.copyWith(
        formStatus: isFormValid ? FormStatus.valid : FormStatus.invalid));
    if (isFormValid) {
      bool isLoading = true;
      if (isLoading) {
        await EasyLoading.show(
          maskType: EasyLoadingMaskType.black,
        );
      }
      final response = await loginRepository.login(
        state.email,
        state.password,
      );

      final result = await response.when(success: (data) async {
        final loginAccount = UserDetail.fromJson(
            data.data?[LoginRepository.loginOperationName] ?? {});
        await AppPreferences.setProfileData(loginAccount);
      }, error: (errorMessage) async {
        UIUtil.showError(errorMessage.toString());
        print(errorMessage);
        await EasyLoading.dismiss();
        return false;
      });
      isLoading = false;
      if (!isLoading) {
        await EasyLoading.dismiss();
      }
      return result ?? false;
    }
    return false;
  }

  void goToSignUpPage() {
    navigationHandler.push(route: SignUpPageRoute());
  }

  void gotoHome() {
    navigationHandler.push(route: InitPageRoute());
  }

  void forgotPasswordAction() {}

  bool isEmailValid() {
    return LoginValidationResults.validateEmail(state.email).isValid;
  }

  bool isPasswordValid() {
    return LoginValidationResults.validatePassword(state.password).isValid;
  }

  Future<void> loginWithGoogle() async {
    await EasyLoading.show();
    final googleSignInstance = await GoogleSignInFirebase.getInstance();
    final bool isLogin = await googleSignInstance!.signInGoogle();
    if (isLogin) {
      await EasyLoading.dismiss();
      await navigationHandler.push(route: InitPageRoute());
    }
  }
}
