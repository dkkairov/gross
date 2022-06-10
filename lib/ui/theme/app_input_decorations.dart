import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppInputDecoration {
  static InputDecoration baseInputStyle = InputDecoration(
      fillColor: Colors.white,
      floatingLabelBehavior:FloatingLabelBehavior.auto,
      filled: true,

      labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
      hintStyle: TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.only(left: 30.0, bottom: 15.0, top: 15.0),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.white,
            width: 0,
        ),
        borderRadius: BorderRadius.zero,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.zero,
      )
  );
}


/// Format incoming numeric text to fit the format of (###) ###-####
class UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 3)}) ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write('${newValue.text.substring(3, usedSubstringIndex = 6)}-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 9) {
      newText.write('${newValue.text.substring(6, usedSubstringIndex = 8)}-');
      if (newValue.selection.end >= 8) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write('${newValue.text.substring(8, usedSubstringIndex = 10)} ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}