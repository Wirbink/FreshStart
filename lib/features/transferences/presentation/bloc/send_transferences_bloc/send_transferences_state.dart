
part of 'send_transferences_bloc.dart';

abstract class SendTransferencesState extends Equatable{
  const SendTransferencesState();

  @override
  List<Object> get props => [];
}

class SendTransferencesInitial extends SendTransferencesState {}

class SendTransferencesLoading extends SendTransferencesState {}

class SendTransferencesSuccess extends SendTransferencesState {}

class SendTransferencesError extends SendTransferencesState {
  final String message;

  const SendTransferencesError({required this.message});

  @override
  List<Object> get props => [message];
}