part of 'transference_bloc.dart';

abstract class TransferenceState extends Equatable {
  const TransferenceState();

  @override
  List<Object> get props => [];
}

class TransferenceInitial extends TransferenceState {}

class TransferenceLoading extends TransferenceState {}

class TransferenceSuccess extends TransferenceState {
  final TransferenceSpecificModel transference;

  const TransferenceSuccess({required this.transference});

  @override
  List<Object> get props => [transference];
}

class TransferenceError extends TransferenceState {
  final String message;

  const TransferenceError({required this.message});

  @override
  List<Object> get props => [message];
}
