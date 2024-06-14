import 'package:json_annotation/json_annotation.dart';

part 'cash_express_model.g.dart';

@JsonSerializable()
class CashExpressModel {
  String cardNumber;
  double balance;
  String vencimiento;
  String cvv;
  double amount;
  String sender;
  String senderAccount;
  DateTime date;
  String withdrawalKey;
  String securityCode;

  CashExpressModel({
    required this.cardNumber,
    required this.balance,
    required this.vencimiento,
    required this.cvv,
    required this.amount,
    required this.sender,
    required this.senderAccount,
    required this.date,
    required this.withdrawalKey,
    required this.securityCode,
  });

  factory CashExpressModel.fromJson(Map<String, dynamic> json) => _$CashExpressModelFromJson(json);
  Map<String, dynamic> toJson() => _$CashExpressModelToJson(this);
}
