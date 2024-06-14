// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentServicesModel _$PaymentServicesModelFromJson(
        Map<String, dynamic> json) =>
    PaymentServicesModel(
      name: json['name'] as String,
      cardNumber: json['cardNumber'] as String,
      date: json['date'] as String,
      serviceName: json['serviceName'] as String,
      serviceReference: json['serviceReference'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$PaymentServicesModelToJson(
        PaymentServicesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cardNumber': instance.cardNumber,
      'date': instance.date,
      'serviceName': instance.serviceName,
      'serviceReference': instance.serviceReference,
      'amount': instance.amount,
    };
