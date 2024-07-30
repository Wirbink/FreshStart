import 'package:fresh_start/features/auth/domain/entities/register_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends RegisterEntity {
  RegisterModel({
    required String name,
    required String lastname,
    required String email,
    required String rfc,
    required String phone,
    required String password,
    required int id_bank,
  }) : super(
        name: name,
        lastname: lastname,
        email: email,
        rfc: rfc,
        phone: phone,
        password: password,
        id_bank: id_bank,
      );

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
