import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Fields {
  static Widget borderedTextFormField({
    @required FormFieldValidator<String> validator,
    @required TextEditingController controller,
    @required TextInputType textInputType,
    List<TextInputFormatter> textFieldInputFormatters,
    Color borderUnfocusedColor,
    int maxLines,
    int minLines
  }) {
    return TextFormField(
      minLines: minLines != null && minLines > 1 ? minLines : 1,
      maxLines: maxLines == null
          ? null
          : maxLines, //maxLines as null makes it a auto expanding field
      controller: controller,
      inputFormatters: textFieldInputFormatters,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          fillColor: borderUnfocusedColor == null
              ? Colors.grey[200]
              : borderUnfocusedColor,
          filled: true),
    );
  }
}
