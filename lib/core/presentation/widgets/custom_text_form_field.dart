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
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(icon),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: 2),
        ),
        errorStyle:
            AppTextStyles.paragraph1.copyWith(color: AppColors.errorColor),
      ),
      validator: validator,
      keyboardType: inputType,
    );
  }
}
