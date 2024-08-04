import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final String textButton;

  const TextButtonWidget(
      {super.key, required this.onPressed, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF1A2D4D),
          textStyle: const TextStyle(
              fontFamily: 'MarkPro',
              fontSize: 18.0,
              fontWeight: FontWeight.w900),
        ),
        child: Text(textButton),
    );
  }
}
