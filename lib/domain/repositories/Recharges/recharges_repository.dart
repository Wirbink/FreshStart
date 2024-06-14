import 'package:fresh_start/domain/models/Recharges/recharges_model.dart';

abstract class RechargesRepository {
  Future<RechargesModel> loadRechargesData();
}