// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDeatilModel _$BankDeatilModelFromJson(Map<String, dynamic> json) =>
    BankDeatilModel(
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      accountNumber: json['accountNumber'] as String,
      bankName: json['bankName'] as String,
    );

Map<String, dynamic> _$BankDeatilModelToJson(BankDeatilModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'accountNumber': instance.accountNumber,
      'bankName': instance.bankName,
    };
