import 'package:fresh_start/domain/models/PaymentServices/payment_services_model.dart';
import 'package:fresh_start/domain/repositories/PaymentServices/payment_services.dart';

class PaymentServicesData {
  final PaymentServicesRepository repository;

  PaymentServicesData(this.repository);

  Future<PaymentServicesModel> call() async {
    final paymentServicesData = await repository.loadPaymentServicesData();

    _validatePaymentServicesData(paymentServicesData);

    return paymentServicesData;
  }
  
  void _validatePaymentServicesData(PaymentServicesModel paymentServicesData) {
    if (paymentServicesData.name.isEmpty) {
      throw Exception('El nombre no puede estar vacío');
    }
    if (paymentServicesData.cardNumber.isEmpty || paymentServicesData.cardNumber.length != 16) {
      throw Exception('El número de tarjeta es inválido');
    }
    if (!_isValidDate(paymentServicesData.date)) {
      throw Exception('La fecha es inválida');
    }
    if (paymentServicesData.serviceName.isEmpty) {
      throw Exception('El nombre del servicio no puede estar vacío');
    }
    if (paymentServicesData.serviceReference.isEmpty) {
      throw Exception('La referencia del servicio no puede estar vacía');
    }
    if (paymentServicesData.amount <= 0) {
      throw Exception('El monto debe ser mayor a cero');
    }
  }

  bool _isValidDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return parsedDate.isBefore(DateTime.now());
    } catch (e) {
      return false;
    }
  }
}
