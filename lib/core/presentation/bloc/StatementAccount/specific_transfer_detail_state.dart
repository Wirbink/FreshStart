import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_registration.dart';

abstract class SpecificTransferDetailState extends Equatable {
  const SpecificTransferDetailState();

  @override
  List<Object> get props => [];
}

class Empty extends SpecificTransferDetailState {}

class Loading extends SpecificTransferDetailState {}

class Success extends SpecificTransferDetailState {
  final TransfersRegistrationModel transaction;

  const Success(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class Error extends SpecificTransferDetailState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}