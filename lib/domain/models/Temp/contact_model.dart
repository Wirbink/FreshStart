import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  int id;
  int bankAccountId;
  String? nickname;

  ContactModel(
    {
      required this.id,
      required this.bankAccountId,
      required this.nickname,
    }
  );

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}