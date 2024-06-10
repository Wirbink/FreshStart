import 'package:fresh_start/domain/models/Temp/recharge_model.dart';

abstract class RechargeRepository{
  Future<RechargeModel> loadRechargeData();
}