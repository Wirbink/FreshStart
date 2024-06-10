import 'package:json_annotation/json_annotation.dart';


part 'bank_model.g.dart';

@JsonSerializable()
class BankModel {
  int id;
  String name;
  String bankEntity;
  String country;

  BankModel({
    required this.id,
    required	this.name,
    required this.bankEntity,
    required this.country
  });

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelToJson(this);
}