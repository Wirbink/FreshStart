import 'package:flutter/material.dart';

class GeneralButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isEnabled;
  final bool isLoading;

  const GeneralButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.75,
      child: SizedBox(
        height: 55.0,
        child: ElevatedButton(
          onPressed: isEnabled && !isLoading ? onPressed : null,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: isEnabled ? const Color(0xFF1A2D4D) : Colors.grey,
            elevation: 0,
            textStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'MarkPro'),
          ),
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(text),
        ),
      ),
    );
  }
}
