// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      rfc: json['rfc'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      idBank: (json['idBank'] as num).toInt(),
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'rfc': instance.rfc,
      'phone': instance.phone,
      'password': instance.password,
      'idBank': instance.idBank,
    };
