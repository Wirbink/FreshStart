import 'package:json_annotation/json_annotation.dart';

part 'transfers_international_model.g.dart';

@JsonSerializable()
class TransfersInternationalModel {
  String senderName;
  String cardNumber;
  DateTime date;
  String recipientName;
  String cardNumberRecipient;
  String currencyConvert;
  double amountConvert;
  String currency;
  double equivalent;
  double comission;
  double amount;
  String concept;

  TransfersInternationalModel({
    required this.senderName,
    required this.cardNumber,
    required this.date,
    required this.recipientName,
    required this.cardNumberRecipient,
    required this.currencyConvert,
    required this.amountConvert,
    required this.currency,
    required this.equivalent,
    required this.comission,
    required this.amount,
    required this.concept
  });
  
  factory TransfersInternationalModel.fromJson(Map<String, dynamic> json) => _$TransfersInternationalModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransfersInternationalModelToJson(this);

}