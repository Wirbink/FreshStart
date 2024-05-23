// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_cash_express_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmountCashExpressModel _$AmountCashExpressModelFromJson(
        Map<String, dynamic> json) =>
    AmountCashExpressModel(
      pay: json['pay'] as String,
      account: json['account'] as String,
      clabeDestination: (json['clabeDestination'] as num).toInt(),
      date: json['date'] as String,
      hour: json['hour'] as String,
      withdrawalKey: json['withdrawalKey'] as String,
      securityCode: (json['securityCode'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$AmountCashExpressModelToJson(
        AmountCashExpressModel instance) =>
    <String, dynamic>{
      'pay': instance.pay,
      'account': instance.account,
      'clabeDestination': instance.clabeDestination,
      'date': instance.date,
      'hour': instance.hour,
      'withdrawalKey': instance.withdrawalKey,
      'securityCode': instance.securityCode,
      'amount': instance.amount,
    };
