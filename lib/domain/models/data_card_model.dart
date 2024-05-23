import 'package:json_annotation/json_annotation.dart';

part 'data_card_model.g.dart';

@JsonSerializable()
class DataCardModel {
  String cardNumbers;
  double availableBalance;
  String expiration;
  int cvv;
  int amountData;

  DataCardModel(
      {required this.cardNumbers,
      required this.availableBalance,
      required this.expiration,
      required this.amountData,
      required this.cvv});

  factory DataCardModel.dataJson(Map<String, dynamic> json) => _$DataCardModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataCardModelToJson(this);
}
