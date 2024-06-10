import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/user_model.dart';
import 'package:fresh_start/domain/repositories/Temp/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  @override
  Future<UserModel> loadUserData() async {
  final response = await rootBundle.loadString("assets/json_data/user.json");
  final data = json.decode(response);
  print(data);
  return UserModel.fromJson(data);
  }
}