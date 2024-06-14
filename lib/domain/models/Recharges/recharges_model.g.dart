// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharges_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RechargesModel _$RechargesModelFromJson(Map<String, dynamic> json) =>
    RechargesModel(
      name: json['name'] as String,
      cardNumber: json['cardNumber'] as String,
      date: DateTime.parse(json['date'] as String),
      type: json['type'] as String,
      phoneNumber: json['phoneNumber'] as String,
      payment: json['payment'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$RechargesModelToJson(RechargesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cardNumber': instance.cardNumber,
      'date': instance.date.toIso8601String(),
      'type': instance.type,
      'phoneNumber': instance.phoneNumber,
      'payment': instance.payment,
      'amount': instance.amount,
    };
