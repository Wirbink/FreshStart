import 'package:flutter/material.dart';
import 'package:fresh_start/styles.dart';

class ServiceIconButton extends StatelessWidget {
  final String title1;
  final String title2;
  final Icon icon;
  final Color bgColor;
  final Color fgColor;
  final void Function() onTap;

  const ServiceIconButton({
    super.key,
    required this.title1,
    required this.title2,
    required this.icon,
    required this.bgColor,
    required this.fgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            radius: 25.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon],
            ),
          ),
          TextMarkProRegular(
            text: title1,
            size: 12.0,
            color: fgColor,
          ),
          TextMarkProRegular(
            text: title2,
            size: 12.0,
            color: fgColor,
          ),
        ],
      ),
    );
  }
}
