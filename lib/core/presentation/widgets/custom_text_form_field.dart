import 'package:flutter/material.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextInputType? inputType;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      required this.icon,
      this.validator,
      this.inputType = TextInputType.number});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: AppTextStyles.paragraph1,
        suffixIcon: Icon(
          icon,
          color: AppColors.colorPrimaryComplementary,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorPrimary, width: 2),
        ),
      ),
      validator: validator,
      keyboardType: inputType,
    );
  }
}
