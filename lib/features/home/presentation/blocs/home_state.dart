part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final UserModel user;
  final AccountModel account;
  final List<TransferenceModel> transferences;

  const HomeSuccess(
      {required this.user, required this.account, required this.transferences});

  @override
  List<Object> get props => [user, account, transferences];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
