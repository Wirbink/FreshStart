import 'package:equatable/equatable.dart';

abstract class TransfersInternationalEvent extends Equatable {
  const TransfersInternationalEvent();

  @override
  List<Object> get props => [];
}

class LoadTransfersInternationalDataEvent extends TransfersInternationalEvent {}

class SenderNameChanged extends TransfersInternationalEvent {
  final String senderName;

  const SenderNameChanged(this.senderName);

  @override
  List<Object> get props => [senderName];
}

class CardNumberChanged extends TransfersInternationalEvent {
  final String cardNumber;

  const CardNumberChanged(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];
}

class DateChanged extends TransfersInternationalEvent {
  final DateTime date;

  const DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class RecipientNameChanged extends TransfersInternationalEvent {
  final String recipientName;

  const RecipientNameChanged(this.recipientName);

  @override
  List<Object> get props => [recipientName];
}

class CardNumberRecipientChanged extends TransfersInternationalEvent {
  final String cardNumberRecipient;

  const CardNumberRecipientChanged(this.cardNumberRecipient);

  @override
  List<Object> get props => [cardNumberRecipient];
}

class CurrencyConvertChanged extends TransfersInternationalEvent {
  final String currencyConvert;

  const CurrencyConvertChanged(this.currencyConvert);

  @override
  List<Object> get props => [currencyConvert];
}

class AmountConvertChanged extends TransfersInternationalEvent {
  final double amountConvert;

  const AmountConvertChanged(this.amountConvert);

  @override
  List<Object> get props => [amountConvert];
}

class CurrencyChanged extends TransfersInternationalEvent {
  final String currency;

  const CurrencyChanged(this.currency);

  @override
  List<Object> get props => [currency];
}

class EquivalentChanged extends TransfersInternationalEvent {
  final double equivalent;

  const EquivalentChanged(this.equivalent);

  @override
  List<Object> get props => [equivalent];
}

class ComissionChanged extends TransfersInternationalEvent {
  final double comission;

  const ComissionChanged(this.comission);

  @override
  List<Object> get props => [comission];
}

class AmountChanged extends TransfersInternationalEvent {
  final double amount;

  const AmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class ConceptChanged extends TransfersInternationalEvent {
  final String concept;

  const ConceptChanged(this.concept);

  @override
  List<Object> get props => [concept];
}

class TransfersInternationalSubmitted extends TransfersInternationalEvent {}
