// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfers_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransfersRegistrationModel _$TransfersRegistrationModelFromJson(
        Map<String, dynamic> json) =>
    TransfersRegistrationModel(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      bill: json['bill'] as String,
      voucher: json['voucher'] as String,
      paymentMethod: json['paymentMethod'] as String,
    );

Map<String, dynamic> _$TransfersRegistrationModelToJson(
        TransfersRegistrationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'bill': instance.bill,
      'voucher': instance.voucher,
      'paymentMethod': instance.paymentMethod,
    };
