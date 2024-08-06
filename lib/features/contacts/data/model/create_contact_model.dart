import 'package:fresh_start/features/contacts/domain/entities/create_contact_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_contact_model.g.dart';

@JsonSerializable()
class CreateContactModel extends CreateContactEntity {
  CreateContactModel({
    required String nickname,
    required String email,
    required String phone,
    required String bankname,
    required String account,
  }) : super(
            nickname: nickname,
            email: email,
            phone: phone,
            bankname: bankname,
            account: account);

  factory CreateContactModel.fromJson(Map<String, dynamic> json) =>
      _$CreateContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateContactModelToJson(this);
}
