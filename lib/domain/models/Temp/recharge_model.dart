import 'package:json_annotation/json_annotation.dart';

part 'recharge_model.g.dart';

@JsonSerializable()
class RechargeModel {
  int id;
  DateTime rechargeDate;
  int cardId;
  int companyId;
  String phoneNumber;
  double amount;
  String rechargeType;

  RechargeModel(
    {
      required this.id,
      required this.rechargeDate,
      required this.cardId,
      required this.companyId,
      required this.phoneNumber,
      required this.amount,
      required this.rechargeType,
    }
  );

  factory RechargeModel.fromJson(Map<String, dynamic> json) =>
      _$RechargeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RechargeModelToJson(this);
}