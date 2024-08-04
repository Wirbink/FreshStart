import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  final String subtitleText;

  const SubtitleWidget({super.key, required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: Text(
        subtitleText,
        style: const TextStyle(
            fontFamily: 'MarkPro', fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
