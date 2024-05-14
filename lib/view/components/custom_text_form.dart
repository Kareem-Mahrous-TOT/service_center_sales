import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.color = Colors.grey,
    this.borderRadius = 15,
    this.borderColor = Colors.black,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.inputFormatters,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.notBorder = true,
    this.notLabelText = true,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.initialValue,
  });
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double borderRadius;
  final Color borderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool notBorder;
  final bool notLabelText;
  final VoidCallback? onTap;
  final bool readOnly;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        );
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: borderColor),
    );
    final errorBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: Colors.red),
    );
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      cursorColor: borderColor,
      cursorErrorColor: borderColor,
      decoration: InputDecoration(
        hintText: text,
        // labelText: notLabelText ? text : null,
        hintStyle: style,
        // labelStyle: style,
        border: borderStyle,
        focusedBorder: borderStyle,
        errorBorder: errorBorderStyle,
        focusedErrorBorder: errorBorderStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      readOnly: readOnly,
      initialValue: initialValue,
    );
  }
}
