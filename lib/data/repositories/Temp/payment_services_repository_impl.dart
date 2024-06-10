import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/payment_services_model.dart';
import 'package:fresh_start/domain/repositories/Temp/payment_services_repository.dart';

class PaymentServicesRepositoryImpl implements PaymentServicesRepository{
  @override
  Future<PaymentServicesModel> loadPaymentServicesData() async {
  final response = await rootBundle.loadString("assets/json_data/user.json");
  final data = json.decode(response);
  print(data);
  return PaymentServicesModel.fromJson(data);
  }
}