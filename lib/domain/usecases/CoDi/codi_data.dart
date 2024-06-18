import 'package:fresh_start/domain/models/CoDi/codi_model.dart';
import 'package:fresh_start/domain/repositories/CoDi/codi_repository.dart';

class CodiData {
  final CodiRepository repository;

  CodiData(this.repository);

  Future<CodiModel> call() async {
    final codiData = await repository.loadCodiData();

    _validateCodiData(codiData);

    return codiData;
  }

  void _validateCodiData(CodiModel codiData) {
    if (!_isValidCardNumber(codiData.cardNumber)) {
      throw Exception('Invalid card number');
    }
    if (!_isValidBalance(codiData.balance)) {
      throw Exception('Invalid balance');
    }
    if (!_isValidVencimiento(codiData.vencimiento)) {
      throw Exception('Invalid expiration date');
    }
    if (!_isValidCVV(codiData.cvv)) {
      throw Exception('Invalid CVV');
    }
    if (!_isValidAmount(codiData.amount)) {
      throw Exception('Invalid amount');
    }
    if (codiData.concept.isEmpty) {
      throw Exception('Sender cannot be empty');
    }
  }

  bool _isValidCardNumber(String cardNumber) {
    String cardNumberWithoutSpace = cardNumber.replaceAll(" ", "");
    // Validate card number (e.g., Luhn algorithm)
    return cardNumberWithoutSpace.length == 16; // Simplified example
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