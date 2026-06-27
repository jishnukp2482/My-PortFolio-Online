import 'package:flutter/services.dart';

class NoSpecialCharactersWithNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final allowedCharacters = RegExp(r'^[a-zA-Z0-9 ]*$');

    if (allowedCharacters.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
