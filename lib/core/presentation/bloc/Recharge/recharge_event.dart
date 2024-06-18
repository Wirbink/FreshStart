import 'package:equatable/equatable.dart';

abstract class RechargeEvent extends Equatable {
  const RechargeEvent();

  @override
  List<Object> get props => [];
}

class LoadRechargeDataEvent extends RechargeEvent {}

class NameRecharge extends RechargeEvent {
  final String name;

  const NameRecharge(this.name);

  @override
  List<Object> get props => [name];
}

class CardNumberChanged extends RechargeEvent {
  final String cardNumber;

  const CardNumberChanged(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];
}

class DateChanged extends RechargeEvent {
  final DateTime date;

  const DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class TypeChanged extends RechargeEvent {
  final String type;

  const TypeChanged(this.type);

  @override
  List<Object> get props => [type];
}

class PhoneNumberChanged extends RechargeEvent {
  final String phoneNumber;

  const PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class PaymentChanged extends RechargeEvent {
  final String payment;

  const PaymentChanged(this.payment);

  @override
  List<Object> get props => [payment];
}

class AmountChanged extends RechargeEvent {
  final double amount;

  const AmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class RechargeSubmitted extends RechargeEvent {}
