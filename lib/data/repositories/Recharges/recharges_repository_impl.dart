import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Recharges/recharges_model.dart';
import 'package:fresh_start/domain/repositories/Recharges/recharges_repository.dart';

class RechargesRepositoryImpl implements RechargesRepository {
  @override
  Future<RechargesModel> loadRechargesData() async {
    final response = await rootBundle
        .loadString('assets/json_data/Recharges/recharges.json');
    final data = json.decode(response);
    print(data);
    return RechargesModel.fromJson(data);
  }
}
