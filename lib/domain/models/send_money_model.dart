import 'package:json_annotation/json_annotation.dart';

part 'send_money_model.g.dart';

@JsonSerializable()
class SendMoneyModel {
  String nameCard;
  String adresseeName;
  int clabe;
  double amount;

  SendMoneyModel({
    required this.nameCard,
    required this.adresseeName,
    required this.clabe,
    required this.amount,
  });

  factory SendMoneyModel.fromJson(Map<String, dynamic> json) =>
      _$SendMoneyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendMoneyModelToJson(this);
}
