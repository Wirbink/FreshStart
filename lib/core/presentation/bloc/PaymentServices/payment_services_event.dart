import 'package:equatable/equatable.dart';

abstract class PaymentServicesEvent extends Equatable {
  const PaymentServicesEvent();

  @override
  List<Object> get props => [];
}

class LoadPaymentServicesDataEvent extends PaymentServicesEvent {}

class NameChanged extends PaymentServicesEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class CardNumberChanged extends PaymentServicesEvent {
  final String cardNumber;

  const CardNumberChanged(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];
}

class DateChanged extends PaymentServicesEvent {
  final DateTime date;

  const DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class ServiceNameChanged extends PaymentServicesEvent {
  final String serviceName;

  const ServiceNameChanged(this.serviceName);

  @override
  List<Object> get props => [serviceName];
}

class ServiceReferenceChanged extends PaymentServicesEvent {
  final String serviceReference;

  const ServiceReferenceChanged(this.serviceReference);

  @override
  List<Object> get props => [serviceReference];
}

class AmountChanged extends PaymentServicesEvent {
  final double amount;

  const AmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class AmountSubmitted extends PaymentServicesEvent {}
