import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:fresh_start/data/repositories/international_transfer_repository.dart';
import 'package:fresh_start/domain/models/international_transfer_model.dart';

class InternationalTransferRepositoryImpl implements InternationalTransferRepository{
  @override
  Future<InternationalTransferModel> loadInternationalTransfer() async {
    final response = await rootBundle.loadString('assets/json_data/InternationalTransfers/international_transaction.json');
    final data = json.decode(response);
    print(data);
    return InternationalTransferModel.fromJson(data);
  }
}