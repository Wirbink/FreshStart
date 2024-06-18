import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/tranfers_event.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/transfers_state.dart';
import 'package:fresh_start/domain/usecases/Transfers/transfers_data.dart';

class TranfersBloc extends Bloc<TranfersEvent, TransfersState> {
  final TransfersData transfersData;

  TranfersBloc(this.transfersData)
      : super(TransfersState(
            bankName: '',
            senderName: '',
            cardNumber: '',
            recipientName: '',
            cardNumberRecipient: '',
            amount: 0.0,
            concept: '',
            date: DateTime(2024, 6, 9, 19, 52))) {
    on<LoadTranfersDataEvent>((event, emit) async {
      final transfer = await transfersData();
      emit(TransfersState.fromModel(transfer));
    });

    on<BankNameChanged>((event, emit) {
      emit(state.copyWith(
          bankName: event.bankName, isValid: _validateTransfers()));
    });

    on<SenderNameChanged>((event, emit) {
      emit(state.copyWith(
          senderName: event.senderName, isValid: _validateTransfers()));
    });

    on<CardNumberChanged>((event, emit) {
      String formattedCardNumber = _formatCardNumber(event.cardNumber);
      emit(state.copyWith(
          cardNumber: formattedCardNumber, isValid: _validateTransfers()));
    });

    on<DateChanged>((event, emit) {
      emit(state.copyWith(date: event.date, isValid: _validateTransfers()));
    });

    on<RecipientNameChanged>((event, emit) {
      emit(state.copyWith(
          recipientName: event.recipientName, isValid: _validateTransfers()));
    });

    on<CardNumberRecipientChanged>((event, emit) {
      emit(state.copyWith(
          cardNumberRecipient: event.cardNumberRecipient,
          isValid: _validateTransfers()));
    });

    on<AmountChanged>((event, emit) {
      emit(state.copyWith(amount: event.amount, isValid: _validateTransfers()));
    });

    on<ConcepChanged>((event, emit) {
      emit(state.copyWith(
          concept: event.concept, isValid: _validateTransfers()));
    });
  }
  bool _validateTransfers() {
    final model = state;
    return model.bankName.isNotEmpty &&
        model.senderName.isNotEmpty &&
        model.cardNumber.isNotEmpty &&
        model.date != null &&
        model.recipientName.isNotEmpty &&
        model.cardNumberRecipient.isNotEmpty &&
        model.amount != null &&
        model.concept.isNotEmpty;
  }

  String _formatCardNumber(String cardNumber) {
    if (cardNumber.length >= 4) {
      String visiblePart = cardNumber.substring(cardNumber.length - 4);
      String hiddenPart = cardNumber
          .substring(0, cardNumber.length - 4)
          .replaceAllMapped(RegExp(r'•{4}'), (match) => '${match.group(0)}.');
      return hiddenPart + visiblePart;
    } else {
      return cardNumber;
    }
  }
}
