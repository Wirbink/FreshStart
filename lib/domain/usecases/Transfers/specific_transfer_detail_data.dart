import 'package:fresh_start/domain/models/Transfers/transfers_registration.dart';
import 'package:fresh_start/domain/repositories/Transfers/transfers_list_repository.dart';

class SpecificTransferDetailData {
  final TransfersRegistrationRepository repository;
  final int id;

  SpecificTransferDetailData(this.repository, this.id);

  Future<TransfersRegistrationModel> call() async {
    final transfersRegistrationData = await repository.loadTransfer(id);

    _validateTransfer(transfersRegistrationData as TransfersRegistrationModel);

    return transfersRegistrationData;
  }

  void _validateTransfer(TransfersRegistrationModel transfer) {
    if (transfer.amount <= 0) {
      throw Exception('Amount must be greater than zero');
    }

    const maxAmount = 10000000;
    if (transfer.amount > maxAmount) {
      throw Exception('Amount is too high');
    }

    if (transfer.date.isAfter(DateTime.now())) {
      throw Exception('Date cannot be in the future');
    }

    final minDate = DateTime.now()
        .subtract(const Duration(days: 365 * 10)); // No más de 10 años atrás
    if (transfer.date.isBefore(minDate)) {
      throw Exception('Date is too old');
    }

    if (transfer.bill.isEmpty) {
      throw Exception('Bill cannot be empty');
    }

    if (!_isValidBillFormat(transfer.bill)) {
      throw Exception('Invalid bill format');
    }

    const maxBillLength = 30;
    if (transfer.bill.length > maxBillLength) {
      throw Exception('Bill is too long');
    }

    if (transfer.voucher.isEmpty) {
      throw Exception('Voucher cannot be empty');
    }

    if (!_isValidVoucherFormat(transfer.voucher)) {
      throw Exception('Invalid voucher format');
    }

    const maxVoucherLength = 30;
    if (transfer.voucher.length > maxVoucherLength) {
      throw Exception('Voucher is too long');
    }

    if (transfer.paymentMethod.isEmpty) {
      throw Exception('Payment method cannot be empty');
    }

    const validPaymentMethods = ['CreditCard', 'BankTransfer', 'Cash'];
    if (!validPaymentMethods.contains(transfer.paymentMethod)) {
      throw Exception('Invalid payment method');
    }
  }

  bool _isValidBillFormat(String bill) {
    // Formato esperado es un número seguido de letras: "123ABC"
    final regex = RegExp(r'^\d+[A-Za-z]+$');
    return regex.hasMatch(bill);
  }

  bool _isValidVoucherFormat(String voucher) {
    // Formato esperado es alfanumérico: "ABC123XYZ"
    final regex = RegExp(r'^[A-Za-z0-9]+$');
    return regex.hasMatch(voucher);
  }
}
