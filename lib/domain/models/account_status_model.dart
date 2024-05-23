import 'package:json_annotation/json_annotation.dart';

part 'account_status_model.g.dart';

@JsonSerializable()
class AccountStatusModel {
  String myAccount;
  double availableBalance;
  
  AccountStatusModel({
    required this.myAccount,
    required this.availableBalance
  });

  factory AccountStatusModel.fromJson(Map<String, dynamic> json) => _$AccountStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountStatusModelToJson(this);
}