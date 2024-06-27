import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/CashExpress/cash_express_model.dart';
import 'package:fresh_start/domain/repositories/CashExpress/cash_express_repository.dart';

class CashExpressRepositoryImpl implements CashExpressRepository {
  @override
  Future<CashExpressModel> loadCashExpressData() async {
    final response = await rootBundle.loadString('assets/json_data/CashExpress/cash_express.json');
    print("response");
    print(response);
    final data = json.decode(response);
    print(data);
    return CashExpressModel.fromJson(data);
  }
}