import 'package:fresh_start/domain/models/Temp/bank_model.dart';

abstract class BankRepository{
  Future<BankModel> loadBankData();
}