import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Transfers/contact_model.dart';
import 'package:fresh_start/domain/repositories/Transfers/contact_repository.dart';

class ContactsRepositoryImpl implements ContactRepository {
  @override
  Future<List<ContactModel>> loadContactsData() async {
    final response =
        await rootBundle.loadString('json_data/Transfers/contacts.json');
    final data =
        json.decode(response) as List<dynamic>; // Cast to List<dynamic>
    if (data == null || data.isEmpty) {
      throw Exception(
          'Error loading contacts data. Please check the JSON file.');
    }

    final contacts =
        data.map((contact) => ContactModel.fromJson(contact)).toList();
    print(contacts);
    return contacts;
  }
}
