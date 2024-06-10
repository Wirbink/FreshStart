import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/transaction_model.dart';
import 'package:fresh_start/domain/repositories/Temp/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository{
  @override
  Future<TransactionModel> loadTransactionData() async {
  final response = await rootBundle.loadString("assets/json_data/transaction.json");
  final data = json.decode(response);
  print(data);
  return TransactionModel.fromJson(data);
  }
}