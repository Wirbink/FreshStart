import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/data/repositories/login_repository.dart';
import 'package:fresh_start/domain/models/login_model.dart';

class LoginRepositoryImpl implements LoginRepository{
  @override
  Future<LoginModel> loadLogin() async {
    final response = await rootBundle.loadString('assets/json_data/login.json');
    final data = json.decode(response);
    print(data);
    return LoginModel.fromJson(data);
  }
}