import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Auth/register_model.dart';
import 'package:fresh_start/domain/repositories/Auth/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  @override
  Future<RegisterModel> loadRegisterData() async {
    final response = await rootBundle.loadString('assets/json_data/Auth/register.data');
    final data = json.decode(response);
    print(data);
    return RegisterModel.fromJson(data);
  }
}