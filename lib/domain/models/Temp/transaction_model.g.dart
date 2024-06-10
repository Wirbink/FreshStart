// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: (json['id'] as num).toInt(),
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      senderId: (json['senderId'] as num).toInt(),
      receiverId: (json['receiverId'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      concept: json['concept'] as String,
      type: json['type'] as String,
      currency: json['currency'] as String?,
      exchangeRate: (json['exchangeRate'] as num?)?.toDouble(),
      bankComission: (json['bankComission'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'amount': instance.amount,
      'concept': instance.concept,
      'type': instance.type,
      'currency': instance.currency,
      'exchangeRate': instance.exchangeRate,
      'bankComission': instance.bankComission,
    };
