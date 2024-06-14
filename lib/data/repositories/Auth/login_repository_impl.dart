import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Auth/login_model.dart';
import 'package:fresh_start/domain/repositories/Auth/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginModel> loadLoginData() async {
    final response = await rootBundle.loadString('assets/json_data/Auth/login.json');
    final data = json.decode(response);
    print(data);
    return LoginModel.fromJson(data);
  }
}