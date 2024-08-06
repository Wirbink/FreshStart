import 'package:fresh_start/features/contacts/domain/entities/create_contact_entity.dart';

class ContactEntity extends CreateContactEntity {
  int id;
  int id_user;

  ContactEntity(
      {required super.nickname,
      required super.email,
      required super.phone,
      required super.bankname,
      required super.account,
      required this.id,
      required this.id_user});
}
