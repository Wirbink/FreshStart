import 'package:json_annotation/json_annotation.dart';

part 'codi_model.g.dart';

@JsonSerializable()
class CodiModel {
  String cardNumber;
  double balance;
  String vencimiento;
  String cvv;
  double amount;
  String sender;

  CodiModel({
    required this.cardNumber,
    required this.balance,
    required this.vencimiento,
    required this.cvv,
    required this.amount,
    required this.sender
  });

  factory CodiModel.fromJson(Map<String, dynamic> json) => _$CodiModelFromJson(json);
  Map<String, dynamic> toJson() => _$CodiModelToJson(this);
}