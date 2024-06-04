import 'package:fresh_start/domain/models/Recharges/rechargesdata.dart';

abstract class RechargeRepository{
  Future<RechargeModel> loadFormData();
}