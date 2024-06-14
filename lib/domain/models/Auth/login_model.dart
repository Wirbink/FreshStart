import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String email;
  String password;
  bool remember;

  LoginModel({
    required this.email,
    required this.password,
    required this.remember
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
  Map<String,dynamic> toJson() => _$LoginModelToJson(this);
}