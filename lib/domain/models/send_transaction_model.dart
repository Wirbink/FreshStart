import 'package:json_annotation/json_annotation.dart';

part 'send_transaction_model.g.dart';

@JsonSerializable()
class SendTransactionModel{
  String clabe;
  String bankingEntity;
  String adresseeName;
  String adresseeNickname;

  SendTransactionModel({
    required this.clabe,
    required this.bankingEntity,
    required this.adresseeName,
    required this.adresseeNickname,
  });

  factory SendTransactionModel.fromJson(Map<String, dynamic> json) => _$SendTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendTransactionModelToJson(this);
}