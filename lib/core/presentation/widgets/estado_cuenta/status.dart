import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/views/estado_cuenta_view2.dart';
import 'package:fresh_start/styles.dart';
import 'package:intl/intl.dart';

class StatusWidget extends StatelessWidget {
  final String clabe;
  final String cardNumber;
  final double spent;
  final DateTime date;
  final String bill;
  final String voucher;

  const StatusWidget({
    super.key,
    required this.clabe,
    required this.cardNumber,
    required this.spent,
    required this.date,
    required this.bill,
    required this.voucher,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDate(date);
    String formattedTime = formatTime(date);

    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EstadoDeCuentaWidget(
                spent: spent,
                date: date,
                bill: bill,
                voucher: voucher,
                cardNumber: cardNumber,
              ),
            ),
          );
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
            child: Row(
              children: [
                const Column(
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
                      clabe,
                      style: const TextStyle(
                          fontFamily: 'MarkPro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF808080)),
                    ),
                    Row(
                      children: [
                        Text(
                          cardNumber,
                          style: const TextStyle(
                              fontFamily: 'MarkPro',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF808080)),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$ - $spent",
                        style: const TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 20.0,
                            color: colorMainText),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                formattedDate,
                                style: const TextStyle(
                                    fontFamily: 'MarkPro',
                                    fontSize: 12,
                                    color: colorTertearyText),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            children: [
                              Text(formattedTime,
                                  style: const TextStyle(
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

  String formatDate(DateTime date) {
    final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
    return dateFormatter.format(date);
  }

  String formatTime(DateTime date) {
    final DateFormat timeFormatter = DateFormat('hh:mm a');
    return timeFormatter.format(date);
  }
}
