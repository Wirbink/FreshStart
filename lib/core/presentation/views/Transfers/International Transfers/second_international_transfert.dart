import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/TransfersInternational/transfers_international_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/TransfersInternational/transfers_international_event.dart';
import 'package:fresh_start/core/presentation/bloc/TransfersInternational/transfers_international_state.dart';
import 'package:fresh_start/core/presentation/widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/general_button.dart';
import 'package:fresh_start/core/presentation/widgets/subtitle.dart';
import 'package:fresh_start/data/repositories/Transfers/transfers_international_repository_impl.dart';
import 'package:fresh_start/domain/usecases/Transfers/transfers_international_data.dart';
import 'package:fresh_start/styles.dart';
import 'package:fresh_start/core/presentation/widgets/container_dropdown.dart';

String? selectedBank;
String? selectedAmount;

class SecondInternationalView extends StatelessWidget {
  const SecondInternationalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransfersInternationalBloc(
          TransfersInternationalData(TransfersInternationalRepositoryImpl()))
        ..add(LoadTransfersInternationalDataEvent()),
      child:
          BlocBuilder<TransfersInternationalBloc, TransfersInternationalState>(
              builder: (context, state) {

                TextEditingController conceptController = TextEditingController(text: state.concept);
        
        return Scaffold(
          appBar:
              const AppBarWidget(titleAppBar: 'Transacciones Internacionales'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const SubtitleWidget(subtitleText: 'Cuenta de origen'),
                  const SizedBox(height: 8.0),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color(0XFFFAFAFA),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selecciona una tarjeta',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'MarkPro',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          ContainerDropDownListBankWidget(
                            value: 'FreshBank',
                            items: const ['FreshBank', 'MazeBank'],
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                selectedBank = newValue;
                              }
                            },
                          ),
                          const SizedBox(height: 12.0),
                          const Text(
                            'Destinatario',
                            style: TextStyle(
                              fontFamily: 'MarkPro',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextMarkProMedium(
                                text: 'Nombre',
                                color: colorSecondaryText,
                              ),
                              TextMarkProRegular(
                                text: state.senderName,
                              ),
                              const TextMarkProMedium(
                                text: 'CLABE',
                                color: colorSecondaryText,
                              ),
                              TextMarkProRegular(text: state.cardNumber),
                            ],
                          ),
                          const SizedBox(height: 12.0),
                          const Text(
                            'Divisa',
                            style: TextStyle(
                              fontFamily: 'MarkPro',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          DropdownButtonFormField<String>(
                            value: "EUR",
                            items: ["EUR", "USD", "MXM"].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                            onChanged: (String? value) {},
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Equivalente",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'MarkPro',
                                  color: colorMainText,
                                ),
                              ),
                              Text(
                                "\$${state.equivalent} MXN",
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  color: colorSecondaryText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Comisión Bancaria",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'MarkPro',
                                  color: colorMainText,
                                ),
                              ),
                              Text(
                                "\$${state.comission} MXN + IVA",
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  color: colorSecondaryText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tasa de Cambio",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'MarkPro',
                                  color: colorMainText,
                                ),
                              ),
                              Text(
                                "€1 = 18.47",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  color: colorSecondaryText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total a Descontar",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'MarkPro',
                                  color: colorMainText,
                                ),
                              ),
                              Text(
                                "\$${state.amount}",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  color: colorMainText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          const Text(
                            'Concepto',
                            style: TextStyle(
                              fontFamily: 'MarkPro',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          TextField(
                            controller: conceptController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Ingresa el concepto',
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: GeneralButtonWidget(text: 'Confirmar'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
