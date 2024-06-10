import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/transaction_international_model.dart';
import 'package:fresh_start/domain/repositories/Temp/transaction_international_repository.dart';

class TransactionInternationalRepositoryImpl implements TransactionInternationalRepository{
  @override
  Future<TransactionInternationalModel> loadTransactionInternationalData() async {
  final response = await rootBundle.loadString("assets/json_data/transaction_international.json");
  final data = json.decode(response);
  print(data);
  return TransactionInternationalModel.fromJson(data);
  }
}