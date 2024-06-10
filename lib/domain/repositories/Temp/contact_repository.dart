import 'package:fresh_start/domain/models/Temp/contact_model.dart';

abstract class ContactRepository{
  Future<ContactModel> loadContactData();
}