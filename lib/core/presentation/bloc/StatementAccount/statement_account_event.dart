import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/contact_model.dart';

abstract class StatementAccountEvent extends Equatable {
  const StatementAccountEvent();

  @override
  List<Object> get props => [];
}

class LoadStatementAccountDataEvent extends StatementAccountEvent {}

class ClabeAccountChanged extends StatementAccountEvent {
  final String clabeAccount;

  const ClabeAccountChanged(this.clabeAccount);

  @override
  List<Object> get props => [clabeAccount];
}

class CardNumberAccountChanged extends StatementAccountEvent {
  final String cardNumberAccount;

  const CardNumberAccountChanged(this.cardNumberAccount);

  @override
  List<Object> get props => [cardNumberAccount];
}

class AmountAccountChanged extends StatementAccountEvent {
  final double amountAccount;

  const AmountAccountChanged(this.amountAccount);

  @override
  List<Object> get props => [amountAccount];
}

class ContactsChanged extends StatementAccountEvent {
  final List<ContactModel> contacts;

  const ContactsChanged(this.contacts);

  @override
  List<Object> get props => [contacts];
}

class StatementAccountSubmitted extends StatementAccountEvent {}
