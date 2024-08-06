import 'package:fresh_start/features/contacts/domain/entities/contact_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel extends ContactEntity {
  ContactModel({
    required int id,
    required int id_user,
    required String nickname,
    required String email,
    required String phone,
    required String bankname,
    required String account,
  }) : super(
            id: id,
            id_user: id_user,
            nickname: nickname,
            email: email,
            phone: phone,
            bankname: bankname,
            account: account);

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}