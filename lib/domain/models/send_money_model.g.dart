// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_money_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMoneyModel _$SendMoneyModelFromJson(Map<String, dynamic> json) =>
    SendMoneyModel(
      nameCard: json['nameCard'] as String,
      adresseeName: json['adresseeName'] as String,
      clabe: (json['clabe'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$SendMoneyModelToJson(SendMoneyModel instance) =>
    <String, dynamic>{
      'nameCard': instance.nameCard,
      'adresseeName': instance.adresseeName,
      'clabe': instance.clabe,
      'amount': instance.amount,
    };
