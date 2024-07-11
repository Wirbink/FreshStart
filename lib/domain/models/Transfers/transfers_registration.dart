import 'package:json_annotation/json_annotation.dart';

part 'transfers_registration.g.dart';

@JsonSerializable()

class TransfersRegistrationModel {
  int id;
  double amount;
  DateTime date;
  String bill;
  String voucher;
  String paymentMethod;

  TransfersRegistrationModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.bill,
    required this.voucher,
    required this.paymentMethod
  });

  factory TransfersRegistrationModel.fromJson(Map<String, dynamic> json) => _$TransfersRegistrationModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransfersRegistrationModelToJson(this);
}