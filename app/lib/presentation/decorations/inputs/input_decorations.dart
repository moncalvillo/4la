import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration noBordersInput({
    String? labelText,
    String? hintText,
  }) {
    return InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: InputBorder.none,
        contentPadding: const EdgeInsets.all(20));
  }
}
