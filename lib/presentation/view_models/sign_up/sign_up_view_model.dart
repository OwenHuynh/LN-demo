import 'package:easy_localization/easy_localization.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/navigation/app_router.gr.dart';
import 'package:lnsp/presentation/navigation/navigation_handler.dart';
import 'package:lnsp/presentation/view_models/base/base_view_model.dart';
import 'package:lnsp/presentation/view_models/login/login_state.dart';
import 'package:lnsp/presentation/view_models/sign_up/sign_up_state.dart';
import 'package:lnsp/presentation/view_models/sign_up/sign_up_validate.dart';

class SignUpViewModel extends BaseViewModel<SignUpState> {
  SignUpViewModel({required this.navigationHandler}) : super(SignUpState());

  final NavigationHandler navigationHandler;

  @override
  void onInit() {}

  void onEmailChange(String email) {
    setState((state) => state.copyWith(email: email));
  }

  void onPasswordChange(String password) {
    setState((state) => state.copyWith(password: password));
  }

  void onNameChange(String name) {
    setState((state) => state.copyWith(name: name));
  }

  void onPhoneNumberChange(String phoneNumber) {
    setState((state) => state.copyWith(phoneNumber: phoneNumber));
  }

  void onSexSelect(String? sex) {
    setState((state) => state.copyWith(sex: sex));
  }

  void onDateSelect(String? date) {
    setState((state) => state.copyWith(date: date));
  }

  void onMonthSelect(String? month) {
    setState((state) => state.copyWith(month: month));
  }

  void onYearSelect(String? year) {
    setState((state) => state.copyWith(year: year));
  }

  Future<void> signUpAction() async {
    final emailValid =
        SignUpValidationResults.validateEmail(state.email).isValid;
    final passwordValid =
        SignUpValidationResults.validatePassword(state.password).isValid;

    final isFormValid = emailValid && passwordValid;

    setState((state) => state.copyWith(
        formStatus: isFormValid ? FormStatus.valid : FormStatus.invalid));

    if (isFormValid) {}

    await navigationHandler.push(route: SMSConfirmationPageRoute());
  }

  String? validateEmail(String? email) {
    final emailValid =
        SignUpValidationResults.validateEmail(email ?? "").isValid;
    if (!emailValid) {
      return LocaleKeys.emailInvalidError.tr();
    }
    return null;
  }

  String? validatePassword(String? password) {
    final passwordValid =
        SignUpValidationResults.validatePassword(password ?? "").isValid;
    if (!passwordValid) {
      return LocaleKeys.passwordInvalidError.tr();
    }
    return null;
  }

  String? validatePhoneNumber(String? phoneNumber) {
    final phoneNumberValid =
        SignUpValidationResults.validatePhoneNumber(phoneNumber ?? "").isValid;
    if (!phoneNumberValid) {
      return LocaleKeys.passwordInvalidError.tr();
    }
    return null;
  }
}
