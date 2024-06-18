import 'package:fresh_start/domain/models/CashExpress/cash_express_model.dart';
import 'package:fresh_start/domain/repositories/CashExpress/cash_express_repository.dart';

class CashExpressData {
  final CashExpressRepository repository;

  CashExpressData(this.repository);

  Future<CashExpressModel> call() async {
    final cashExpressData = await repository.loadCashExpressData();

    _validateCashExpressData(cashExpressData);

    return cashExpressData;
  }

  void _validateCashExpressData(CashExpressModel cashExpressData) {
    if (!_isValidCardNumber(cashExpressData.cardNumber)) {
      throw Exception('Invalid card number');
    }
    if (!_isValidBalance(cashExpressData.balance)) {
      throw Exception('Invalid balance');
    }
    if (!_isValidVencimiento(cashExpressData.vencimiento)) {
      throw Exception('Invalid expiration date');
    }
    if (!_isValidCVV(cashExpressData.cvv)) {
      throw Exception('Invalid CVV');
    }
    if (!_isValidAmount(cashExpressData.amount)) {
      throw Exception('Invalid amount');
    }
    if (cashExpressData.sender.isEmpty) {
      throw Exception('Sender cannot be empty');
    }
    if (cashExpressData.senderAccount.isEmpty) {
      throw Exception('Sender account cannot be empty');
    }
    if (cashExpressData.date.isAfter(DateTime.now())) {
      throw Exception('Date cannot be in the future');
    }
    if (cashExpressData.withdrawalKey.isEmpty) {
      throw Exception('Withdrawal key cannot be empty');
    }
    if (cashExpressData.securityCode.isEmpty) {
      throw Exception('Security code cannot be empty');
    }
  }

  bool _isValidCardNumber(String cardNumber) {
    String cardNumberWithoutSpace = cardNumber.replaceAll(" ", "");
    // Validate card number
    return cardNumberWithoutSpace.length == 16;
  }

  bool _isValidBalance(double balance) {
    return balance >= 0;
  }

  bool _isValidVencimiento(String vencimiento) {
    // Validate expiration date format (e.g., MM/YY)
    final regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    return regex.hasMatch(vencimiento);
  }

  bool _isValidCVV(String cvv) {
    // Validate CVV (e.g., 3 or 4 digits)
    final regex = RegExp(r'^\d{3,4}$');
    return regex.hasMatch(cvv);
  }

  bool _isValidAmount(double amount) {
    return amount > 0;
  }
}
