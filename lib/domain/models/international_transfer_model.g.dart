// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'international_transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternationalTransferModel _$InternationalTransferModelFromJson(
        Map<String, dynamic> json) =>
    InternationalTransferModel(
      transactionId: (json['transactionId'] as num).toInt(),
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      sender: BankDeatilModel.fromJson(json['sender'] as Map<String, dynamic>),
      recipient:
          BankDeatilModel.fromJson(json['recipient'] as Map<String, dynamic>),
      amount: AmountModel.fromJson(json['amount'] as Map<String, dynamic>),
      exchangeRate: (json['exchangeRate'] as num).toDouble(),
      fee: AmountModel.fromJson(json['fee'] as Map<String, dynamic>),
      concept: json['concept'] as String?,
    );

Map<String, dynamic> _$InternationalTransferModelToJson(
        InternationalTransferModel instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'sender': instance.sender,
      'recipient': instance.recipient,
      'amount': instance.amount,
      'exchangeRate': instance.exchangeRate,
      'fee': instance.fee,
      'concept': instance.concept,
    };
