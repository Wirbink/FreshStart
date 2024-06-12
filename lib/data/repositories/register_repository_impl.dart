import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/register_model.dart';
import 'package:fresh_start/domain/repositories/rergister_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository{
  @override
  Future<RegisterModel> loadRegister() async {
    final response = await rootBundle.loadString('assets/json_data/register.json');
    final data = json.decode(response);
    print(data);
    return RegisterModel.fromJson(data);
  }
}