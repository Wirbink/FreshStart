import 'package:fresh_start/domain/models/Transfers/transfers_international_model.dart';

abstract class TransfersInternationalRepository {
  Future<TransfersInternationalModel> loadTransfersInternationalData();
}