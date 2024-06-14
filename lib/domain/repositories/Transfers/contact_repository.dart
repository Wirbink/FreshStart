import 'package:fresh_start/domain/models/Transfers/contact_model.dart';

abstract class ContactRepository {
  Future<List<ContactModel>> loadContactsData();
}