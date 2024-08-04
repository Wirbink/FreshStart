import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class EmptyData extends StatelessWidget {
  final String message;
  final String tip;

  const EmptyData({super.key, required this.message, required this.tip});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svg/Empty.svg',
          height: 300,
          width: 300,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          message, 
          style: AppTextStyles.display1
        ),
        Text(
          tip,
          style: AppTextStyles.paragraph1,
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
