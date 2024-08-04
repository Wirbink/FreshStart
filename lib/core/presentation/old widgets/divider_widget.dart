import 'package:flutter/material.dart';
import 'package:fresh_start/styles.dart';

class DividerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
              children: [
                Expanded(
                  child: Divider(color: colorBorder),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text("o", style: TextStyle(fontSize: 18, color: colorBorder, fontFamily: 'Roboto', fontWeight: FontWeight.w200),)),
                Expanded(
                  child: Divider(color: colorBorder),
                ),
              ],
            ),
    );
  }


}