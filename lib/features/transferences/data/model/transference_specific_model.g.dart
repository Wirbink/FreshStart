// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transference_specific_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferenceSpecificModel _$TransferenceSpecificModelFromJson(
        Map<String, dynamic> json) =>
    TransferenceSpecificModel(
      id: (json['id'] as num).toInt(),
      id_sender: (json['id_sender'] as num).toInt(),
      id_receptor: (json['id_receptor'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      sender_account: json['sender_account'] as String,
      receptor_account: json['receptor_account'] as String,
      concept: json['concept'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$TransferenceSpecificModelToJson(
        TransferenceSpecificModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'sender_account': instance.sender_account,
      'receptor_account': instance.receptor_account,
      'concept': instance.concept,
      'owner': instance.owner,
      'id_sender': instance.id_sender,
      'id_receptor': instance.id_receptor,
    };
