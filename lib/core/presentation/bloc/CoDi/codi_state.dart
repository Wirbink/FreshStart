import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/CoDi/codi_model.dart';

class CodiState extends Equatable {
  final String cardNumber;
  final double balance;
  final String vencimiento;
  final String cvv;
  final double amount;
  final String sender;

  const CodiState({
    this.cardNumber = '',
    this.balance = 32524.36,
    this.vencimiento = '',
    this.cvv = '',
    this.amount = 0,
    this.sender = '',
  });

  factory CodiState.fromModel(CodiModel model) {
    return CodiState(
        cardNumber: model.cardNumber,
        balance: model.balance,
        vencimiento: model.vencimiento,
        cvv: model.cvv,
        amount: model.amount,
        sender: model.sender);
  }

  CodiState copyWith({
    String? cardNumber,
    double? balance,
    String? vencimiento,
    String? cvv,
    double? amount,
    String? sender,
    bool? isValid
  }) {
    return CodiState(
        cardNumber: cardNumber ?? this.cardNumber,
        balance: balance ?? this.balance,
        vencimiento: vencimiento ?? this.vencimiento,
        cvv: cvv ?? this.cvv,
        amount: amount ?? this.amount,
        sender: sender ?? this.sender);
  }

  @override
  List<Object> get props =>
      [cardNumber, balance, vencimiento, cvv, amount, sender];
}
