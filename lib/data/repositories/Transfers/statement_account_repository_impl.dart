import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Transfers/statement_account_model.dart';
import 'package:fresh_start/domain/repositories/Transfers/statement_repository.dart';

class StatementRepositoryImpl implements StatementRepository {
  @override
  Future<StatementAccountModel> loadStatementAccountData() async {
    final response = await rootBundle
        .loadString('assets/json_data/Transfers/statement_account.json');
    final data = json.decode(response);
    print(data);
    return StatementAccountModel.fromJson(data);
  }
}
