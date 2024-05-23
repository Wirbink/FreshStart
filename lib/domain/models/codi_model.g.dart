// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodiModel _$CodiModelFromJson(Map<String, dynamic> json) => CodiModel(
      cardNumbers: json['cardNumbers'] as String,
      availableBalance: (json['availableBalance'] as num).toDouble(),
      expiration: json['expiration'] as String,
      amountData: (json['amountData'] as num).toInt(),
      cvv: (json['cvv'] as num).toInt(),
      concept: json['concept'] as String,
    );

Map<String, dynamic> _$CodiModelToJson(CodiModel instance) => <String, dynamic>{
      'cardNumbers': instance.cardNumbers,
      'availableBalance': instance.availableBalance,
      'expiration': instance.expiration,
      'cvv': instance.cvv,
      'amountData': instance.amountData,
      'concept': instance.concept,
    };
