// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      id: (json['id'] as num).toInt(),
      nameCompany: json['nameCompany'] as String,
      image: json['image'] as String,
      typeCompany: json['typeCompany'] as String,
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameCompany': instance.nameCompany,
      'image': instance.image,
      'typeCompany': instance.typeCompany,
    };
