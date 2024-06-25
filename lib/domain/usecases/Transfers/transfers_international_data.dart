import 'package:fresh_start/domain/models/Transfers/transfers_international_model.dart';
import 'package:fresh_start/domain/repositories/Transfers/transfers_international_repository.dart';

class TransfersInternationalData {
  final TransfersInternationalRepository repository;

  TransfersInternationalData(this.repository);

  Future<TransfersInternationalModel> call() async {
    final transfersInternationalData = await repository.loadTransfersInternationalData();

    _validateTransfersInternationalData(transfersInternationalData);

    return transfersInternationalData;
  }

  void _validateTransfersInternationalData(TransfersInternationalModel data) {
    if (data.senderName.isEmpty) {
      throw Exception('Sender name cannot be empty');
    }

    String cardNumberWithoutSpaces = data.cardNumber.replaceAll(" ", "");
    if (cardNumberWithoutSpaces.isEmpty ||  cardNumberWithoutSpaces.length != 16) {
      throw Exception('Invalid card number: ${data.cardNumber}');
    }
    if (data.date.isAfter(DateTime.now())) {
      throw Exception('Date cannot be in the future: ${data.date}');
    }
    if (data.recipientName.isEmpty) {
      throw Exception('Recipient name cannot be empty');
    }

    String cardNumberRecipientWithoutSpaces = data.cardNumberRecipient.replaceAll(" ", "");
    if (cardNumberRecipientWithoutSpaces.isEmpty || cardNumberRecipientWithoutSpaces.length != 16) {
      throw Exception('Invalid recipient card number: ${data.cardNumberRecipient}');
    }
    if (data.currencyConvert.isEmpty) {
      throw Exception('Currency convert cannot be empty');
    }
    if (data.amountConvert <= 0) {
      throw Exception('Amount convert must be greater than zero: ${data.amountConvert}');
    }
    if (data.currency.isEmpty) {
      throw Exception('Currency cannot be empty');
    }
    if (data.equivalent <= 0) {
      throw Exception('Equivalent must be greater than zero: ${data.equivalent}');
    }
    if (data.comission < 0) {
      throw Exception('Commission cannot be negative: ${data.comission}');
    }
    if (data.amount <= 0) {
      throw Exception('Amount must be greater than zero: ${data.amount}');
    }
    if (data.concept.isEmpty) {
      throw Exception('Convert cannot be empty');
    }
  }
}
