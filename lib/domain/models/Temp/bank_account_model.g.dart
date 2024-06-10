// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) =>
    BankAccountModel(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      clabe: json['clabe'] as String,
      generalBalance: (json['generalBalance'] as num).toDouble(),
    );

Map<String, dynamic> _$BankAccountModelToJson(BankAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'generalBalance': instance.generalBalance,
      'clabe': instance.clabe,
    };
