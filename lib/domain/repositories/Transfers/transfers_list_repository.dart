import 'package:fresh_start/domain/models/Transfers/transfers_registration.dart';

abstract class TransfersRegistrationRepository {
  Future<List<TransfersRegistrationModel>?> loadTransfersRegistrationData();
  Future<TransfersRegistrationModel?> loadTransfer(int id);
}