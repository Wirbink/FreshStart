import 'package:fresh_start/features/statement_account/data/models/card_model.dart';
import 'package:fresh_start/features/statement_account/domain/entities/account_entity.dart';
import 'package:fresh_start/features/user/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel extends AccountEntity {
  AccountModel(
      {required int id,
      required int id_user,
      required double balance,
      required int status,
      required List<CardModel> card,
      required UserModel user})
      : super(
            id: id,
            id_user: id_user,
            balance: balance,
            status: status,
            card: card,
            user: user);

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
