
import 'package:json_annotation/json_annotation.dart';


part 'status_account_model.g.dart';

@JsonSerializable()
class StatusAccountModel {
  int id;
  String bill;
  String voucher;
  int cardId;

  StatusAccountModel({
    required this.id,
    required this.bill,
    required this.voucher,
    required this.cardId
  });

  factory StatusAccountModel.fromJson(Map<String, dynamic> json) => _$StatusAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusAccountModelToJson(this);
}