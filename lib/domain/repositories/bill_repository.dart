import 'package:fresh_start/domain/repositories/bill_repository.dart';
import 'package:fresh_start/domain/models/bill_model.dart';

abstract class BillRepository{
  Future<BillModel> loadBillData();
}