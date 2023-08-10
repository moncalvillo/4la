import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? value;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustomTextInput({
    super.key,
    this.controller,
    this.value,
    this.label,
    this.hint,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El campo no puede estar vacío';
        }
        return null;
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          hintText: hint,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(20)),
      onChanged: onChanged,
    );
  }
}
