import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/contact_model.dart';
import 'package:fresh_start/domain/models/Transfers/statement_account_model.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_registration.dart';
abstract class StatementAccountState extends Equatable {
  const StatementAccountState();

  @override
  List<Object> get props => [];
}

class Empty extends StatementAccountState {}

class Loading extends StatementAccountState {}

class Success extends StatementAccountState {
  final List<TransfersRegistrationModel> transactions;
  final StatementAccountModel statement;

  const Success(this.transactions, this.statement);

  @override
  List<Object> get props => [transactions, statement];
}

class Error extends StatementAccountState {
  final String message;

  const Error({required this.message});

  @override 
  List<Object> get props => [message];
}

