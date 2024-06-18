import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Recharges/recharges_model.dart';

class RechargeState extends Equatable {
  final String name;
  final String cardNumber;
  final DateTime date;
  final String type;
  final String phoneNumber;
  final String payment;
  final double amount;

  RechargeState(
      {this.name = '',
      this.cardNumber = '',
      this.type = '',
      this.phoneNumber = '',
      this.payment = '',
      this.amount = 250.00,
      DateTime? date})
      : date = date ?? DateTime(2024, 6, 9, 19, 52);

  factory RechargeState.fromModel(RechargeState model) {
    return RechargeState(
        name: model.name,
        cardNumber: model.cardNumber,
        type: model.type,
        phoneNumber: model.phoneNumber,
        payment: model.payment,
        amount: model.amount);
  }

  RechargeState copyWith(
      {String? name,
      String? cardNumber,
      DateTime? date,
      String? type,
      String? phoneNumber,
      String? payment,
      double? amount,
      bool? isValid}) {
    return RechargeState(
        name: this.name,
        cardNumber: this.cardNumber,
        date: this.date,
        type: this.type,
        phoneNumber: this.phoneNumber,
        payment: this.payment,
        amount: this.amount);
  }

  @override
  List<Object> get props =>
      [name, cardNumber, date, type, phoneNumber, payment, amount];
}
