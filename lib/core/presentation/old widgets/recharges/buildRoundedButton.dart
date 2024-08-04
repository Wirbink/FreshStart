import 'package:flutter/material.dart';

class BuildRoundedButtonWidget extends StatelessWidget {
  final String imagePath;
  final Color color;
  final VoidCallback onPressed;

  const BuildRoundedButtonWidget({
    Key? key,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 3.3;
    double buttonHeight = buttonWidth * 1;

    return Container(
      width: buttonWidth,
      height: buttonHeight,
      margin: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Image.asset(
          imagePath,
          width: buttonWidth * 1, 
          height: buttonHeight * 1,
        ),
      ),
    );
  }
}
