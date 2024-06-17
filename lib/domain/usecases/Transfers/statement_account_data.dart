import 'package:fresh_start/domain/models/Transfers/statement_account_model.dart';
import 'package:fresh_start/domain/repositories/Transfers/statement_repository.dart';

class StatementAccountData {
  final StatementRepository repository;

  StatementAccountData(this.repository);

  Future<StatementAccountModel> call() async {
    final statementAccountData = await repository.loadStatementAccountData();

    _validateStatementAccountData(statementAccountData);

    return statementAccountData;
  }

  void _validateStatementAccountData(StatementAccountModel data) {
    if (data.clabeAccount.isEmpty || data.clabeAccount.length != 18) {
      throw Exception('Invalid CLABE account: ${data.clabeAccount}');
    }
    if (data.cardNumberAccount.isEmpty || data.cardNumberAccount.length != 16) {
      throw Exception('Invalid card number account: ${data.cardNumberAccount}');
    }
    if (data.amountAccount < 0) {
      throw Exception('Account amount cannot be negative: ${data.amountAccount}');
    }
  }
}
