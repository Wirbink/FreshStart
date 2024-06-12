import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoadLoginDataEvent extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class RememberChanged extends LoginEvent {
  final bool remember;

  const RememberChanged(this.remember);

  @override
  List<Object> get props => [remember];
}

class LoginSubmitted extends LoginEvent {}
