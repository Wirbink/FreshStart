import 'package:json_annotation/json_annotation.dart';

part 'services_detail_model.g.dart';

@JsonSerializable()
class ServicesDatailsModel{
  String nameService;
  String image;

  ServicesDatailsModel({
    required this.nameService,
    required this.image,
  });

  factory ServicesDatailsModel.fromJson(Map<String, dynamic> json) => _$ServicesDatailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesDatailsModelToJson(this);
}