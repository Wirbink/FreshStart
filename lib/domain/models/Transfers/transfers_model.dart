import 'package:json_annotation/json_annotation.dart';

part 'transfers_model.g.dart';

@JsonSerializable()
class TransfersModel {
  String bankName;
  String senderName;
  String cardNumber;
  DateTime date;
  String recipientName;
  String cardNumberRecipient;
  double amount;
  String concept;

  TransfersModel({
    required this.bankName,
    required this.senderName,
    required this.cardNumber,
    required this.date,
    required this.recipientName,
    required this.cardNumberRecipient,
    required this.amount,
    required this.concept
  });

  factory TransfersModel.fromJson(Map<String, dynamic> json) => _$TransfersModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransfersModelToJson(this);
}