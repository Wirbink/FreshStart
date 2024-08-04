import 'package:flutter/material.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class Hyperlink extends StatelessWidget {
  final bool isEnabled;
  final void Function() onPressed;
  final String label;

  const Hyperlink(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          label,
          style: isEnabled
              ? AppTextStyles.hyperlink
              : AppTextStyles.hyperlink
                  .copyWith(color: AppColors.colorDisabledText),
        ));
  }
}
