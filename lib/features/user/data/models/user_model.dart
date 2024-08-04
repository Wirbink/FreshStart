import 'package:fresh_start/features/user/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel(
      {required int id,
      required String name,
      required String lastname,
      required String email,
      required String rfc,
      required String phone,
      required String password,
      required int id_bank})
      : super(
            id: id,
            name: name,
            lastname: lastname,
            email: email,
            rfc: rfc,
            phone: phone,
            password: password,
            id_bank: id_bank);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
