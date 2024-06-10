// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RechargeModel _$RechargeModelFromJson(Map<String, dynamic> json) =>
    RechargeModel(
      id: (json['id'] as num).toInt(),
      rechargeDate: DateTime.parse(json['rechargeDate'] as String),
      cardId: (json['cardId'] as num).toInt(),
      companyId: (json['companyId'] as num).toInt(),
      phoneNumber: json['phoneNumber'] as String,
      amount: (json['amount'] as num).toDouble(),
      rechargeType: json['rechargeType'] as String,
    );

Map<String, dynamic> _$RechargeModelToJson(RechargeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rechargeDate': instance.rechargeDate.toIso8601String(),
      'cardId': instance.cardId,
      'companyId': instance.companyId,
      'phoneNumber': instance.phoneNumber,
      'amount': instance.amount,
      'rechargeType': instance.rechargeType,
    };
