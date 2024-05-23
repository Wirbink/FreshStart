// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountStatusModel _$AccountStatusModelFromJson(Map<String, dynamic> json) =>
    AccountStatusModel(
      myAccount: json['myAccount'] as String,
      availableBalance: (json['availableBalance'] as num).toDouble(),
    );

Map<String, dynamic> _$AccountStatusModelToJson(AccountStatusModel instance) =>
    <String, dynamic>{
      'myAccount': instance.myAccount,
      'availableBalance': instance.availableBalance,
    };
