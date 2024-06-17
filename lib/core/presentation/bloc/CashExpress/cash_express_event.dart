import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class CashExpressEvent extends Equatable {
  const CashExpressEvent();

  @override
  List<Object> get props => [];
}

class LoadCashExpressDataEvent extends CashExpressEvent {}

class CardNumberChanged extends CashExpressEvent {
  final String cardNumber;

  const CardNumberChanged(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];
}

class BalanceChanged extends CashExpressEvent {
  final double balance;

  const BalanceChanged(this.balance);

  @override
  List<Object> get props => [balance];
}

class VencimientoChanged extends CashExpressEvent {
  final String vencimiento;

  const VencimientoChanged(this.vencimiento);

  @override
  List<Object> get props => [vencimiento];
}

class CvvChanged extends CashExpressEvent {
  final String cvv;

  const CvvChanged(this.cvv);

  @override
  List<Object> get props => [cvv];
}

class AmountChanged extends CashExpressEvent {
  final double amount;

  const AmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class SenderChanged extends CashExpressEvent {
  final String sender;

  const SenderChanged(this.sender);

  @override
  List<Object> get props => [sender];
}

class SenderAccountChanged extends CashExpressEvent {
  final String senderAccount;

  const SenderAccountChanged(this.senderAccount);

  @override
  List<Object> get props => [senderAccount];
}

class DateChanged extends CashExpressEvent {
  final DateTime date;

  const DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class WithdrawalKeyChanged extends CashExpressEvent {
  final String withdrawalKeyChanged;

  const WithdrawalKeyChanged(this.withdrawalKeyChanged);

  @override
  List<Object> get props => [withdrawalKeyChanged];
}

class SecurityCodeChanged extends CashExpressEvent {
  final String securityCode;

  const SecurityCodeChanged(this.securityCode);

  @override
  List<Object> get props => [securityCode];
}

class CashExpressSubmitted extends CashExpressEvent {}