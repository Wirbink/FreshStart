import 'package:equatable/equatable.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransfer extends TransferEvent {}

class AdresseeNameChanged extends TransferEvent {
  final String adresseeName;

  const AdresseeNameChanged(this.adresseeName);

  @override
  List<Object?> get props => [adresseeName];
}

class ClabeChanged extends TransferEvent {
  final int clabe;

  const ClabeChanged(this.clabe);

  @override
  List<Object?> get props => [clabe];
}

class AmountChanged extends TransferEvent {
  final double amount;

  const AmountChanged(this.amount);

  @override
  List<Object?> get props => [amount];
}

class NameCardChanged extends TransferEvent {
  final String nameCard;

  const NameCardChanged(this.nameCard);

  @override
  List<Object?> get props => [nameCard];
}

class TransferSubmitted extends TransferEvent {}
