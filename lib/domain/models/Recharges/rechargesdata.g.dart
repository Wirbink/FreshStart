// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rechargesdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RechargeModel _$RechargeModelFromJson(Map<String, dynamic> json) =>
    RechargeModel(
      phoneNumber: (json['phoneNumber'] as num).toInt(),
      payWith: json['payWith'] as String,
      rechargeType: json['rechargeType'] as String,
      sentAmount: (json['sentAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$RechargeModelToJson(RechargeModel instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'payWith': instance.payWith,
      'rechargeType': instance.rechargeType,
      'sentAmount': instance.sentAmount,
    };
