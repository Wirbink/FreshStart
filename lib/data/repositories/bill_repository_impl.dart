import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/bill_model.dart';
import 'package:fresh_start/domain/repositories/bill_repository.dart';

class BillRepositoryImpl implements BillRepository{
  @override
  Future<BillModel> loadBillData() async {
    final response = await rootBundle.loadString("");
    final data = json.decode(response);
    print(data);
    return BillModel.fromJson(data);
  }
}