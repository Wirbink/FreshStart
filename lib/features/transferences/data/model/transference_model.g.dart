// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferenceModel _$TransferenceModelFromJson(Map<String, dynamic> json) =>
    TransferenceModel(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      sender_account: json['sender_account'] as String,
      receptor_account: json['receptor_account'] as String,
      concept: json['concept'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$TransferenceModelToJson(TransferenceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'sender_account': instance.sender_account,
      'receptor_account': instance.receptor_account,
      'concept': instance.concept,
      'owner': instance.owner,
    };
