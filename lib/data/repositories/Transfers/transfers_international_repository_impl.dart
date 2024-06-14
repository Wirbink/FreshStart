import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_international_model.dart';
import 'package:fresh_start/domain/repositories/Transfers/transfers_international_repository.dart';

class TransfersInternationalRepositoryImpl implements TransfersInternationalRepository {
  @override
  Future<TransfersInternationalModel> loadTransfersInternationalData() async {
    final response = await rootBundle.loadString('assets/json_data/Transfers/international_transferss.json');
    final data = json.decode(response);
    print(data);
    return TransfersInternationalModel.fromJson(data);
  }
}