import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_start/core/presentation/views/Cash%20Express/cash_express_view.dart';
import 'package:fresh_start/core/presentation/views/Services%20Payment/services_payment_view.dart';
import 'package:fresh_start/core/presentation/views/Transfers/National%20Transfers/transfers_view.dart';
import 'package:fresh_start/core/presentation/views/estado_cuenta_view.dart';
import 'package:fresh_start/core/presentation/widgets/home/service_icon_button.dart';
import 'package:fresh_start/styles.dart';

class CardSection extends StatelessWidget {
  final double balance;

  const CardSection({super.key, required this.balance});


  @override
  Widget build(BuildContext context) {
    String balanceWhole = getWholeBalance(balance);
    String balanceDecimal = getDecimalBalance(balance);
    
    return Center(
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
                padding:
                    const EdgeInsets.only(left: 25.0, top: 10.0, right: 25.0),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextRobotoBold(
                                  text: '\$ $balanceWhole',
                                  size: 30.0,
                                  color: Colors.white,
                                ),
                                TextRobotoBold(
                                  text: balanceDecimal,
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
    );
  }
  

  //Funciones de apoyo
  String getWholeBalance(double balance) {
    int valorEntero = balance.toInt(); // Obtener el valor entero
    return valorEntero.toString(); // Convertir a String
  }
  
  String getDecimalBalance(double balance) {
    // Convertir el número a string
  String numeroString = balance.toString();
  // Obtener la parte decimal como string
  String parteDecimalString = numeroString.substring(numeroString.indexOf('.') + 1);
  return parteDecimalString;

  }


}
