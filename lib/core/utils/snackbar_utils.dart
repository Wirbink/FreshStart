import 'package:flutter/material.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/icons.dart';

void showCustomSnackBar(BuildContext context, String message, bool isSuccess) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(isSuccess ? AppIcons.checkRounded : AppIcons.errorAlert,
            color: Colors.white),
        const SizedBox(width: 10),
        Text(message),
      ],
    ),
    backgroundColor: isSuccess
        ? AppColors.colorSecondaryComplementary
        : AppColors.errorColor,
    // behavior: SnackBarBehavior.floating,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
