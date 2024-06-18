import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/PaymentServices/payment_services_model.dart';

class PaymentServicesState extends Equatable {
  final String name;
  final String cardNumber;
  final DateTime date;
  final String serviceName;
  final String serviceReference;
  final double amount;

  PaymentServicesState({
    this.name = '',
    this.cardNumber = '',
    this.serviceName = '',
    this.serviceReference = '',
    this.amount = 1500.00,
    DateTime? date,
  }) : date = date ?? DateTime(2024, 6, 9, 19, 52);

  factory PaymentServicesState.fromModel(PaymentServicesModel model) {
    return PaymentServicesState(
        name: model.name,
        cardNumber: model.cardNumber,
        serviceName: model.serviceName,
        serviceReference: model.serviceReference,
        amount: model.amount);
  }

  PaymentServicesState copyWith(
      {String? name,
      String? cardNumber,
      DateTime? date,
      String? serviceName,
      String? serviceReference,
      double? amount,
      bool? isValid}) {
    return PaymentServicesState(
        name: this.name,
        cardNumber: this.cardNumber,
        date: this.date,
        serviceName: this.serviceName,
        serviceReference: this.serviceReference,
        amount: this.amount);
  }

  @override
  List<Object> get props => [
        name,
        cardNumber,
        date,
        serviceName,
        serviceReference,
        amount,
      ];
}
