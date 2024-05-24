import "package:fresh_start/domain/models/amount_cash_express_model.dart";

abstract class AmountCashExpressRepository{
  Future<AmountCashExpressModel> loadAmountCashExpressData();
}