

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/bank_model.dart';
import 'package:fresh_start/domain/repositories/Temp/bank_repository.dart';

class BankRepositoryImpl implements BankRepository{
  @override
  Future<BankModel> loadBankData() async {
  final response = await rootBundle.loadString("assets/json_data/bankAccount.json");
  final data = json.decode(response);
  print(data);
  return BankModel.fromJson(data);
  }
}