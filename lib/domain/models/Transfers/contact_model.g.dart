// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
      clabe: json['clabe'] as String,
      cardNumber: json['cardNumber'] as String,
      spent: (json['spent'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      bill: json['bill'] as String,
      voucher: json['voucher'] as String,
    );

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'clabe': instance.clabe,
      'cardNumber': instance.cardNumber,
      'spent': instance.spent,
      'date': instance.date.toIso8601String(),
      'bill': instance.bill,
      'voucher': instance.voucher,
    };
