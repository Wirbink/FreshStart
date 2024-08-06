// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
      id: (json['id'] as num).toInt(),
      id_user: (json['id_user'] as num).toInt(),
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      bankname: json['bankname'] as String,
      account: json['account'] as String,
    );

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'bankname': instance.bankname,
      'account': instance.account,
      'id': instance.id,
      'id_user': instance.id_user,
    };
