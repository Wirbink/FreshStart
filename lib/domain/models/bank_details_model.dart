import 'package:json_annotation/json_annotation.dart';

part 'bank_details_model.g.dart';

  @JsonSerializable()
class BankDeatilModel {
  String name;
  String lastName;
  String accountNumber;
  String bankName;
  
  BankDeatilModel({
    required this.name,
    required this.lastName,
    required this.accountNumber,
    required this.bankName
  });

  factory BankDeatilModel.fromJson(Map<String, dynamic> json) => _$BankDeatilModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankDeatilModelToJson(this);
}