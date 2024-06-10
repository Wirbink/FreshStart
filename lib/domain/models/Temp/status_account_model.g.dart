// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusAccountModel _$StatusAccountModelFromJson(Map<String, dynamic> json) =>
    StatusAccountModel(
      id: (json['id'] as num).toInt(),
      bill: json['bill'] as String,
      voucher: json['voucher'] as String,
      cardId: (json['cardId'] as num).toInt(),
    );

Map<String, dynamic> _$StatusAccountModelToJson(StatusAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bill': instance.bill,
      'voucher': instance.voucher,
      'cardId': instance.cardId,
    };
