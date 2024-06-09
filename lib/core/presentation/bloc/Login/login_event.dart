import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoadLoginDataEvent extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final
}