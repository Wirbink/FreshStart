part of 'statement_account_bloc.dart';

abstract class StatementAccountState extends Equatable {
  const StatementAccountState();

  @override
  List<Object> get props => [];
}

class StatementAccountInitial extends StatementAccountState {}

class StatementAccountLoading extends StatementAccountState {}

class StatementAccountSuccess extends StatementAccountState {
  final AccountModel account;
  final List<TransferenceModel> transferences;

  const StatementAccountSuccess(
      {required this.account, required this.transferences});

  @override
  List<Object> get props => [account, transferences];
}

class StatementAccountError extends StatementAccountState {
  final String message;

  const StatementAccountError({required this.message});

  @override
  List<Object> get props => [message];
}