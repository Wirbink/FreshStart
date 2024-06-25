import 'package:fresh_start/domain/models/Transfers/transfers_model.dart';
import 'package:fresh_start/domain/repositories/Transfers/transfers_repository.dart';

class TransfersData {
  final TransfersRepository repository;

  TransfersData(this.repository);

  Future<TransfersModel> call() async {
    final transfersData = await repository.loadTransfersData();

    _validateTransferData(transfersData);

    return transfersData;
  }

  void _validateTransferData(TransfersModel data) {
    if (data.bankName.isEmpty) {
      throw Exception('Bank name cannot be empty');
    }
    if (data.senderName.isEmpty) {
      throw Exception('Sender name cannot be empty');
    }

    String cardNumberWitoutSpaces = data.cardNumber.replaceAll(" ", "");
    if (data.cardNumber.isEmpty || cardNumberWitoutSpaces.length != 16) {
      throw Exception('Invalid card number: ${data.cardNumber}');
    }
    if (data.date.isAfter(DateTime.now())) {
      throw Exception('Date cannot be in the future: ${data.date}');
    }
    if (data.recipientName.isEmpty) {
      throw Exception('Recipient name cannot be empty');
    }

    String cardNumberRecipientWitoutSpaces = data.cardNumberRecipient.replaceAll(" ", "");
    if (data.cardNumberRecipient.isEmpty || cardNumberRecipientWitoutSpaces.length != 16) {
      throw Exception('Invalid recipient card number: ${data.cardNumberRecipient}');
    }
    if (data.amount <= 0) {
      throw Exception('Amount must be greater than zero: ${data.amount}');
    }
    if (data.concept.isEmpty) {
      throw Exception('Concept cannot be empty');
    }
  }
}
