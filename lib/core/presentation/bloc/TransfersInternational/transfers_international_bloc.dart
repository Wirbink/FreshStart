import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/TransfersInternational/transfers_international_event.dart';
import 'package:fresh_start/core/presentation/bloc/TransfersInternational/transfers_international_state.dart';
import 'package:fresh_start/domain/usecases/Transfers/transfers_international_data.dart';

class TransfersInternationalBloc
    extends Bloc<TransfersInternationalEvent, TransfersInternationalState> {
  final TransfersInternationalData transfersInternationalData;

  TransfersInternationalBloc(this.transfersInternationalData)
      : super(TransfersInternationalState(
            senderName: '',
            cardNumber: '',
            recipientName: '',
            cardNumberRecipient: '',
            currencyConvert: '',
            amountConvert: 0.0,
            currency: '',
            equivalent: 0.0,
            comission: 0.0,
            amount: 0.0,
            convert: '',
            date: DateTime(2024, 6, 9, 19, 52))) {
    on<LoadTransfersInternationalDataEvent>((event, emit) async {
      final transferInternational = await transfersInternationalData();
      emit(TransfersInternationalState.fromModel(transferInternational));
    });

    on<SenderNameChanged>((event, emit) {
      emit(state.copyWith(
          senderName: event.senderName,
          isValid: _validateTransfersInternational()));
    });

    on<CardNumberChanged>((event, emit) {
      String formattedCardNumber = _formatCardNumber(event.cardNumber);
      emit(state.copyWith(
          cardNumber: formattedCardNumber,
          isValid: _validateTransfersInternational()));
    });

    on<RecipientNameChanged>((event, emit) {
      emit(state.copyWith(
          recipientName: event.recipientName,
          isValid: _validateTransfersInternational()));
    });

    on<CardNumberRecipientChanged>((event, emit) {
      emit(state.copyWith(
          cardNumberRecipient: event.cardNumberRecipient,
          isValid: _validateTransfersInternational()));
    });

    on<CurrencyConvertChanged>((event, emit) {
      emit(state.copyWith(
          currencyConvert: event.currencyConvert,
          isValid: _validateTransfersInternational()));
    });

    on<AmountConvertChanged>((event, emit) {
      emit(state.copyWith(
          amountConvert: event.amountConvert,
          isValid: _validateTransfersInternational()));
    });

    on<CurrencyChanged>((event, emit) {
      emit(state.copyWith(
          currency: event.currency,
          isValid: _validateTransfersInternational()));
    });

    on<EquivalentChanged>((event, emit) {
      emit(state.copyWith(
          equivalent: event.equivalent,
          isValid: _validateTransfersInternational()));
    });

    on<ComissionChanged>((event, emit) {
      emit(state.copyWith(comission: event.comission, isValid: _validateTransfersInternational()));
    });

    on<AmountChanged>((event, emit) {
      emit(state.copyWith(amount: event.amount, isValid: _validateTransfersInternational()));
    });

    on<ConvertChanged>((event, emit) {
      emit(state.copyWith(convert: event.convert, isValid: _validateTransfersInternational()));
    });

    on<DateChanged>((event, emit) {
      emit(state.copyWith(date: event.date, isValid: _validateTransfersInternational()));
    });
  }
  bool _validateTransfersInternational() {
    final model = state;
    return model.senderName.isNotEmpty &&
        model.cardNumber.isNotEmpty &&
        model.recipientName.isNotEmpty &&
        model.cardNumberRecipient.isNotEmpty &&
        model.currencyConvert.isNotEmpty &&
        model.amountConvert != null &&
        model.currency.isNotEmpty &&
        model.equivalent != null &&
        model.comission != null &&
        model.amount != null &&
        model.convert.isNotEmpty;
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
