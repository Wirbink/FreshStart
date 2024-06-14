// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_express_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashExpressModel _$CashExpressModelFromJson(Map<String, dynamic> json) =>
    CashExpressModel(
      cardNumber: json['cardNumber'] as String,
      balance: (json['balance'] as num).toDouble(),
      vencimiento: json['vencimiento'] as String,
      cvv: json['cvv'] as String,
      amount: (json['amount'] as num).toDouble(),
      sender: json['sender'] as String,
      senderAccount: json['senderAccount'] as String,
      date: DateTime.parse(json['date'] as String),
      withdrawalKey: json['withdrawalKey'] as String,
      securityCode: json['securityCode'] as String,
    );

Map<String, dynamic> _$CashExpressModelToJson(CashExpressModel instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'balance': instance.balance,
      'vencimiento': instance.vencimiento,
      'cvv': instance.cvv,
      'amount': instance.amount,
      'sender': instance.sender,
      'senderAccount': instance.senderAccount,
      'date': instance.date.toIso8601String(),
      'withdrawalKey': instance.withdrawalKey,
      'securityCode': instance.securityCode,
    };
