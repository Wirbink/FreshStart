// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementAccountModel _$StatementAccountModelFromJson(
        Map<String, dynamic> json) =>
    StatementAccountModel(
      clabeAccount: json['clabeAccount'] as String,
      cardNumberAccount: json['cardNumberAccount'] as String,
      amountAccount: (json['amountAccount'] as num).toDouble(),
    );

Map<String, dynamic> _$StatementAccountModelToJson(
        StatementAccountModel instance) =>
    <String, dynamic>{
      'clabeAccount': instance.clabeAccount,
      'cardNumberAccount': instance.cardNumberAccount,
      'amountAccount': instance.amountAccount,
    };
