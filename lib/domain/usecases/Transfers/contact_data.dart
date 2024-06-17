import 'package:fresh_start/domain/models/Transfers/contact_model.dart';
import 'package:fresh_start/domain/repositories/Transfers/contact_repository.dart';

class ContactData {
  final ContactRepository repository;

  ContactData(this.repository);

  Future<List<ContactModel>> fetchContactData() async {
    final contactData = await repository.loadContactsData();

    for (var contact in contactData) {
      _validateContact(contact);
    }

    return contactData;
  }

  void _validateContact(ContactModel contact) {
    if (contact.clabe.isEmpty || contact.clabe.length != 18) {
      throw Exception('Invalid CLABE: ${contact.clabe}');
    }
    if (contact.cardNumber.isEmpty || contact.cardNumber.length != 16) {
      throw Exception('Invalid Card Number: ${contact.cardNumber}');
    }
    if (contact.spent < 0) {
      throw Exception('Spent amount cannot be negative: ${contact.spent}');
    }
    if (contact.date.isAfter(DateTime.now())) {
      throw Exception('Date cannot be in the future: ${contact.date}');
    }
    if (contact.bill.isEmpty) {
      throw Exception('Bill cannot be empty');
    }
    if (contact.voucher.isEmpty) {
      throw Exception('Voucher cannot be empty');
    }
  }
}
