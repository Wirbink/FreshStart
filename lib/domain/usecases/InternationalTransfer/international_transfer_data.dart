import 'package:fresh_start/data/repositories/international_transfer_repository.dart';
import 'package:fresh_start/domain/models/international_transfer_model.dart';

class InternationalTransferData {
  final InternationalTransferRepository repository;

  InternationalTransferData(this.repository);

  Future<InternationalTransferModel> call() async {
    final internationalTransferData =
        await repository.loadInternationalTransfer();
    final clabeRegex = RegExp(r'^[0-9]{18}$');
    final charactersLimitRegex = RegExp(r'^[a-zA-Z]{0,50}$');
    final currencyFormatRegex = RegExp(r'^[A-Z]{3}$');

    String accountNumberRecipientWhitoutSpaces =
        internationalTransferData.recipient.accountNumber.trim();
    String accountNumberSenderWhitoutSpaces =
        internationalTransferData.sender.accountNumber.trim();

    if (internationalTransferData.transactionDate == null) {
      throw Exception("La fecha no puede estar vacía");
    }

    //Sender

    if (internationalTransferData.sender.accountNumber.isEmpty) {
      throw Exception("CLABE del remitente no puede estar vacía");
    }

    if (!clabeRegex.hasMatch(accountNumberSenderWhitoutSpaces)) {
      throw Exception("Solo debe contener 18 dígitos y deben ser solo numeros");
    }

    if (internationalTransferData.sender.name.isEmpty) {
      throw Exception("El nombre no puede estar vacío");
    }

    if (!charactersLimitRegex.hasMatch(internationalTransferData.sender.name)) {
      throw Exception("Solo debe contener caracteres y máximo 50");
    }

    if (internationalTransferData.sender.lastName.isEmpty) {
      throw Exception("El apellido no puede estar vacío");
    }

    if (!charactersLimitRegex
        .hasMatch(internationalTransferData.sender.lastName)) {
      throw Exception("Solo debe contener caracteres y máximo 50");
    }

    if (internationalTransferData.sender.bankName.isEmpty) {
      throw Exception("El nombre del banco no puede estar vacío");
    }

    if (!charactersLimitRegex
        .hasMatch(internationalTransferData.sender.bankName)) {
      throw Exception("Solo debe contener caracteres y máximo 50");
    }

    //Recipient
    if (internationalTransferData.recipient.accountNumber.isEmpty) {
      throw Exception("CLABE del remitente no puede estar vacía");
    }

    if (!clabeRegex.hasMatch(accountNumberRecipientWhitoutSpaces)) {
      throw Exception("Solo debe contener 18 dígitos y deben ser solo numeros");
    }

    if (internationalTransferData.recipient.name.isEmpty) {
      throw Exception("El nombre no puede estar vacío");
    }

    if (!charactersLimitRegex
        .hasMatch(internationalTransferData.recipient.name)) {
      throw Exception("Solo debe contener caracteres y máximo 50");
    }

    if (internationalTransferData.recipient.lastName.isEmpty) {
      throw Exception("El apellido no puede estar vacío");
    }

    if (!charactersLimitRegex
        .hasMatch(internationalTransferData.recipient.lastName)) {
      throw Exception("Solo debe contener caracteres y máximo 50");
    }

    if (internationalTransferData.recipient.bankName.isEmpty) {
      throw Exception("El nombre del banco no puede estar vacío");
    }

    if (charactersLimitRegex
        .hasMatch(internationalTransferData.recipient.bankName)) {
      throw Exception("Solo debe contener caracteres y máximo 50");
    }

    //amount
    if (internationalTransferData.amount.currency.isEmpty) {
      throw Exception("La divisa no puede estar vacía");
    }

    if (!currencyFormatRegex.hasMatch(internationalTransferData.amount.currency)){
      throw Exception("No cumple con el formato de divisa. Ejemplo 'MXN' ");
    }

    if (internationalTransferData.amount.value == null){
      throw Exception("El monto no puede ser nulo");
    }

    //ExchaangeRate

    if (internationalTransferData.exchangeRate == null){
      throw Exception("El valor de cambio no puede ser nulo");
    }

    return internationalTransferData;
  }
}
