import 'package:json_annotation/json_annotation.dart';

part 'bank_details_model.g.dart';

  @JsonSerializable()
class BankDeatilModel {
  String name;
  String lastName;
  String accountNumber;
  String bankName;
  
   BankDeatilModel({
    this.name = 'Default Name',
    this.lastName = 'Default Last Name',
    this.accountNumber = '0000000000',
    this.bankName = 'Default Bank',
  });

  factory BankDeatilModel.fromJson(Map<String, dynamic> json) => _$BankDeatilModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankDeatilModelToJson(this);
}