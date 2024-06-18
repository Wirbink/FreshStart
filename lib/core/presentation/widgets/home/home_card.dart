import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/views/estado_cuenta_view.dart';
import 'package:fresh_start/core/presentation/views/estado_cuenta_view2.dart';
import 'package:fresh_start/styles.dart';
import 'package:intl/intl.dart';

class HomeCard extends StatelessWidget {
  final String name;
  final String bill;
  final double spent;
  final DateTime date;
  final String voucher;
  final String cardNumber;

  const HomeCard({
    super.key,
    required this.name,
    required this.bill,
    required this.spent,
    required this.date,
    required this.voucher,
    required this.cardNumber,
  });

  @override
  Widget build(BuildContext context) {
    String contactInitials = getInitials(name);
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
              offset: const Offset(0.0, 6.0),
            ),
          ],
        ),
        padding: const EdgeInsets.only(
          top: 5.0,
          bottom: 5.0,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: colorSecondaryComplementary,
                    radius: 25.0,
                    child: Text(
                      contactInitials,
                      style: const TextStyle(
                        fontFamily: 'MarkPro',
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'MarkPro',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: colorMainText,
                  ),
                ),
                Text(
                  bill,
                  style: const TextStyle(
                    fontFamily: 'MarkPro',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: colorMainText,
                  ),
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
                    "\$ $spent",
                    style: const TextStyle(
                      fontFamily: 'MarkPro',
                      fontSize: 20.0,
                      color: colorMainText,
                    ),
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
                              color: colorTertearyText,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        children: [
                          Text(
                            formattedTime,
                            style: const TextStyle(
                              fontFamily: 'MarkPro',
                              fontSize: 12,
                              color: colorTertearyText,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //Funciones de apoyo
  String getInitials(String name) {
    List<String> names = name.split(' ');
    String initials = '';
    for (var part in names) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
    }
    return initials.toUpperCase();
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
