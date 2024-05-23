// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCardModel _$DataCardModelFromJson(Map<String, dynamic> json) =>
    DataCardModel(
      cardNumbers: json['cardNumbers'] as String,
      availableBalance: (json['availableBalance'] as num).toDouble(),
      expiration: json['expiration'] as String,
      amountData: (json['amountData'] as num).toInt(),
      cvv: (json['cvv'] as num).toInt(),
    );

Map<String, dynamic> _$DataCardModelToJson(DataCardModel instance) =>
    <String, dynamic>{
      'cardNumbers': instance.cardNumbers,
      'availableBalance': instance.availableBalance,
      'expiration': instance.expiration,
      'cvv': instance.cvv,
      'amountData': instance.amountData,
    };
