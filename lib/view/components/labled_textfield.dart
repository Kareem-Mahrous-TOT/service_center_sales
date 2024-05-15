import 'package:flutter/material.dart';

class LabledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final String? Function(String?)? validatee;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  const LabledTextField({
    super.key,
    required this.controller,
    required this.title,
    this.validatee,
    this.hintText = "select",
    this.validator,
    this.onTap,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder =
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.black));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          keyboardType: keyboardType,
          onTap: onTap,
          controller: controller,
          validator: validatee,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            errorBorder: outlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.red)),
            disabledBorder: outlineInputBorder,
            focusedErrorBorder: outlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
