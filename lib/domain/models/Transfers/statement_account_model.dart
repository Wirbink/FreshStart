import 'package:json_annotation/json_annotation.dart';

part 'statement_account_model.g.dart';

@JsonSerializable()
class StatementAccountModel {
  String clabeAccount;
  String cardNumberAccount;
  double amountAccount;

  StatementAccountModel({
    required this.clabeAccount,
    required this.cardNumberAccount,
    required this.amountAccount
  });

  factory StatementAccountModel.fromJson(Map<String, dynamic> json) => _$StatementAccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatementAccountModelToJson(this);
}
