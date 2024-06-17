import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/CashExpress/cash_express_model.dart';

class CashExpressState extends Equatable {
  final String cardNumber;
  final double balance;
  final String vencimiento;
  final String cvv;
  final double amount;
  final String sender;
  final String senderAccount;
  final DateTime date;
  final String withdrawalKey;
  final String securityCode;

  CashExpressState({
    this.cardNumber = '',
    this.balance = 100.00,
    this.vencimiento = '',
    this.cvv = '',
    this.amount = 500.0,
    this.sender = '',
    this.senderAccount = '',
    this.withdrawalKey = '',
    this.securityCode = '',
    DateTime? date,
  }) : date = date ?? DateTime(2024, 6, 17, 10, 30);

  factory CashExpressState.fromModel(CashExpressModel model) {
    return CashExpressState(
        cardNumber: model.cardNumber,
        balance: model.balance,
        vencimiento: model.vencimiento,
        cvv: model.cvv,
        amount: model.amount,
        sender: model.sender,
        senderAccount: model.senderAccount,
        withdrawalKey: model.withdrawalKey,
        securityCode: model.securityCode);
  }

  CashExpressState copyWith(
      {String? cardNumber,
      double? balance,
      String? vencimiento,
      String? cvv,
      double? amount,
      String? sender,
      String? senderAccount,
      DateTime? date,
      String? withdrawalKey,
      String? securityCode,
      bool? isValid}) {
    return CashExpressState(
        cardNumber: this.cardNumber,
        balance: this.balance,
        vencimiento: this.vencimiento,
        cvv: this.cvv,
        amount: this.amount,
        sender: this.sender,
        senderAccount: this.senderAccount,
        date: this.date,
        withdrawalKey: this.withdrawalKey,
        securityCode: this.securityCode);
  }

  @override
  List<Object> get props => [
        cardNumber,
        balance,
        vencimiento,
        cvv,
        amount,
        sender,
        senderAccount,
        date,
        withdrawalKey,
        securityCode
      ];
}
