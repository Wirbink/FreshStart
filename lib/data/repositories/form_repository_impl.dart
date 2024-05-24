import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Recharges/rechargesdata.dart';
import 'package:fresh_start/domain/repositories/recharge_repository.dart';

class RepositoryImpl implements RechargeRepository{
  @override
  Future<RechargeModel> loadFormData() async{
    final response = await rootBundle.loadString("assets/json_data/Recharges/service__number.json");
    final data = json.decode(response);
    print(data);
    return RechargeModel.fromJson(data);
  }
}