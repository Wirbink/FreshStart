part of 'send_transferences_bloc.dart';

abstract class SendTransferencesEvent extends Equatable {
  const SendTransferencesEvent();

  @override
  List<Object> get props => [];
}

class ReloadEvent extends SendTransferencesEvent {}

class SubmittedDataEvent extends SendTransferencesEvent {
  final SendTransferencesModel transference;

  const SubmittedDataEvent({required this.transference});

  @override
  List<Object> get props => [transference];
}
