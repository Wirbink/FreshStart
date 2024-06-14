import 'package:fresh_start/domain/models/CashExpress/cash_express_model.dart';

abstract class CashExpressRepository {
  Future<CashExpressModel> loadCashExpressData();
}