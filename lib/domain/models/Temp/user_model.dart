import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String name;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  DateTime birthDate;
  String curp;
  String rfc;
  String country;

  UserModel(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.birthDate,
      required this.curp,
      required this.rfc,
      required this.country});


  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
