import 'dart:ui';

import 'package:lnsp/data/locals/app_preferences/app_preferences.dart';
import 'package:lnsp/presentation/navigation/navigation_handler.dart';
import 'package:lnsp/presentation/view_models/base/base_view_model.dart';
import 'package:lnsp/presentation/view_models/profile/profile_state.dart';
import 'package:lnsp/presentation/view_models/profile/profile_validate.dart';

class ProfileViewModel extends BaseViewModel<ProfileState> {
  ProfileViewModel({required this.navigationHandler}) : super(ProfileState());

  final NavigationHandler navigationHandler;

  Future<Locale> getDefaultLocale() async {
    final nameLanguage = await AppPreferences().getLanguage();
    switch (nameLanguage) {
      case "en":
        {
          return Locale('en', 'US');
        }
      case "ja":
        {
          return Locale('ja', 'JP');
        }
      default:
        return Locale('en', 'US');
    }
  }

  @override
  Future<void> onInit() async {
    final defaultLocale = await getDefaultLocale();
    setState((state) => state.copyWith(language: defaultLocale));
  }

  Future<void> onChangeLanguage(Locale locale) async {
    await AppPreferences().setLanguage(locale.languageCode);
    setState((state) => state.copyWith(language: locale));
  }

  void onChangeSearchType(bool value) {
    setState((state) => state.copyWith(searchAllLanguage: value));
  }

  void onChangeNameCalled(String value) {
    setState((state) => state.copyWith(nameCalled: value));
  }

  void onInputNameCalled(String value) {
    final error = ProfileValidationResults.validateText(value).errorMessage;
    setState((state) => state.copyWith(nameCalledError: error));
  }

  void onChangeWalletAddress(String value) {
    setState((state) => state.copyWith(walletAddress: value));
  }

  void onInputWalletAddress(String value) {
    final error = ProfileValidationResults.validateText(value).errorMessage;
    setState((state) => state.copyWith(walletAddressError: error));
  }

  void onChangeEmailAddress(String value) {
    setState((state) => state.copyWith(emailAddress: value));
  }

  void onInputEmailAddress(String value) {
    final error = ProfileValidationResults.validateEmail(value).errorMessage;
    setState((state) => state.copyWith(emailError: error));
  }

  void onChangePassword(String value) {
    setState((state) => state.copyWith(password: value));
  }

  void onInputPassword(String value) {
    final error = ProfileValidationResults.validatePassword(value).errorMessage;
    setState((state) => state.copyWith(passwordError: error));
  }

  void onChangePhoneNumber(String SMSCode, String phoneNumber) {
    // TODO: add funtion compare SMS code
    setState((state) => state.copyWith(phoneNumber: phoneNumber));
  }

  void onInputPhoneNumber(String value) {
    final error = ProfileValidationResults.validatePhone(value).errorMessage;
    setState((state) => state.copyWith(phoneNumberError: error));
  }

  void onChangeTermUrl(String value) {
    setState((state) => state.copyWith(termUrl: value));
  }

  void onInputTermUrl(String value) {
    final error = ProfileValidationResults.validateUrl(value).errorMessage;
    setState((state) => state.copyWith(termUrlError: error));
  }

  void onChangePrivacyUrl(String value) {
    setState((state) => state.copyWith(privacyUrl: value));
  }

  void onInputPrivacyUrl(String value) {
    final error = ProfileValidationResults.validateUrl(value).errorMessage;
    setState((state) => state.copyWith(privacyUrlError: error));
  }

  void onChangeCommercialTransactionUrl(String value) {
    setState((state) => state.copyWith(commercialTransactionUrl: value));
  }

  void onInputCommercialTransactionUrl(String value) {
    final error = ProfileValidationResults.validateUrl(value).errorMessage;
    setState((state) => state.copyWith(commercialTransactionUrlError: error));
  }

  void onChangeContactUrl(String value) {
    setState((state) => state.copyWith(contactUrl: value));
  }

  void onInputContactUrl(String value) {
    final error = ProfileValidationResults.validateUrl(value).errorMessage;
    setState((state) => state.copyWith(contactUrlError: error));
  }

  void onResendSMSCode() {
    // TODO: add funtion
  }
}
