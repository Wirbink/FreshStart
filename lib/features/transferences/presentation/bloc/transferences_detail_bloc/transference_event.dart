part of 'transference_bloc.dart';

abstract class TransferenceEvent extends Equatable {
  const TransferenceEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends TransferenceEvent {
  final int id;

  const GetDataEvent({required this.id});

  @override
  List<Object> get props => [id];
}
