import 'package:fresh_start/domain/models/amount_model.dart';
import 'package:fresh_start/domain/models/bank_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'international_transfer_model.g.dart';

@JsonSerializable()
class InternationalTransferModel{
  int transactionId;
  DateTime transactionDate;
  BankDeatilModel sender;
  BankDeatilModel recipient;
  AmountModel amount;
  double exchangeRate;
  AmountModel fee;
  String? concept;

  InternationalTransferModel({
    required this.transactionId,
    required this.transactionDate,
    required this.sender,
    required this.recipient,
    required this.amount,
    required this.exchangeRate,
    required this.fee,
    this.concept
  });

  factory InternationalTransferModel.fromJson(Map<String, dynamic> json) => _$InternationalTransferModelFromJson(json);

  Map<String, dynamic> toJson() => _$InternationalTransferModelToJson(this);
}