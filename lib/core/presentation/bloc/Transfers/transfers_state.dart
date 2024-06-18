import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_model.dart';

class TransfersState extends Equatable {
  final String bankName;
  final String senderName;
  final String cardNumber;
  final DateTime date;
  final String recipientName;
  final String cardNumberRecipient;
  final double amount;
  final String concept;

  TransfersState({
    this.bankName = '',
    this.senderName = '',
    this.cardNumber = '',
    this.recipientName = '',
    this.cardNumberRecipient = '',
    this.amount = 200000.00,
    this.concept = '',
    DateTime? date,
  }) : date = date ?? DateTime(2024, 6, 9, 19, 52);

  factory TransfersState.fromModel(TransfersModel model) {
    return TransfersState(
        bankName: model.bankName,
        senderName: model.senderName,
        cardNumber: model.cardNumber,
        recipientName: model.recipientName,
        cardNumberRecipient: model.cardNumberRecipient,
        amount: model.amount,
        concept: model.concept);
  }

  TransfersState copyWith(
      {String? bankName,
      String? senderName,
      String? cardNumber,
      DateTime? date,
      String? recipientName,
      String? cardNumberRecipient,
      double? amount,
      String? concept,
      bool? isValid}) {
    return TransfersState(
        bankName: this.bankName,
        senderName: this.senderName,
        cardNumber: this.cardNumber,
        date: this.date,
        recipientName: this.recipientName,
        cardNumberRecipient: this.cardNumberRecipient,
        amount: this.amount,
        concept: this.concept);
  }

  @override
  List<Object> get props => [
        bankName,
        senderName,
        cardNumber,
        date,
        recipientName,
        cardNumberRecipient,
        amount,
        concept
      ];
}
