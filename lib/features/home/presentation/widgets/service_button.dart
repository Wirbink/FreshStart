import 'package:flutter/material.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/spacing.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class ServiceButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final Color fgColor;
  final void Function() onPressed;

  const ServiceButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.bgColor,
      required this.fgColor,
      required this.onPressed,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), backgroundColor: bgColor,
            padding: const EdgeInsets.all(
                AppSpacing.horizontalPadding), // Fondo del botón
          ),
          child: Icon(
            icon,
            color: iconColor,
          )),
      const SizedBox(
        height: AppSpacing.small,
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 80.0,
        ),
        child: Text(
          label,
          style: AppTextStyles.paragraph2.copyWith(color: fgColor),
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ),
    ]);
  }
}
