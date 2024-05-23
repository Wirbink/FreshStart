// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillModel _$BillModelFromJson(Map<String, dynamic> json) => BillModel(
      billData: json['billData'] as String,
      voucher: json['voucher'] as String,
      youPaidWith: json['youPaidWith'] as String,
    );

Map<String, dynamic> _$BillModelToJson(BillModel instance) => <String, dynamic>{
      'billData': instance.billData,
      'voucher': instance.voucher,
      'youPaidWith': instance.youPaidWith,
    };
