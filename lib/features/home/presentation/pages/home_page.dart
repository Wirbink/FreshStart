import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/old%20widgets/home/app_bar_home.dart';
import 'package:fresh_start/core/utils/snackbar_utils.dart';
import 'package:fresh_start/core/utils/string_utils.dart';
import 'package:fresh_start/features/home/presentation/blocs/home_bloc.dart';
import 'package:fresh_start/features/home/presentation/sections/balance_card.dart';
import 'package:fresh_start/features/home/presentation/sections/other_services.dart';
import 'package:fresh_start/features/home/presentation/sections/recent_activity.dart';
import 'package:fresh_start/features/statement_account/data/models/account_model.dart';
import 'package:fresh_start/features/statement_account/data/repositories/account_repository_impl.dart';
import 'package:fresh_start/features/statement_account/domain/usecases/account_usecase.dart';
import 'package:fresh_start/features/transferences/data/model/transference_model.dart';
import 'package:fresh_start/features/transferences/data/repositories/transferences_repository_impl.dart';
import 'package:fresh_start/features/transferences/domain/usecases/transferences_usecase.dart';
import 'package:fresh_start/features/user/data/models/user_model.dart';
import 'package:fresh_start/features/user/data/repositories/user_repository_impl.dart';
import 'package:fresh_start/features/user/domain/usecases/user_usecase.dart';
import 'package:fresh_start/shared/presentation/section/error_page.dart';
import 'package:fresh_start/shared/presentation/section/loading_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final connectivity = Connectivity();
    //User
    final userRepository = UserRepositoryImpl(connectivity: connectivity);
    final userUseCase = UserUseCase(userRepository);
    //Cuenta
    final accountRepository = AccountRepositoryImpl(connectivity: connectivity);
    final accountUseCase = AccountUseCase(accountRepository);
    //Transferencias
    final transferenceRepository =
        TransferenceRepositoryImpl(connectivity: connectivity);
    final transferencesUseCase = TransferencesUseCase(transferenceRepository);

    return BlocProvider(
      create: (context) => HomeBloc(
          userUseCase: userUseCase,
          accountUseCase: accountUseCase,
          transferencesUseCase: transferencesUseCase)
        ..add(GetDataEvent()),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            showCustomSnackBar(context, state.message, false);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const LoadingPage();
            } else if (state is HomeSuccess) {
              return buildHomePage(
                  context, state.user, state.account, state.transferences);
            } else if (state is HomeError) {
              return ErrorPage<HomeBloc, GetDataEvent>(
                bloc: BlocProvider.of<HomeBloc>(context),
                event: GetDataEvent(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildHomePage(BuildContext context, UserModel user,
      AccountModel account, List<TransferenceModel> activities) {
    final userName = "${user.name} ${user.lastname}";
    final balanceResult = splitDoubleToIntegerAndDecimal(account.balance);

    return Scaffold(
      appBar: AppBarHome(username: userName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BalanceCard(
              integerPart: balanceResult['integerPart']!,
              decimalPart: balanceResult['decimalPart']!,
              userAccount: account.card[0].card_account,
            ),
            const OtherServices(),
            RecentActivity(activities: activities)
          ],
        ),
      ),
    );
  }
}
