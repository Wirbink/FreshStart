// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/views/estado_cuenta_view2.dart';
import 'package:fresh_start/styles.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => EstadoDeCuentaWidget(),
          //   ),
          // );
        },
        child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 7.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: colorPanel,
                boxShadow: [
                  BoxShadow(
                      color: colorMainText.withOpacity(0.1),
                      blurRadius: 4.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0.0, 6.0))
                ]),
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0001TJ0117',
                      style: TextStyle(
                          fontFamily: 'MarkPro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF808080)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          size: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '1111',
                          style: TextStyle(
                              fontFamily: 'MarkPro',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF808080)),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$ - 2,500.00",
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 20.0,
                            color: colorMainText),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "20-01-2024",
                                style: TextStyle(
                                    fontFamily: 'MarkPro',
                                    fontSize: 12,
                                    color: colorTertearyText),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            children: [
                              Text("10:00 PM",
                                  style: TextStyle(
                                      fontFamily: 'MarkPro',
                                      fontSize: 12,
                                      color: colorTertearyText))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
