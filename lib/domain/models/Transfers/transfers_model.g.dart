// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransfersModel _$TransfersModelFromJson(Map<String, dynamic> json) =>
    TransfersModel(
      bankName: json['bankName'] as String,
      senderName: json['senderName'] as String,
      cardNumber: json['cardNumber'] as String,
      date: DateTime.parse(json['date'] as String),
      recipientName: json['recipientName'] as String,
      cardNumberRecipient: json['cardNumberRecipient'] as String,
      amount: (json['amount'] as num).toDouble(),
      concept: json['concept'] as String,
    );

Map<String, dynamic> _$TransfersModelToJson(TransfersModel instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'senderName': instance.senderName,
      'cardNumber': instance.cardNumber,
      'date': instance.date.toIso8601String(),
      'recipientName': instance.recipientName,
      'cardNumberRecipient': instance.cardNumberRecipient,
      'amount': instance.amount,
      'concept': instance.concept,
    };
