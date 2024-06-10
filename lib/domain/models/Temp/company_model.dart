import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  int id;
  String nameCompany;
  String image;
  String typeCompany;

  CompanyModel(
    {
      required this.id,
      required this.nameCompany,
      required this.image,
      required this.typeCompany,
    }
  );

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}