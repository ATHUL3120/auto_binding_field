


// ignore_for_file: constant_identifier_names

import 'package:auto_binding_field/util/extension.dart';
import 'package:flutter/services.dart';


class MobileInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.isNotEmpty&&newValue.text.length!=1&&newValue.text.substring(newValue.text.length-1,newValue.text.length).toParseInt()==null){
      return oldValue;
    }
    if (newValue.text.isNotEmpty &&
        (newValue.text.substring(0, 1) != '+' &&
            !newValue.text.startsWith(RegExp(r'\d')))) {
      return oldValue;
    } else if (newValue.text.length > 13) {
      return oldValue;
    } else if (newValue.text.length > 1 &&
        newValue.text.substring(1, newValue.text.length).toParseInt() == null) {
      return oldValue;
    }
    return newValue;
  }
}


