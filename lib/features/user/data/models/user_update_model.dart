import 'package:fresh_start/features/user/domain/entities/user_upadate_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_update_model.g.dart';

@JsonSerializable()
class UserUpdateModel extends UserUpadateEntity {
  UserUpdateModel(
      {required String name,
      required String lastname,
      required String email,
      required String rfc,
      required String phone,
      required int id_bank})
      : super(
            name: name,
            lastname: lastname,
            email: email,
            rfc: rfc,
            phone: phone,
            id_bank: id_bank);

    factory UserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserUpdateModelToJson(this);
}
