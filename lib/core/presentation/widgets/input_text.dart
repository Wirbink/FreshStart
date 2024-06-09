import 'package:flutter/material.dart';
import 'package:fresh_start/styles.dart';

class InputText extends StatelessWidget {
  final Icon? iconPlaceholder;
  final String placeholder;

  const InputText({Key? key, this.iconPlaceholder, required this.placeholder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: colorBorder),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        children: [
          if (iconPlaceholder != null) iconPlaceholder!,
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: const TextStyle(
                  color: colorNumberText
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
