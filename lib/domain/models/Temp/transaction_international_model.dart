import 'package:json_annotation/json_annotation.dart';

part 'transaction_international_model.g.dart';

@JsonSerializable()
class TransactionInternationalModel {
  int id;
  DateTime transactionDate;
  int senderId;
  int receiverId;
  double amount;
  String concept;
  String type;
  String? currency;
  double? exchangeRate;
  double? bankComission;

  TransactionInternationalModel(
    {
      required this.id,
      required this.transactionDate,
      required this.senderId,
      required this.receiverId,
      required this.amount,
      required this.concept,
      required this.type,
      required this.currency,
      required this.exchangeRate,
      required this.bankComission,
    }
  );

  factory TransactionInternationalModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionInternationalModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionInternationalModelToJson(this);
}