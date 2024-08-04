import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_start/styles.dart';

class ContainerAmountWidget extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? secondValue;
  final List<String> secondItems;
  final ValueChanged<String> secondOnChanged;

  const ContainerAmountWidget({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.secondValue,
    required this.secondItems,
    required this.secondOnChanged
  }) : super(key: key);

 @override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      DropdownButtonFormField<String>(
        value: value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/mc_symbol.svg',
                  height: 16,
                  width: 16,
                ),
                const SizedBox(width: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MarkPro',
                        color: colorSecondaryText,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Text(
                      '1234',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MarkPro',
                        color: colorSecondaryText,
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    const Text(
                      '\$200,000.00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Roboto',
                        color: colorSecondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 8.0),
      DropdownButtonFormField<String>(
        value: secondValue,
        items: secondItems.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/mc_symbol.svg',
                  height: 16,
                  width: 16,
                ),
                const SizedBox(width: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MarkPro',
                        color: colorSecondaryText,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Text(
                      '1234',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MarkPro',
                        color: colorSecondaryText,
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    const Text(
                      '\$200,000.00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Roboto',
                        color: colorSecondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}
}