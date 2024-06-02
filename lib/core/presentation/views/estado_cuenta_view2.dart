import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/subtitle.dart';
import 'package:fresh_start/styles.dart';

class EstadoDeCuentaWidget extends StatelessWidget {
  const EstadoDeCuentaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleAppBar: 'Cuenta'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SubtitleWidget(subtitleText: 'Detalle de Pago'),
              const SizedBox(height: 36.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "FreshBank",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MarkPro',
                        color: Color(0xFF060912),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CircleAvatar(
                      backgroundColor: Color(0xFF20B087),
                      radius: 50,
                      child: Icon(
                        Icons.check,
                        size: 70,
                        color: Color(0XFFFAFAFA),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '¡Pago exitoso!',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MarkPro',
                        color: Color(0xFF060912),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$-53,600',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: colorMainText,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '06 ENE, 2024 -- 18:15',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'MarkPro',
                        color: Color(0XFF696969),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Factura",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MarkPro',
                            color: colorMainText,
                          ),
                        ),
                        Text(
                          "217197305 ",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto',
                            color: Color(0xFF696969),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 160),
                          child: Text(
                            "Electrificadora del Huila",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: Color(0xFF696969),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Comprobante",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MarkPro',
                            color: colorMainText,
                          ),
                        ),
                        Text(
                          "000001810",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto',
                            color: Color(0xFF696969),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pagaste con",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MarkPro',
                            color: colorMainText,
                          ),
                        ),
                        Text(
                          "Ahorros",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto',
                            color: Color(0xFF696969),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 267),
                          child: Text(
                            "****6705",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: Color(0xFF696969),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF1A2D4D),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 145.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  "Salir",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'MarkPro'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
