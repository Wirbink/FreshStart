import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/codi_model.dart';
import 'package:fresh_start/domain/repositories/Temp/codi_repository.dart';

class CodiRepositoryImpl implements CodiRepository{
  @override
  Future<CodiModel> loadCodiData() async {
  final response = await rootBundle.loadString("assets/json_data/user.json");
  final data = json.decode(response);
  print(data);
  return CodiModel.fromJson(data);
  }
}