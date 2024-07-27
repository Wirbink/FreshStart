import 'package:flutter/material.dart';

const Color colorBackground = Color(0xFFF0F2F5);
const Color colorPanel = Color(0xFFFAFAFA);
const Color colorBorder = Color(0xFF696969);
const Color colorMainText = Color(0xFF060912);
const Color colorSecondaryText = Color(0xFF606167);
const Color colorTertearyText = Color(0xFFA3A4A6);
const Color colorPrimary = Color(0xFF1A2D4D);
const Color colorPrimaryComplementary = Color(0xFF034F8D);
const Color colorSecondaryComplementary = Color(0xFF2F7D67);
const Color colorDisabled = Color(0xFFC7CDD6);
const Color colorDisabledText = Color(0xFF9B9B9B);
const Color colorNumberText = Color(0xFF808080);


class TextMarkProRegular extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const TextMarkProRegular({
    Key? key,
    required this.text,
    this.color = colorMainText,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w400,
        fontSize: size,
        color: color,
      ),
    );
  }
}

class TextMarkProMedium extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const TextMarkProMedium({
    Key? key,
    required this.text,
    this.color = colorMainText,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w500,
        fontSize: size,
        color: color,
      ),
    );
  }
}

class TextMarkProBold extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const TextMarkProBold({
    Key? key,
    required this.text,
    this.color = colorMainText,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w700,
        fontSize: size,
        color: color,
      ),
    );
  }
}

class TextRobotoBold extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const TextRobotoBold({
    Key? key,
    required this.text,
    this.color = colorMainText,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color,
      ),
    );
  }
}

class TextRobotoMedium extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const TextRobotoMedium({
    Key? key,
    required this.text,
    this.color = colorMainText,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: size,
        color: color,
      ),
    );
  }
}

class TextRobotoRegular extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const TextRobotoRegular({
    Key? key,
    required this.text,
    this.color = colorMainText,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: size,
        color: color,
      ),
    );
  }
}