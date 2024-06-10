// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodiModel _$CodiModelFromJson(Map<String, dynamic> json) => CodiModel(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      concept: json['concept'] as String,
      cardId: (json['cardId'] as num).toInt(),
      qr: json['qr'] as String,
    );

Map<String, dynamic> _$CodiModelToJson(CodiModel instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'concept': instance.concept,
      'cardId': instance.cardId,
      'qr': instance.qr,
    };
