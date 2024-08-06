import 'package:fresh_start/features/transferences/domain/entities/send_transferences_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_transferences_model.g.dart';

@JsonSerializable()
class SendTransferencesModel extends SendTransferencesEntity {
  SendTransferencesModel(
      {required double amount,
      required String user_account,
      required String receptor_account,
      required String concept,
      required String owner})
      : super(
            amount: amount,
            user_account: user_account,
            receptor_account: receptor_account,
            concept: concept,
            owner: owner);

  factory SendTransferencesModel.fromJson(Map<String, dynamic> json) =>
      _$SendTransferencesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendTransferencesModelToJson(this);
}
