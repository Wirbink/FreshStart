import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  int id;
  int bankAccountId;
  int bankId;
  String cardNumber;
  String expirationDate;
  String cvv;
  double balance;
  String cardName;
  String payNetProc;

  CardModel(
      {required this.id,
      required this.bankAccountId,
      required this.bankId,
      required this.cardNumber,
      required this.expirationDate,
      required this.cvv,
      required this.balance,
      required this.cardName,
      required this.payNetProc});

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
