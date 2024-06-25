import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/tranfers_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/tranfers_event.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/transfers_state.dart';
import 'package:fresh_start/core/presentation/widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/general_button.dart';
import 'package:fresh_start/core/presentation/widgets/subtitle.dart';
import 'package:fresh_start/data/repositories/Transfers/trasnfers_repository_impl.dart';
import 'package:fresh_start/domain/usecases/Transfers/transfers_data.dart';
import 'package:fresh_start/styles.dart';
import 'package:fresh_start/core/presentation/widgets/container_dropdown.dart';

String? selectedBank = "FreshBank";

class SecondNationalView extends StatelessWidget {
  const SecondNationalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TranfersBloc(TransfersData(TrasnfersRepositoryImpl()))
            ..add(LoadTranfersDataEvent()),
      child: BlocBuilder<TranfersBloc, TransfersState>(
        builder: (context, state) {
TextEditingController amountController = TextEditingController(text: state.amount.toString());

          return Scaffold(
            appBar: const AppBarWidget(titleAppBar: 'Transacciones'),
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
                              value: selectedBank,
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
                                  text: state.recipientName,
                                ),
                                const TextMarkProMedium(
                                  text: 'CLABE',
                                  color: colorSecondaryText,
                                ),
                                TextMarkProRegular(text: state.cardNumberRecipient),
                              ],
                            ),
                            const SizedBox(height: 12.0),
                            const Text(
                              'Monto',
                              style: TextStyle(
                                fontFamily: 'MarkPro',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            TextField(
                              controller: amountController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '\$0',
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 200.0),
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
        },
      ),
    );
  }
}
