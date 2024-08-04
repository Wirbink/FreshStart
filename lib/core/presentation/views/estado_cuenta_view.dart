import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/statement_account_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/statement_account_state.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/old%20widgets/estado_cuenta/status.dart';
import 'package:fresh_start/core/presentation/old%20widgets/subtitle.dart';
import 'package:fresh_start/data/repositories/Transfers/statement_account_repository_impl.dart';
import 'package:fresh_start/data/repositories/Transfers/transfers_registration_repository_impl.dart';
import 'package:fresh_start/domain/models/Transfers/statement_account_model.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_registration.dart';
import 'package:fresh_start/domain/usecases/Transfers/statement_account_data.dart';
import 'package:fresh_start/domain/usecases/Transfers/transfers_registration_data.dart';

class EstadoDeCuentaWidget1 extends StatelessWidget {
  const EstadoDeCuentaWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    final transfersRepository = TransfersRegistrationRepositoryImpl();
    final getTransfersRegistration =
        TransfersRegistrationData(transfersRepository);

    final statementRepository = StatementRepositoryImpl();
    final getStatement = StatementAccountData(statementRepository);

    return Scaffold(
      appBar: const AppBarWidget(titleAppBar: 'Cuenta'),
      body: BlocProvider(
        create: (context) => StatementAccountBloc(
          getTransfersRegistration,
          getStatement,
        ),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<StatementAccountBloc, StatementAccountState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return Container();
                  } else if (state is Loading) {
                    return const CircularProgressIndicator();
                  } else if (state is Success) {
                    return buildTransfersRegistration(
                        context, state.statement, state.transactions);
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
        ),
      ),
    );
  }

  Widget buildTransfersRegistration(
      BuildContext context,
      StatementAccountModel statement,
      List<TransfersRegistrationModel> trasnfers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        const SubtitleWidget(subtitleText: 'Mi cuenta'),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 1, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                statement.clabeAccount,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'MarkPro',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF808080),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '\$${statement.amountAccount}',
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
                statement.cardNumberAccount,
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
          itemCount: trasnfers.length,
          itemBuilder: (context, index) {
            return StatusWidget(
              idTransaction: trasnfers[index].id,
              clabe: statement.clabeAccount,
              cardNumber: statement.cardNumberAccount,
              spent: trasnfers[index].amount,
              date: trasnfers[index].date,
              bill: trasnfers[index].bill,
              voucher: trasnfers[index].voucher,
            );
          },
        ),
      ],
    );
  }
}
