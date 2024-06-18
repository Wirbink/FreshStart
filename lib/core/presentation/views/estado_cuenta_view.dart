import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/statement_account_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/statement_account_event.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/statement_account_state.dart';
import 'package:fresh_start/core/presentation/widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/estado_cuenta/status.dart';
import 'package:fresh_start/core/presentation/widgets/subtitle.dart';
import 'package:fresh_start/data/repositories/Transfers/contacts_repository_impl.dart';
import 'package:fresh_start/data/repositories/Transfers/statement_account_repository_impl.dart';
import 'package:fresh_start/domain/usecases/Transfers/contact_data.dart';
import 'package:fresh_start/domain/usecases/Transfers/statement_account_data.dart';

class EstadoDeCuentaWidget1 extends StatelessWidget {
  const EstadoDeCuentaWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatementAccountBloc(
          StatementAccountData(StatementRepositoryImpl()),
          ContactData(ContactsRepositoryImpl()))
        ..add(LoadStatementAccountDataEvent()),
      child: Scaffold(
        appBar: const AppBarWidget(titleAppBar: 'Cuenta'),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<StatementAccountBloc, StatementAccountState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      const SubtitleWidget(subtitleText: 'Mi cuenta'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.clabeAccount,
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'MarkPro',
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF808080),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '\$${state.amountAccount}',
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF808080),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Saldo disponible',
                              style: TextStyle(
                                fontSize: 10.0,
                                fontFamily: 'MarkPro',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF808080),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              state.cardNumberAccount,
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'MarkPro',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF808080),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const SubtitleWidget(subtitleText: 'Mis compras'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.contacts.length,
                        itemBuilder: (context, index) {
                          return StatusWidget(
                            clabe: state.clabeAccount,
                            cardNumber: state.cardNumberAccount,
                            spent: state.contacts[index].spent,
                            date: state.contacts[index].date,
                            bill: state.contacts[index].bill,
                            voucher: state.contacts[index].voucher,
                          );
                        },
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
