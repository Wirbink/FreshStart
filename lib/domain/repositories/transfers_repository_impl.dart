import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/data/repositories/transfers_repository.dart';
import 'package:fresh_start/domain/models/send_money_model.dart';

class TransfersRepositoryImpl implements TransfersRepository{
  @override
  Future<SendMoneyModel> loadTransfer() async {
    final response = await rootBundle.loadString('assets/json_data/Transfers/transfers_data.json');
    final data = json.decode(response);
    print(data);
    return SendMoneyModel.fromJson(data);
  }
}