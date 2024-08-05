import 'package:flutter/material.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final bool isEnabled;
  final bool isLoading;

  const CustomButton(
      {super.key,
      required this.label,
      this.onPressed,
      this.isEnabled = true,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: SizedBox(
        height: 55.0,
        child: ElevatedButton(
            onPressed: isEnabled ? onPressed : null,
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isEnabled
                    ? AppColors.colorPrimary
                    : AppColors.colorDisabled,
                elevation: 0,
                textStyle:
                    AppTextStyles.buttonText.copyWith(color: Colors.white)),
            child: isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                : Text(label)),
      ),
    );
  }
}
