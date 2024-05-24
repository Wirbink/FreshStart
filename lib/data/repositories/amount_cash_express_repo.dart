import "dart:convert";

import "package:flutter/services.dart";
import "package:fresh_start/domain/models/amount_cash_express_model.dart";
import "package:fresh_start/domain/repositories/amount_cash_express_repo.dart";

class AmountCashExpressRepositoryImpl implements AmountCashExpressRepository {
  @override
  Future<AmountCashExpressModel> loadAmountCashExpressData() async {
    final response = await rootBundle.loadString("assets/json_data/cash_express_data.json");
    final data = json.decode(response);
    return AmountCashExpressModel.amountJson(data);
  }
}