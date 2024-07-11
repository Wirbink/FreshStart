import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/specific_transfer_detail_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/specific_transfer_detail_state.dart';
import 'package:fresh_start/core/presentation/widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/subtitle.dart';
// ignore: unused_import
import 'package:fresh_start/data/repositories/Transfers/statement_account_repository_impl.dart';
import 'package:fresh_start/data/repositories/Transfers/transfers_registration_repository_impl.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_registration.dart';
import 'package:fresh_start/domain/usecases/Transfers/specific_transfer_detail_data.dart';
import 'package:fresh_start/styles.dart';
import 'package:intl/intl.dart';

class EstadoDeCuentaWidget extends StatelessWidget {
  final int idTransaction;

  const EstadoDeCuentaWidget({super.key, required this.idTransaction});

  @override
  Widget build(BuildContext context) {
    final transferRepository = TransfersRegistrationRepositoryImpl();
    final getTransfer =
        SpecificTransferDetailData(transferRepository, idTransaction);

    return Scaffold(
        appBar: const AppBarWidget(titleAppBar: 'Cuenta'),
        body: BlocProvider(
          create: (context) =>
              SpecificTransferDetailBloc(getTransfer, idTransaction),
          child: SingleChildScrollView(
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
                      child: BlocBuilder<SpecificTransferDetailBloc,
                          SpecificTransferDetailState>(
                        builder: (context, state) {
                          if (state is Empty) {
                            return Container();
                          } else if (state is Loading) {
                            return const CircularProgressIndicator();
                          } else if (state is Success) {
                            return buildTransferDeatil(
                                context, state.transaction);
                          } else if (state is Error) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(state.message),
                                SizedBox(height: 16),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
                      )),
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
        ));
  }

  //Funciones de ayuda
  String formatDate(DateTime date) {
    final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
    return dateFormatter.format(date);
  }

  String formatTime(DateTime date) {
    final DateFormat timeFormatter = DateFormat('hh:mm a');
    return timeFormatter.format(date);
  }

  String getLastFourDigits(String cardNumber) {
    // Remover los espacios en blanco
    String cleaned = cardNumber.replaceAll(' ', '');
    // Obtener los últimos cuatro dígitos
    String lastFourDigits = cleaned.substring(cleaned.length - 4);
    // Devolver el formato deseado
    return '• $lastFourDigits';
  }

  Widget buildTransferDeatil(
      BuildContext context, TransfersRegistrationModel state) {
    String formattedDate = formatDate(state.date);
    String formattedTime = formatTime(state.date);
    String formattedCardNumber = getLastFourDigits(state.paymentMethod);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "FreshBank",
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'MarkPro',
            color: Color(0xFF060912),
          ),
        ),
        const SizedBox(height: 8.0),
        const CircleAvatar(
          backgroundColor: Color(0xFF20B087),
          radius: 50,
          child: Icon(
            Icons.check,
            size: 70,
            color: Color(0XFFFAFAFA),
          ),
        ),
        const SizedBox(height: 8.0),
        const Text(
          '¡Pago exitoso!',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'MarkPro',
            color: Color(0xFF060912),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          '\$- ${state.amount}',
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: colorMainText,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          '$formattedDate -- $formattedTime',
          style: const TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'MarkPro',
            color: Color(0XFF696969),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Factura",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'MarkPro',
                color: colorMainText,
              ),
            ),
            Text(
              state.bill,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: Color(0xFF696969),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Comprobante",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'MarkPro',
                color: colorMainText,
              ),
            ),
            Text(
              state.voucher,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: Color(0xFF696969),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Pagaste con",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'MarkPro',
                color: colorMainText,
              ),
            ),
            Text(
              formattedCardNumber,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: Color(0xFF696969),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
      ],
    );
  }
}
