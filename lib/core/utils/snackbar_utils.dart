import 'package:flutter/material.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/icons.dart';

void showCustomSnackBar(BuildContext context, String message, bool isSuccess) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          isSuccess ? AppIcons.checkRounded : AppIcons.errorAlert,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Expanded( // Usamos Expanded para que el texto ocupe el espacio disponible.
          child: Text(
            message,
            softWrap: true,
            overflow: TextOverflow.ellipsis, // Limitar el desbordamiento con puntos suspensivos.
            maxLines: 2, // Limitar a una línea.
          ),
        ),
      ],
    ),
    backgroundColor: isSuccess
        ? AppColors.colorSecondaryComplementary
        : AppColors.errorColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
