import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.validator,
    this.keyboardType,
  });

  final String labelText;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 17),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            label: Text(labelText),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
