import 'package:clario_auth_test_app/utils/all.dart';

class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    if (!value.isValidEmail()) {
      return '';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    if (!value.isValidPasswordLength() ||
        !value.hasLowercaseAndUppercase() ||
        !value.hasDigit()) {
      return '';
    }

    return null;
  }
}
