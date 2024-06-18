import 'package:equatable/equatable.dart';

abstract class TranfersEvent extends Equatable {
  const TranfersEvent();

  @override
  List<Object> get props => [];
}

class LoadTranfersDataEvent extends TranfersEvent {}

class BankNameChanged extends TranfersEvent {
  final String bankName;

  const BankNameChanged(this.bankName);

  @override
  List<Object> get props => [bankName];
}

class SenderNameChanged extends TranfersEvent {
  final String senderName;

  const SenderNameChanged(this.senderName);

  @override
  List<Object> get props => [senderName];
}

class CardNumberChanged extends TranfersEvent {
  final String cardNumber;

  const CardNumberChanged(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];
}

class DateChanged extends TranfersEvent {
  final DateTime date;

  const DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class RecipientNameChanged extends TranfersEvent {
  final String recipientName;

  const RecipientNameChanged(this.recipientName);

  @override
  List<Object> get props => [recipientName];
}

class CardNumberRecipientChanged extends TranfersEvent {
  final String cardNumberRecipient;

  const CardNumberRecipientChanged(this.cardNumberRecipient);

  @override
  List<Object> get props => [cardNumberRecipient];
}

class AmountChanged extends TranfersEvent {
  final double amount;

  const AmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class ConcepChanged extends TranfersEvent {
  final String concept;

  const ConcepChanged(this.concept);

  @override
  List<Object> get props => [concept];
}

class TransfersSubmitted extends TranfersEvent {}