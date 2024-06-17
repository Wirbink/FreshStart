import 'package:equatable/equatable.dart';

abstract class CodiEvent extends Equatable {
  const CodiEvent();

  @override
  List<Object?> get props => [];
}

class LoadCodiDataEvent extends CodiEvent {}

class CardNumberChanged extends CodiEvent {
  final String cardNumber;

  const CardNumberChanged(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];
}

class BalanceChanged extends CodiEvent {
  final double balance;

  const BalanceChanged(this.balance);

  @override
  List<Object> get props => [balance];
}

class VencimientoChanged extends CodiEvent {
  final String vencimiento;

  const VencimientoChanged(this.vencimiento);

  @override
  List<Object> get props => [vencimiento];
}

class CvvChanged extends CodiEvent {
  final String cvv;

  const CvvChanged(this.cvv);

  @override
  List<Object> get props => [cvv];
}

class AmountChanged extends CodiEvent {
  final double amount;

  const AmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class SenderChanged extends CodiEvent {
  final String sender;

  const SenderChanged(this.sender);

  @override
  List<Object> get props => [sender];
}

class CodiSubmitted extends CodiEvent {}
