import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/tansfers_contact_state.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/transfers_contact_event.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/trasnfers_contact_bloc.dart';
import 'package:fresh_start/core/presentation/views/estado_cuenta_view.dart';
import 'package:fresh_start/core/presentation/widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/rounded_button.dart';
import 'package:fresh_start/core/presentation/widgets/subtitle.dart';
import 'package:fresh_start/core/presentation/widgets/transfers/contact_card.dart';
import 'package:fresh_start/core/presentation/widgets/dropdown_list_bank.dart';
import 'package:fresh_start/data/repositories/Transfers/contacts_repository_impl.dart';
import 'package:fresh_start/domain/usecases/Transfers/contact_data.dart';

String? selectedBank = 'FreshBank';

class TransfersView extends StatelessWidget {
  const TransfersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TransfersContactBloc(ContactData(ContactsRepositoryImpl()))
            ..add(LoadTranfersContactDataEvent()),
      child: Scaffold(
        appBar: const AppBarWidget(titleAppBar: 'Transferencias'),
        body: BlocBuilder<TransfersContactBloc, TransfersContactsState>(
          builder: (context, state) {
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SubtitleWidget(subtitleText: 'Cuenta Origen'),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selecciona una tarjeta',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'MarkPro',
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          DropDownListBankWidget(
                            value: selectedBank,
                            items: const ['FreshBank', 'MazeBank'],
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                selectedBank = newValue;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const SubtitleWidget(subtitleText: 'Destinatario'),
                    const RoundedButtonWidget(),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 8.0),
                      child: Column(children: [
                        Row(
                          children: [
                            const Text(
                              "Guardados",
                              style: TextStyle(
                                  fontFamily: 'MarkPro',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EstadoDeCuentaWidget1()),
                                );
                              },
                              child: const Text(
                                "Ver todos",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF034F8D),
                                ),
                              ),
                            )
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.contacts.length,
                          itemBuilder: (context, index) {
                            return ContactCard(
                                name: state.contacts[index].name,
                                clabe: state.contacts[index].clabe);
                          },
                        )
                      ]),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
