import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/statement_account_event.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/statement_account_state.dart';
import 'package:fresh_start/domain/usecases/Transfers/statement_account_data.dart';

class StatementAccountBloc
    extends Bloc<StatementAccountEvent, StatementAccountState> {
  final StatementAccountData statementAccountData;

  StatementAccountBloc(this.statementAccountData)
      : super(const StatementAccountState(
            clabeAccount: '', cardNumberAccount: '', amountAccount: 0.0)) {
    on<LoadStatementAccountDataEvent>((event, emit) async {
      final statementAccount = await statementAccountData();
      emit(StatementAccountState.fromModel(statementAccount));
    });

    on<ClabeAccountChanged>((event, emit) {
      emit(state.copyWith(
          clabeAccount: event.clabeAccount,
          isValid: _validateStatementAccount()));
    });

    on<CardNumberAccountChanged>((event, emit) {
      emit(state.copyWith(
          cardNumberAccount: event.cardNumberAccount,
          isValid: _validateStatementAccount()));
    });

    on<AmountAccountChanged>((event, emit) {
      emit(state.copyWith(
          amountAccount: event.amountAccount,
          isValid: _validateStatementAccount()));
    });
  }

  bool _validateStatementAccount() {
    final model = state;
    return model.clabeAccount.isNotEmpty &&
        model.cardNumberAccount.isNotEmpty &&
        model.amountAccount != null;
  }
}
