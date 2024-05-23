import 'package:json_annotation/json_annotation.dart';

part 'new_addressee_model.g.dart';

@JsonSerializable()
class NewAddresseeModel{
  String adresseeDetails;

  NewAddresseeModel({
    required this.adresseeDetails
  });

  factory NewAddresseeModel.fromJson(Map<String, dynamic> json) => _$NewAddresseeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewAddresseeModelToJson(this);
}