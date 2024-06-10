import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/status_account_model.dart';
import 'package:fresh_start/domain/repositories/Temp/status_account_repository.dart';

class StatusAccountRepositoryImpl implements StatusAccountRepository{
  @override
  Future<StatusAccountModel> loadStatusAccountData() async {
  final response = await rootBundle.loadString("assets/json_data/user.json");
  final data = json.decode(response);
  print(data);
  return StatusAccountModel.fromJson(data);
  }
}