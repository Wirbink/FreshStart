

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/contact_model.dart';
import 'package:fresh_start/domain/repositories/Temp/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository{
  @override
  Future<ContactModel> loadContactData() async {
  final response = await rootBundle.loadString("assets/json_data/contact.json");
  final data = json.decode(response);
  print(data);
  return ContactModel.fromJson(data);
  }
}