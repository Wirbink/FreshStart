
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/company_model.dart';
import 'package:fresh_start/domain/repositories/Temp/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository{
  @override
  Future<CompanyModel> loadCompanyData() async {
  final response = await rootBundle.loadString("assets/json_data/user.json");
  final data = json.decode(response);
  print(data);
  return CompanyModel.fromJson(data);
  }
}