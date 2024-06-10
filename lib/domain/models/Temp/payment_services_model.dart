import 'package:json_annotation/json_annotation.dart';

part 'payment_services_model.g.dart';

@JsonSerializable()
class PaymentServicesModel {
  int id;
  DateTime paymentDate;
  int cardId;
  String serviceNumber;
  double amount;

  PaymentServicesModel(
      {required this.id,
      required this.paymentDate,
      required this.cardId,
      required this.serviceNumber,
      required this.amount});

  factory PaymentServicesModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentServicesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentServicesModelToJson(this);
}
