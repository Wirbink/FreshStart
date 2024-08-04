import 'package:flutter/material.dart';

class BuildResponsiveButtonRowWidget extends StatelessWidget {
  final List<Widget> buttons;

  const BuildResponsiveButtonRowWidget({Key? key, required this.buttons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: buttons,
    );
  }
}
