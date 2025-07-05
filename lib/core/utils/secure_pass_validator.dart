import '../../core/localization/i18n/translations.g.dart';

String? validateSecurePassword(String? password) {
  if (password == null || password.isEmpty) {
    return t.enterPass;
  }

  // Check minimum length
  if (password.length < 8) {
    return t.passCharLimit;
  }

  // Check for uppercase letters
  if (!password.contains(RegExp(r'[A-Z]'))) {
    return t.passUppercaseLimit;
  }

  // Check for lowercase letters
  if (!password.contains(RegExp(r'[a-z]'))) {
    return t.passLowercaseLimit;
  }

  // Check for numbers
  if (!password.contains(RegExp(r'[0-9]'))) {
    return t.passNumberLimit;
  }

  // Check for special characters
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return t.passSpecialCharLimit;
  }

  // All checks passed
  return null;
}
