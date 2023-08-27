import 'package:easy_localization/easy_localization.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/utils/validation/validate_util.dart';
import 'package:lnsp/utils/validation/validation_result.dart';

class ProfileValidationResults {
  static ValidationResult validateEmail(String email) {
    if (ValidateUtil.isNullEmptyOrWhitespace(email)) {
      return ValidationResult.error(LocaleKeys.errEmptyField.tr());
    } else if (!ValidateUtil.validateEmail(email)) {
      return ValidationResult.error(LocaleKeys.errEmailAddress.tr());
    }
    return ValidationResult.ok();
  }

  static ValidationResult validatePassword(String password) {
    if (ValidateUtil.isNullEmptyOrWhitespace(password)) {
      return ValidationResult.error(LocaleKeys.errEmptyField.tr());
    }
    if (password.length < 8) {
      return ValidationResult.error(LocaleKeys.errPasswordTooShort.tr());
    }
    return ValidationResult.ok();
  }

  static ValidationResult validateConfirmPassword(
    String newPassword,
    String confirmPassword,
  ) {
    if (ValidateUtil.isNullEmptyOrWhitespace(confirmPassword)) {
      return ValidationResult.error(LocaleKeys.errEmptyField.tr());
    }
    if (confirmPassword.length < 8) {
      return ValidationResult.error(LocaleKeys.errPasswordTooShort.tr());
    }
    if (confirmPassword != newPassword) {
      return ValidationResult.error(LocaleKeys.errConfirmPasswordNotMatch.tr());
    }
    return ValidationResult.ok();
  }

  static ValidationResult validateUrl(String value) {
    if (ValidateUtil.isNullEmptyOrWhitespace(value)) {
      return ValidationResult.error(LocaleKeys.errEmptyField.tr());
    } else if (!ValidateUtil.isUrl(value)) {
      return ValidationResult.error(LocaleKeys.errNotUrl.tr());
    }
    return ValidationResult.ok();
  }

  static ValidationResult validatePhone(String value) {
    if (ValidateUtil.isNullEmptyOrWhitespace(value)) {
      return ValidationResult.error(LocaleKeys.errEmptyField.tr());
    } else if (!ValidateUtil.validatePhone(value)) {
      return ValidationResult.error(LocaleKeys.errNotPhoneNumber.tr());
    }
    return ValidationResult.ok();
  }

  static ValidationResult validateCode(String value) {
    if (ValidateUtil.isNullEmptyOrWhitespace(value)) {
      return ValidationResult.error(LocaleKeys.errEmptyField.tr());
    }
    if (value.length != 6) {
      return ValidationResult.error(LocaleKeys.errNotCode6.tr());
    }
    return ValidationResult.ok();
  }

  static ValidationResult validateText(String value) {
    if (ValidateUtil.isNullEmptyOrWhitespace(value)) {
      return ValidationResult.error(LocaleKeys.errEmptyField.tr());
    }
    return ValidationResult.ok();
  }
}
