import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  String name;
  String lastname;
  String email;
  String rfc;
  String phone;
  String password;
  int id_bank;

  RegisterModel(
      {required this.name,
      required this.lastname,
      required this.email,
      required this.rfc,
      required this.phone,
      required this.password,
      required this.id_bank});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
