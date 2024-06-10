// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankModel _$BankModelFromJson(Map<String, dynamic> json) => BankModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      bankEntity: json['bankEntity'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bankEntity': instance.bankEntity,
      'country': instance.country,
    };
