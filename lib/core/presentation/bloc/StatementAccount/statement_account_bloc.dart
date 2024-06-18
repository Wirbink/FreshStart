import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/statement_account_event.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/statement_account_state.dart';
import 'package:fresh_start/domain/usecases/Transfers/contact_data.dart';
import 'package:fresh_start/domain/usecases/Transfers/statement_account_data.dart';

class StatementAccountBloc
    extends Bloc<StatementAccountEvent, StatementAccountState> {
  final StatementAccountData statementAccountData;
  final ContactData contactData;

  StatementAccountBloc(this.statementAccountData, this.contactData)
      : super(const StatementAccountState(
            clabeAccount: '', cardNumberAccount: '', amountAccount: 0.0)) {
    on<LoadStatementAccountDataEvent>((event, emit) async {
      final statementAccount = await statementAccountData();
      final contacts = await contactData();
      emit(StatementAccountState.fromModel(statementAccount, contacts));
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

    on<ContactsChanged>((event, emit) {
      emit(state.copyWith(
        contacts: event.contacts,
        isValid: _validateStatementAccount()
      ));
    });
  }

  bool _validateStatementAccount() {
    final model = state;
    return model.clabeAccount.isNotEmpty &&
        model.cardNumberAccount.isNotEmpty &&
        model.amountAccount != null &&
        model.contacts != null;
  }
}
