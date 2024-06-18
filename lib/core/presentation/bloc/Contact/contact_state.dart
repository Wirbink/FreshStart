import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/contact_model.dart';

class ContactState extends Equatable {
  final String clabe;
  final String cardNumber;
  final double spent;
  final DateTime date;
  final String bill;
  final String voucher;

  ContactState({
    this.clabe = '',
    this.cardNumber = '',
    this.spent = 0.0,
    this.bill = '',
    this.voucher = '',
    DateTime? date,
  }) : date = date ?? DateTime(2024, 6, 9, 19, 52);

  factory ContactState.fromModel(ContactModel model) {
    return ContactState(
        clabe: model.clabe,
        cardNumber: model.cardNumber,
        spent: model.spent,
        bill: model.bill,
        voucher: model.voucher);
  }

  ContactState copyWith(
      {String? clabe,
      String? cardNumber,
      double? spent,
      DateTime? date,
      String? bill,
      String? voucher,
      bool? isValid}) {
    return ContactState(
        clabe: this.clabe,
        cardNumber: this.cardNumber,
        spent: this.spent,
        bill: this.bill,
        voucher: this.voucher,
        date: this.date);
  }

  @override
  List<Object> get props => [clabe, cardNumber, spent, date, bill, voucher];
}
