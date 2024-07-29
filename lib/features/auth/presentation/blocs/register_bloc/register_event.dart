part of 'register_bloc.dart';



abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SubmitRegisterEvent extends RegisterEvent {
  final RegisterModel register;

  const SubmitRegisterEvent({required this.register});

  @override
  List<Object> get props => [register];
}