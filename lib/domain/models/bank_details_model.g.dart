// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDeatilModel _$BankDeatilModelFromJson(Map<String, dynamic> json) =>
    BankDeatilModel(
      name: json['name'] as String? ?? 'Default Name',
      lastName: json['lastName'] as String? ?? 'Default Last Name',
      accountNumber: json['accountNumber'] as String? ?? '0000000000',
      bankName: json['bankName'] as String? ?? 'Default Bank',
    );

Map<String, dynamic> _$BankDeatilModelToJson(BankDeatilModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'accountNumber': instance.accountNumber,
      'bankName': instance.bankName,
    };
