import 'package:fresh_start/features/transferences/domain/entities/transference_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transference_model.g.dart';

@JsonSerializable()
class TransferenceModel extends TransferenceEntity {
  TransferenceModel(
      {required int id,
      required double amount,
      required String sender_account,
      required String receptor_account,
      required String concept,
      required String owner})
      : super(
            id: id,
            amount: amount,
            sender_account: sender_account,
            receptor_account: receptor_account,
            concept: concept,
            owner: owner);

  factory TransferenceModel.fromJson(Map<String, dynamic> json) =>
      _$TransferenceModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransferenceModelToJson(this);
}
