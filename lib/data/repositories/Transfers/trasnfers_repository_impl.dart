import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_model.dart';
import 'package:fresh_start/domain/repositories/Transfers/transfers_repository.dart';

class TrasnfersRepositoryImpl implements TransfersRepository {
  @override
  Future<TransfersModel> loadTransfersData() async {
    final response =
        await rootBundle.loadString('json_data/Transfers/transfers.json');
    final data = json.decode(response);
    print(data);
    return TransfersModel.fromJson(data);
  }
}
