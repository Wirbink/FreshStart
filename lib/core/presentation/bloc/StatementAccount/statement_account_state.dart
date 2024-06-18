import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/contact_model.dart';
import 'package:fresh_start/domain/models/Transfers/statement_account_model.dart';

class StatementAccountState extends Equatable {
  final String clabeAccount;
  final String cardNumberAccount;
  final double amountAccount;
  final List<ContactModel> contacts;

  const StatementAccountState(
      {this.clabeAccount = '',
      this.cardNumberAccount = '',
      this.amountAccount = 0.0,
      this.contacts = const []});

  factory StatementAccountState.fromModel(
      StatementAccountModel model, List<ContactModel> contacts) {
    return StatementAccountState(
        clabeAccount: model.clabeAccount,
        cardNumberAccount: model.cardNumberAccount,
        amountAccount: model.amountAccount,
        contacts: contacts);
  }

  StatementAccountState copyWith(
      {String? clabeAccount,
      String? cardNumberAccount,
      double? amountAccount,
      List<ContactModel>? contacts,
      bool? isValid}) {
    return StatementAccountState(
        clabeAccount: clabeAccount ?? this.clabeAccount,
        cardNumberAccount: cardNumberAccount ?? this.cardNumberAccount,
        amountAccount: amountAccount ?? this.amountAccount,
        contacts: contacts ?? this.contacts
        );
  }

  @override
  List<Object> get props => [clabeAccount, cardNumberAccount, amountAccount, contacts];
}
