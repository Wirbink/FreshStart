import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_international_model.dart';

class TransfersInternationalState extends Equatable {
  final String senderName;
  final String cardNumber;
  final DateTime date;
  final String recipientName;
  final String cardNumberRecipient;
  final String currencyConvert;
  final double amountConvert;
  final String currency;
  final double equivalent;
  final double comission;
  final double amount;
  final String concept;

  TransfersInternationalState({
    this.senderName = '',
    this.cardNumber = '',
    this.recipientName = '',
    this.cardNumberRecipient = '',
    this.currencyConvert = '',
    this.amountConvert = 0.0,
    this.currency = '',
    this.equivalent = 0.0,
    this.comission = 0.0,
    this.amount = 10000.00,
    this.concept = '',
    DateTime? date,
  }) : date = date ?? DateTime(2024, 6, 9, 19, 52);

  factory TransfersInternationalState.fromModel(
      TransfersInternationalModel model) {
    return TransfersInternationalState(
        senderName: model.senderName,
        cardNumber: model.cardNumber,
        recipientName: model.recipientName,
        cardNumberRecipient: model.cardNumberRecipient,
        currencyConvert: model.currencyConvert,
        amountConvert: model.amountConvert,
        currency: model.currency,
        equivalent: model.equivalent,
        comission: model.comission,
        amount: model.amount,
        concept: model.concept);
  }

  TransfersInternationalState copyWith(
      {String? senderName,
      String? cardNumber,
      DateTime? date,
      String? recipientName,
      String? cardNumberRecipient,
      String? currencyConvert,
      double? amountConvert,
      String? currency,
      double? equivalent,
      double? comission,
      double? amount,
      String? concept,
      bool? isValid}) {
    return TransfersInternationalState(
        senderName: this.senderName,
        cardNumber: this.cardNumber,
        date: this.date,
        recipientName: this.recipientName,
        cardNumberRecipient: this.cardNumberRecipient,
        currencyConvert: this.currencyConvert,
        amountConvert: this.amountConvert,
        currency: this.currency,
        equivalent: this.equivalent,
        comission: this.comission,
        amount: this.amount,
        concept: this.concept);
  }

  @override
  List<Object> get props => [
        senderName,
        cardNumber,
        date,
        recipientName,
        cardNumberRecipient,
        currencyConvert,
        amountConvert,
        currency,
        equivalent,
        comission,
        amount,
        concept
      ];
}
