import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  String clabe;
  String cardNumber;
  double spent;
  DateTime date;
  String bill;
  String voucher;

  ContactModel({
    required this.clabe,
    required this.cardNumber,
    required this.spent,
    required this.date,
    required this.bill,
    required this.voucher
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => _$ContactModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}