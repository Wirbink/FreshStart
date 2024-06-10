import 'package:fresh_start/domain/models/Temp/bank_account_model.dart';

abstract class BankAccountRepository{
  Future<BankAccountModel> loadBankAccountData();
}