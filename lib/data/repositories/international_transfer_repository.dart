import 'package:fresh_start/domain/models/international_transfer_model.dart';

abstract class InternationalTransferRepository{
  Future<InternationalTransferModel> loadInternationalTransfer();
}