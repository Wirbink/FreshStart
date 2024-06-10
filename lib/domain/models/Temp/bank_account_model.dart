import 'package:json_annotation/json_annotation.dart';

part 'bank_account_model.g.dart';

@JsonSerializable()
class BankAccountModel {
  int id;
  int userId;
  double generalBalance;
  String clabe;

  BankAccountModel(
      {required this.id,
      required this.userId,
      required this.clabe,
      required this.generalBalance});

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountModelToJson(this);
}
