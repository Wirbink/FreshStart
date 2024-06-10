// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentServicesModel _$PaymentServicesModelFromJson(
        Map<String, dynamic> json) =>
    PaymentServicesModel(
      id: (json['id'] as num).toInt(),
      paymentDate: DateTime.parse(json['paymentDate'] as String),
      cardId: (json['cardId'] as num).toInt(),
      serviceNumber: json['serviceNumber'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$PaymentServicesModelToJson(
        PaymentServicesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentDate': instance.paymentDate.toIso8601String(),
      'cardId': instance.cardId,
      'serviceNumber': instance.serviceNumber,
      'amount': instance.amount,
    };
