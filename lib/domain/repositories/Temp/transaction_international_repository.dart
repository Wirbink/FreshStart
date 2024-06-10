import 'package:fresh_start/domain/models/Temp/transaction_international_model.dart';

abstract class TransactionInternationalRepository{
  Future<TransactionInternationalModel> loadTransactionInternationalData();
}