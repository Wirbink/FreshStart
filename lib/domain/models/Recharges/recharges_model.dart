import 'package:json_annotation/json_annotation.dart';

part 'recharges_model.g.dart';

@JsonSerializable()
class RechargesModel {
  String name;
  String cardNumber;
  DateTime date;
  String type;
  String phoneNumber;
  String payment;
  double amount;

  RechargesModel({
    required this.name,
    required this.cardNumber,
    required this.date,
    required this.type,
    required this.phoneNumber,
    required this.payment,
    required this.amount
  });

  factory RechargesModel.fromJson(Map<String, dynamic> json) => _$RechargesModelFromJson(json);
  Map<String, dynamic> toJson() => _$RechargesModelToJson(this);
  
}