import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  int id;
  String name;
  String lastname;
  String email;
  String rfc;
  String phone;
  String password;
  String country;
  bool acceptedTerms;

  RegisterModel(
      {required this.id,
      required this.name,
      required this.lastname,
      required this.email,
      required this.rfc,
      required this.phone,
      required this.password,
      required this.country,
      required this.acceptedTerms});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
