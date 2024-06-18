import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/statement_account_model.dart';

class StatementAccountState extends Equatable {
  final String clabeAccount;
  final String cardNumberAccount;
  final double amountAccount;

  const StatementAccountState(
      {this.clabeAccount = '',
      this.cardNumberAccount = '',
      this.amountAccount = 0.0});

  factory StatementAccountState.fromModel(StatementAccountModel model) {
    return StatementAccountState(
        clabeAccount: model.clabeAccount,
        cardNumberAccount: model.cardNumberAccount,
        amountAccount: model.amountAccount);
  }

  StatementAccountState copyWith(
      {String? clabeAccount,
      String? cardNumberAccount,
      double? amountAccount,
      bool? isValid}) {
    return StatementAccountState(
        clabeAccount: clabeAccount ?? this.clabeAccount,
        cardNumberAccount: cardNumberAccount ?? this.cardNumberAccount,
        amountAccount: amountAccount ?? this.amountAccount);
  }

  @override
  List<Object> get props => [clabeAccount, cardNumberAccount, amountAccount];
}
