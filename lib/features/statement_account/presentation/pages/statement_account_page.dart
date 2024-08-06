import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/utils/string_utils.dart';
import 'package:fresh_start/features/statement_account/data/models/account_model.dart';
import 'package:fresh_start/features/statement_account/data/repositories/account_repository_impl.dart';
import 'package:fresh_start/features/statement_account/domain/usecases/account_usecase.dart';
import 'package:fresh_start/features/statement_account/presentation/blocs/statement_account_bloc.dart';
import 'package:fresh_start/features/transferences/data/model/transference_model.dart';
import 'package:fresh_start/features/transferences/data/repositories/transferences_repository_impl.dart';
import 'package:fresh_start/features/transferences/domain/usecases/transferences_usecase.dart';
import 'package:fresh_start/shared/presentation/section/empty_data.dart';
import 'package:fresh_start/shared/presentation/section/error_page.dart';
import 'package:fresh_start/shared/presentation/section/loading_page.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/spacing.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';
import 'package:fresh_start/shared/presentation/widgets/transaction_card.dart';

class StatementAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final connectivity = Connectivity();
    final accountRepository = AccountRepositoryImpl(connectivity: connectivity);
    final accountUseCase = AccountUseCase(accountRepository);

    final transferenceRepository =
        TransferenceRepositoryImpl(connectivity: connectivity);
    final transferencesUseCase = TransferencesUseCase(transferenceRepository);

    final statementBloc = StatementAccountBloc(
        accountUseCase: accountUseCase,
        transferencesUseCase: transferencesUseCase)
      ..add(GetDataEvent());

    return BlocProvider(
      create: (context) => statementBloc,
      child: BlocBuilder<StatementAccountBloc, StatementAccountState>(
        builder: (context, state) {
          if (state is StatementAccountLoading) {
            return const LoadingPage();
          } else if (state is StatementAccountSuccess) {
            return buildStatementAccountPage(
                state.account, state.transferences);
          } else if (state is StatementAccountError) {
            return ErrorPage<StatementAccountBloc, GetDataEvent>(
                bloc: BlocProvider.of<StatementAccountBloc>(context),
                event: GetDataEvent());
          } else {
            return const Text('Hola bro');
          }
        },
      ),
    );
  }

  Widget buildStatementAccountPage(
      AccountModel account, List<TransferenceModel> transferences) {
    return Scaffold(
      appBar: const AppBarWidget(titleAppBar: 'Cuenta'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: AppSpacing.medium,
            ),
            const Text('Mi cuenta', style: AppTextStyles.heading1),
            const SizedBox(
              height: AppSpacing.small,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account.card[0].card_account,
                        style: AppTextStyles.heading3.copyWith(
                            color: AppColors.colorNumberText,
                            fontFamily: 'Roboto'),
                      ),
                      Text(
                        account.card[0].card,
                        style: AppTextStyles.paragraph1
                            .copyWith(color: AppColors.colorSecondaryText),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: AppSpacing.extraSmall,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$ ${doubleToIntegerMoney(account.balance)}',
                        style: AppTextStyles.heading3.copyWith(
                            color: AppColors.colorNumberText,
                            fontFamily: 'Roboto'),
                      ),
                      const SizedBox(
                        height: AppSpacing.extraSmall,
                      ),
                      Text(
                        'Saldo disponible',
                        style: AppTextStyles.paragraph1
                            .copyWith(color: AppColors.colorSecondaryText),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: AppSpacing.medium,
            ),
            const Text('Mi movimientos', style: AppTextStyles.heading1),
            transferences.isEmpty
                ? Center(
                    child: const EmptyData(
                        message: 'No hay movimientos',
                        tip: '¡Realiza tu primer operación!'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: transferences.length,
                    itemBuilder: (context, index) {
                      return TransactionCard(
                          transference: transferences[index]);
                    },
                  ),
          ]),
        ),
      ),
    );
  }
}
