part of 'statement_account_bloc.dart';

abstract class StatementAccountEvent extends Equatable {
  const StatementAccountEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends StatementAccountEvent {}