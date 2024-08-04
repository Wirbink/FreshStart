import 'package:fresh_start/features/transferences/domain/entities/transference_specific_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transference_specific_model.g.dart';

@JsonSerializable()
class TransferenceSpecificModel extends TransferenceSpecificEntity {
  TransferenceSpecificModel(
      {required int id,
      required int id_sender,
      required int id_receptor,
      required double amount,
      required String sender_account,
      required String receptor_account,
      required String concept,
      required String owner})
      : super(
            id: id,
            amount: amount,
            concept: concept,
            id_receptor: id_receptor,
            id_sender: id_sender,
            owner: owner,
            receptor_account: receptor_account,
            sender_account: receptor_account);

  factory TransferenceSpecificModel.fromJson(Map<String, dynamic> json) => _$TransferenceSpecificModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransferenceSpecificModelToJson(this);
}
