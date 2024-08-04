import 'package:fresh_start/features/transferences/domain/entities/transference_entity.dart';

class TransferenceSpecificEntity extends TransferenceEntity {
  int id_sender;
  int id_receptor;
  
  TransferenceSpecificEntity(
      {required super.id,
      required super.amount,
      required super.sender_account,
      required super.receptor_account,
      required super.concept,
      required super.owner,
      required this.id_receptor,
      required this.id_sender});
}
