import 'package:fresh_start/data/repositories/transfers_repository.dart';
import 'package:fresh_start/domain/models/send_money_model.dart';

class SendModelData {
  final TransfersRepository repository;

  SendModelData(this.repository);

  Future<SendMoneyModel> call() async {
    final sendModelData = await repository.loadTransfer();

    if (sendModelData.adresseeName.isEmpty) {
      throw Exception("El nombre del destinatario no puede estar vacío");
    }
    if (sendModelData.clabe == null || sendModelData.clabe == 0) {
      throw Exception("La CLABE no puede estar vacía");
    }
    if (sendModelData.amount == null || sendModelData.amount == 0) {
      throw Exception("El monto no puede estar vacío");
    }
    if (sendModelData.nameCard.isEmpty) {
      throw Exception(
          "Debes seleccionar una tarjeta para realizar la transacción");
    }
    return sendModelData;
  }
}
