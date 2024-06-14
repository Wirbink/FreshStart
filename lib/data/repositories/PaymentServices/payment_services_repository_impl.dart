import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/PaymentServices/payment_services_model.dart';
import 'package:fresh_start/domain/repositories/PaymentServices/payment_services.dart';

class PaymentServicesRepositoryImpl implements PaymentServicesRepository {
  @override
  Future<PaymentServicesModel> loadPaymentServicesData() async {
    final response = await rootBundle.loadString('assets/json_data/PaymentServices/payment_services.json');
    final data = json.decode(response);
    print(data);
    return PaymentServicesModel.fromJson(data);
  }
}