import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/amount_model.dart';
import 'package:fresh_start/domain/models/bank_details_model.dart';

abstract class InternationalTransferEvent extends Equatable {
  const InternationalTransferEvent();

  @override
  List<Object?> get props => [];
}

class LoadInternationalTransferDataEvent extends InternationalTransferEvent {}

class TransactionDateChanged extends InternationalTransferEvent {
  final DateTime transactionDate;

  const TransactionDateChanged(this.transactionDate);

  @override
  List<Object?> get props => [transactionDate];
}

class SenderChanged extends InternationalTransferEvent {
  final BankDeatilModel sender;

  const SenderChanged(this.sender);

  @override
  List<Object?> get props => [sender];
}

class RecipientChanged extends InternationalTransferEvent {
  final BankDeatilModel recipient;

  const RecipientChanged(this.recipient);

  @override
  List<Object?> get props => [recipient];
}

class AmountChanged extends InternationalTransferEvent {
  final AmountModel amount;

  const AmountChanged(this.amount);

  @override
  List<Object?> get props => [amount];
}

class ExchangeRateChanged extends InternationalTransferEvent {
  final double exchangeRate;

  const ExchangeRateChanged(this.exchangeRate);

  @override
  List<Object?> get props => [exchangeRate];
}

class FeeChanged extends InternationalTransferEvent {
  final AmountModel fee;

  const FeeChanged(this.fee);

  @override
  List<Object?> get props => [fee];
}

class ConceptChanged extends InternationalTransferEvent {
  final String concept;

  const ConceptChanged(this.concept);

  @override
  List<Object?> get props => [concept];
}

class InternationalTransactionSubmitted extends InternationalTransferEvent {}
