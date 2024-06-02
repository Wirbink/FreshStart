import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/account_status_model.dart';
import 'package:fresh_start/domain/repositories/account_status_repository.dart';

class AccountStatusRepositoryImpl implements AccountStatusRepository{
  @override
  Future<AccountStatusModel> loadAccountStatusData() async {
  final response = await rootBundle.loadString("assets/json_data/account_status.json");
  final data = json.decode(response);
  print(data);
  return AccountStatusModel.fromJson(data);
  }
}