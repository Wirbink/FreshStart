import 'package:fresh_start/domain/models/Recharges/recharges_model.dart';
import 'package:fresh_start/domain/repositories/Recharges/recharges_repository.dart';

class RechargesData {
  final RechargesRepository repository;

  RechargesData(this.repository);

  Future<RechargesModel> call() async {
    final rechargesData = await repository.loadRechargesData();

    _validateRechargesData(rechargesData);

    return rechargesData;
  }
  
  void _validateRechargesData(RechargesModel rechargesData) {
    if (rechargesData.name.isEmpty) {
      throw Exception('El nombre no puede estar vacío.');
    }

    if (rechargesData.cardNumber.length != 16 || !RegExp(r'^[0-9]+$').hasMatch(rechargesData.cardNumber)) {
      throw Exception('El número de tarjeta debe tener 16 dígitos.');
    }

    if (rechargesData.date.isAfter(DateTime.now())) {
      throw Exception('La fecha no puede ser en el futuro.');
    }

    const validTypes = ['Timepo Aire', 'Plan Prepago', 'Plan Postpago'];
    if (!validTypes.contains(rechargesData.type)) {
      throw Exception('El tipo no es válido.');
    }

    if (!RegExp(r'^\+?\d{10,15}$').hasMatch(rechargesData.phoneNumber)) {
      throw Exception('El número de teléfono no es válido.');
    }

    const validPayments = ['FreshStart'];
    if (!validPayments.contains(rechargesData.payment)) {
      throw Exception('El método de pago no es válido.');
    }

    if (rechargesData.amount <= 0) {
      throw Exception('La cantidad debe ser mayor que cero.');
    }
  }
}
