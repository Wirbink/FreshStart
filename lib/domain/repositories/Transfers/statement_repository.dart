import 'package:fresh_start/domain/models/Transfers/statement_account_model.dart';

abstract class StatementRepository {
  Future<StatementAccountModel> loadStatementAccountData();
}