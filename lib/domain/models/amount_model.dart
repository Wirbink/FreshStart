import 'package:json_annotation/json_annotation.dart';

part 'amount_model.g.dart';

@JsonSerializable()
class AmountModel {
  String currency;
  double value;

  AmountModel({
    this.currency = 'USD',
    this.value = 0.0,
  });

  factory AmountModel.fromJson(Map<String, dynamic> json) => _$AmountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AmountModelToJson(this);
}