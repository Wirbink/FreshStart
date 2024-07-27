part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SubmitLoginEvent extends LoginEvent {
  final LoginModel login;

  const SubmitLoginEvent({required this.login});

  @override
  List<Object> get props => [login];
}