import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'rechargesdata.g.dart';

@JsonSerializable()
class RechargeModel {
  int phoneNumber;
  String payWith;
  String rechargeType;
  double sentAmount;

  RechargeModel({
    required this.phoneNumber,
    required this.payWith,
    required this.rechargeType,
    required this.sentAmount,
  });

factory RechargeModel.fromJson(Map<String, dynamic> json) => _$RechargeModelFromJson(json);

Map<String, dynamic> toJson() => _$RechargeModelToJson(this);
}