// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfers_international_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransfersInternationalModel _$TransfersInternationalModelFromJson(
        Map<String, dynamic> json) =>
    TransfersInternationalModel(
      senderName: json['senderName'] as String,
      cardNumber: json['cardNumber'] as String,
      date: DateTime.parse(json['date'] as String),
      recipientName: json['recipientName'] as String,
      cardNumberRecipient: json['cardNumberRecipient'] as String,
      currencyConvert: json['currencyConvert'] as String,
      amountConvert: (json['amountConvert'] as num).toDouble(),
      currency: json['currency'] as String,
      equivalent: (json['equivalent'] as num).toDouble(),
      comission: (json['comission'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      convert: json['convert'] as String,
    );

Map<String, dynamic> _$TransfersInternationalModelToJson(
        TransfersInternationalModel instance) =>
    <String, dynamic>{
      'senderName': instance.senderName,
      'cardNumber': instance.cardNumber,
      'date': instance.date.toIso8601String(),
      'recipientName': instance.recipientName,
      'cardNumberRecipient': instance.cardNumberRecipient,
      'currencyConvert': instance.currencyConvert,
      'amountConvert': instance.amountConvert,
      'currency': instance.currency,
      'equivalent': instance.equivalent,
      'comission': instance.comission,
      'amount': instance.amount,
      'convert': instance.convert,
    };
