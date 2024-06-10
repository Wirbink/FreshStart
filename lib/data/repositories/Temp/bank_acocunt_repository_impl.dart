import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/bank_account_model.dart';
import 'package:fresh_start/domain/repositories/Temp/bank_account_repository.dart';

class BankAcocuntRepositoryImpl implements BankAccountRepository{
  @override
  Future<BankAccountModel> loadBankAccountData() async {
  final response = await rootBundle.loadString("assets/json_data/bankAccount.json");
  final data = json.decode(response);
  print(data);
  return BankAccountModel.fromJson(data);
  }
}