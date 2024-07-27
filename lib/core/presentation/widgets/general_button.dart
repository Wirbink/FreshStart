import 'package:flutter/material.dart';

class GeneralButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool enabled;

  const GeneralButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.75,
      child: SizedBox(
        height: 55.0,
        child: ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: enabled ? const Color(0xFF1A2D4D) : Colors.grey,
            elevation: 0,
            textStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'MarkPro'),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
