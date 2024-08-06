// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateContactModel _$CreateContactModelFromJson(Map<String, dynamic> json) =>
    CreateContactModel(
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      bankname: json['bankname'] as String,
      account: json['account'] as String,
    );

Map<String, dynamic> _$CreateContactModelToJson(CreateContactModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'bankname': instance.bankname,
      'account': instance.account,
    };
