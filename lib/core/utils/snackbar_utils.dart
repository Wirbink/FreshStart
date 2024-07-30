import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        const Icon(Icons.error, color: Colors.white),
        const SizedBox(width: 10),
        Text(message),
      ],
    ),
    backgroundColor: const Color(0xFFc33c3b),
    // behavior: SnackBarBehavior.floating,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}