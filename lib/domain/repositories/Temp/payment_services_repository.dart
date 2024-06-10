import 'package:fresh_start/domain/models/Temp/payment_services_model.dart';

abstract class PaymentServicesRepository{
  Future<PaymentServicesModel> loadPaymentServicesData();
}