import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/recharge_model.dart';
import 'package:fresh_start/domain/repositories/Temp/recharge_repository.dart';

class RechargeRepositoryImpl implements RechargeRepository{
  @override
  Future<RechargeModel> loadRechargeData() async {
  final response = await rootBundle.loadString("assets/json_data/recharge.json");
  final data = json.decode(response);
  print(data);
  return RechargeModel.fromJson(data);
  }
}