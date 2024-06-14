import 'package:json_annotation/json_annotation.dart';

part 'payment_services_model.g.dart';

@JsonSerializable()
class PaymentServicesModel {
  String name;
  String cardNumber;
  String date;
  String serviceName;
  String serviceReference;
  double amount;

  PaymentServicesModel({
    required this.name,
    required this.cardNumber,
    required this.date,
    required this.serviceName,
    required this.serviceReference,
    required this.amount
  });

  factory PaymentServicesModel.fromJson(Map<String, dynamic> json) => _$PaymentServicesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentServicesModelToJson(this);
}