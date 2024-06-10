// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      id: (json['id'] as num).toInt(),
      bankAccountId: (json['bankAccountId'] as num).toInt(),
      bankId: (json['bankId'] as num).toInt(),
      cardNumber: json['cardNumber'] as String,
      expirationDate: json['expirationDate'] as String,
      cvv: json['cvv'] as String,
      balance: (json['balance'] as num).toDouble(),
      cardName: json['cardName'] as String,
      payNetProc: json['payNetProc'] as String,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'id': instance.id,
      'bankAccountId': instance.bankAccountId,
      'bankId': instance.bankId,
      'cardNumber': instance.cardNumber,
      'expirationDate': instance.expirationDate,
      'cvv': instance.cvv,
      'balance': instance.balance,
      'cardName': instance.cardName,
      'payNetProc': instance.payNetProc,
    };
