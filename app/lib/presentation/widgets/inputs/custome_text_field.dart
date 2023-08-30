import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? icon;
  final TextStyle? style;
  final List<TextInputFormatter>? formatters;
  final int? maxLength;
  final TextAlign? textAlign;

  const CustomTextFormField({
    super.key,
    this.textAlign,
    this.formatters,
    this.maxLength,
    this.style,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
        // borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(40));

    return TextFormField(
        style: style,
        maxLength: maxLength,
        inputFormatters: formatters,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        textAlign: textAlign ?? TextAlign.start,
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: hint,
          errorText: errorMessage,
          focusColor: colors.primary,
          icon: icon != null
              ? Icon(
                  icon,
                  color: colors.primary,
                )
              : null,
        ));
  }
}
