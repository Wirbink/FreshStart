import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/amount_model.dart';
import 'package:fresh_start/domain/models/bank_details_model.dart';
import 'package:fresh_start/domain/models/international_transfer_model.dart';

class InternationalTransferState extends Equatable {
  final DateTime? transactionDate;
  final BankDeatilModel sender;
  final BankDeatilModel recipient;
  final AmountModel amount;
  final double exchangeRate;
  final AmountModel fee;
  final String? concept;

  InternationalTransferState({
    this.transactionDate,
    BankDeatilModel? sender,
    BankDeatilModel? recipient,
    AmountModel? amount,
    double? exchangeRate,
    AmountModel? fee,
    this.concept,
  })  : sender = sender ?? BankDeatilModel(),
        recipient = recipient ?? BankDeatilModel(),
        amount = amount ?? AmountModel(),
        exchangeRate = exchangeRate ?? 1.0,
        fee = fee ?? AmountModel();

  factory InternationalTransferState.fromModel(InternationalTransferModel model) {
    return InternationalTransferState(
      transactionDate: model.transactionDate,
      sender: model.sender,
      recipient: model.recipient,
      amount: model.amount,
      exchangeRate: model.exchangeRate,
      fee: model.fee,
      concept: model.concept,
    );
  }

  InternationalTransferState copyWith({
    DateTime? transactionDate,
    BankDeatilModel? sender,
    BankDeatilModel? recipient,
    AmountModel? amount,
    double? exchangeRate,
    AmountModel? fee,
    String? concept,
  }) {
    return InternationalTransferState(
      transactionDate: transactionDate ?? this.transactionDate,
      sender: sender ?? this.sender,
      recipient: recipient ?? this.recipient,
      amount: amount ?? this.amount,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      fee: fee ?? this.fee,
      concept: concept ?? this.concept,
    );
  }

  @override
  List<Object?> get props => [
        transactionDate,
        sender,
        recipient,
        amount,
        exchangeRate,
        fee,
        concept,
      ];
}
