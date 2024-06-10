import 'package:fresh_start/domain/models/Temp/transaction_model.dart';

abstract class TransactionRepository{
  Future<TransactionModel> loadTransactionData();
}