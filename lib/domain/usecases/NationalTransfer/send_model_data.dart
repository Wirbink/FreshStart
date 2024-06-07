import 'package:fresh_start/data/repositories/transfers_repository.dart';
import 'package:fresh_start/domain/models/send_money_model.dart';

class SendModelData {
  final TransfersRepository repository;
  final bool isAuthenticated;

  SendModelData(this.repository, {required this.isAuthenticated});

  Future<SendMoneyModel> call() async {
    if (!isAuthenticated) {
      throw Exception("El usuario no está autenticado");
    }

    final sendModelData = await repository.loadTransfer();

    if (sendModelData.adresseeName.isEmpty) {
      throw Exception("El nombre del destinatario no puede estar vacío");
    }
    if (sendModelData.adresseeName.length < 3 ||
        sendModelData.adresseeName.length > 50) {
      throw Exception(
          "El nombre del destinatario debe tener entre 3 y 50 caracteres");
    }
    if (!sendModelData.adresseeName.contains(RegExp(r'^[a-zA-Z]+$'))) {
      throw Exception("El nombre del destinatario solo puede contener letras");
    }

    if (sendModelData.clabe == null) {
      throw Exception("La CLABE no puede estar vacía");
    }
    String clabeString = sendModelData.clabe.toString();
    if (clabeString.length != 18) {
      throw Exception("La CLABE debe contener exactamente 18 dígitos");
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(clabeString)) {
      throw Exception("La CLABE solo puede contener dígitos numéricos");
    }

    if (sendModelData.amount == null || sendModelData.amount! <= 0) {
      throw Exception("El monto debe ser mayor que cero");
    }

    if (sendModelData.nameCard.isEmpty) {
      throw Exception(
          "Debes seleccionar una tarjeta para realizar la transacción");
    }
    if (sendModelData.nameCard.length < 6 ||
        sendModelData.nameCard.length > 50) {
      throw Exception(
          "El nombre de la tarjeta debe tener entre 6 y 50 caracteres");
    }
    if (!sendModelData.nameCard.contains(RegExp(r'^[a-zA-Z]+$'))) {
      throw Exception("El nombre de la tarjeta solo puede contener letras");
    }
    return sendModelData;
  }
}
