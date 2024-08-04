import 'package:flutter/material.dart';

class TextButtonSecondaryWidget extends StatelessWidget {
  final void Function() onPressed;
  final String textButton;

  const TextButtonSecondaryWidget(
      {super.key, required this.onPressed, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textButton,
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFF034F8D),
        ),
      ),
    );
  }
}
