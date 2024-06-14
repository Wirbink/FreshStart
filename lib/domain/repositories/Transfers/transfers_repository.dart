import 'package:fresh_start/domain/models/Transfers/transfers_model.dart';

abstract class TransfersRepository {
  Future<TransfersModel> loadTransfersData();
}