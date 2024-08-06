// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_transferences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendTransferencesModel _$SendTransferencesModelFromJson(
        Map<String, dynamic> json) =>
    SendTransferencesModel(
      amount: (json['amount'] as num).toDouble(),
      user_account: json['user_account'] as String,
      receptor_account: json['receptor_account'] as String,
      concept: json['concept'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$SendTransferencesModelToJson(
        SendTransferencesModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'user_account': instance.user_account,
      'receptor_account': instance.receptor_account,
      'concept': instance.concept,
      'owner': instance.owner,
    };
