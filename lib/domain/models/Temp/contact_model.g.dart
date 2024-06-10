// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
      id: (json['id'] as num).toInt(),
      bankAccountId: (json['bankAccountId'] as num).toInt(),
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankAccountId': instance.bankAccountId,
      'nickname': instance.nickname,
    };
