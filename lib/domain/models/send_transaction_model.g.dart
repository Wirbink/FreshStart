// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendTransactionModel _$SendTransactionModelFromJson(
        Map<String, dynamic> json) =>
    SendTransactionModel(
      clabe: json['clabe'] as String,
      bankingEntity: json['bankingEntity'] as String,
      adresseeName: json['adresseeName'] as String,
      adresseeNickname: json['adresseeNickname'] as String,
    );

Map<String, dynamic> _$SendTransactionModelToJson(
        SendTransactionModel instance) =>
    <String, dynamic>{
      'clabe': instance.clabe,
      'bankingEntity': instance.bankingEntity,
      'adresseeName': instance.adresseeName,
      'adresseeNickname': instance.adresseeNickname,
    };
