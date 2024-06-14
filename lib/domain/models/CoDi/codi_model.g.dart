// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodiModel _$CodiModelFromJson(Map<String, dynamic> json) => CodiModel(
      cardNumber: json['cardNumber'] as String,
      balance: (json['balance'] as num).toDouble(),
      vencimiento: json['vencimiento'] as String,
      cvv: json['cvv'] as String,
      amount: (json['amount'] as num).toDouble(),
      sender: json['sender'] as String,
    );

Map<String, dynamic> _$CodiModelToJson(CodiModel instance) => <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'balance': instance.balance,
      'vencimiento': instance.vencimiento,
      'cvv': instance.cvv,
      'amount': instance.amount,
      'sender': instance.sender,
    };
