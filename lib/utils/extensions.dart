import 'package:flutter/services.dart';

extension StringMethods on String {
  bool isEmailValid() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool isOnlyText() {
    return RegExp(
      r'^[a-zA-Z\s-]+$',
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(this);
  }

  bool isNumberOnly() {
    return RegExp(
      r'^-?\d*\.?\d+$',
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(this);
  }

  bool containLowercaseLetters() {
    return RegExp(r'[a-z]', caseSensitive: true, multiLine: false)
        .hasMatch(this);
  }
}

extension FormValidation on String? {
  String? emailValidator() {
    if (this != null) {
      if (this!.isEmailValid() && this!.isNotEmpty) {
        return null;
      } else if (this!.isEmpty) {
        return ' Please enter email';
      } else {
        return 'Please enter valid email';
      }
    } else {
      return 'Please enter email';
    }
  }
}

class UpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    newValue = newValue.copyWith(text: newValue.text.toLowerCase());
    return newValue;
  }
}
