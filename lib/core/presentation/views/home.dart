// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_start/core/presentation/views/estado_cuenta_view.dart';
import 'package:fresh_start/styles.dart';
import 'package:fresh_start/core/presentation/views/Cash%20Express/cash_express_view.dart';
import 'package:fresh_start/core/presentation/views/Services%20Payment/services_payment_view.dart';
import 'package:fresh_start/core/presentation/views/Transfers/National%20Transfers/transfers_view.dart';
import 'package:fresh_start/core/presentation/widgets/home/home_card.dart';
import 'package:fresh_start/core/presentation/widgets/home/other_service_service.dart';
import 'package:fresh_start/core/presentation/widgets/home/service_icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBackground,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: const CircleAvatar(
                radius: 35.0,
                backgroundColor: colorSecondaryComplementary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextRobotoBold(
                      text: "BS",
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextMarkProRegular(
                    text: 'Hola',
                    size: 20.0,
                  ),
                  TextMarkProBold(
                    text: 'Brayn Sahagun',
                    size: 25,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.refresh,
                    color: colorPrimaryComplementary,
                    size: 25.0,
                  )),
            )
          ],
        ),
        toolbarHeight: 80.0,
        titleSpacing: 0.0,
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 210,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 10.0, right: 25.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextMarkProRegular(
                                    text: 'Tu Saldo Disponible',
                                    color: Colors.white,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const TextRobotoBold(
                                        text: '\$ 32,524',
                                        size: 30.0,
                                        color: Colors.white,
                                      ),
                                      const TextRobotoBold(
                                        text: '36',
                                        size: 15.0,
                                        color: Colors.white,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.visibility_off,
                                            color: colorTertearyText,
                                            size: 26.0,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/mc_symbol.svg',
                                    height: 63,
                                    width: 89,
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 25.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ServiceIconButton(
                                  title1: 'Transferir',
                                  title2: '',
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: colorPrimaryComplementary,
                                  ),
                                  bgColor: colorPanel,
                                  fgColor: Colors.white,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TransfersView()));
                                  },
                                ),
                                ServiceIconButton(
                                  title1: "Retiro sin",
                                  title2: "Tarjeta",
                                  icon: const Icon(
                                    Icons.send_to_mobile,
                                    color: colorPrimaryComplementary,
                                  ),
                                  bgColor: colorPanel,
                                  fgColor: colorPanel,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CashExpressView()));
                                  },
                                ),
                                ServiceIconButton(
                                  title1: "Pago de",
                                  title2: "Servicio",
                                  icon: const Icon(
                                    Icons.electrical_services_outlined,
                                    color: colorPrimaryComplementary,
                                  ),
                                  bgColor: colorPanel,
                                  fgColor: colorPanel,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ServicePaymentView()));
                                  },
                                ),
                                ServiceIconButton(
                                    title1: "Estado de",
                                    title2: "Cuenta",
                                    icon: const Icon(
                                      Icons.description,
                                      color: colorPrimaryComplementary,
                                    ),
                                    bgColor: colorPanel,
                                    fgColor: colorPanel,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EstadoDeCuentaWidget1()));
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const OtherServiceSection(),
          Center(
            child: Container(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 12.0, right: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const TextMarkProBold(
                        text: 'Actividad Reciente',
                        size: 20.0,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EstadoDeCuentaWidget1(),
                            ),
                          );
                        },
                        child: const TextMarkProMedium(
                          text: 'Ver todos',
                          size: 15.0,
                          color: colorPrimaryComplementary,
                        ),
                      )
                    ],
                  ),
                  const HomeCard(),
                  const HomeCard(),
                  const HomeCard(),
                  const HomeCard(),
                  const HomeCard(),
                  const HomeCard(),
                  const HomeCard(),
                  const HomeCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
