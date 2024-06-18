import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/CoDi/codi_event.dart';
import 'package:fresh_start/core/presentation/bloc/CoDi/codi_state.dart';
import 'package:fresh_start/domain/usecases/CoDi/codi_data.dart';

class CodiBloc extends Bloc<CodiEvent, CodiState> {
  final CodiData codiData;

  CodiBloc(this.codiData)
      : super(const CodiState(
            cardNumber: '',
            balance: 0.0,
            vencimiento: '',
            cvv: '',
            amount: 0.0,
            concept: '')) {
    on<LoadCodiDataEvent>((event, emit) async {
      final codi = await codiData();
      emit(CodiState.fromModel(codi));
    });

    on<CardNumberChanged>((event, emit) {
      String formattedCardNumber = _formatCardNumber(event.cardNumber);
      emit(state.copyWith(
          cardNumber: formattedCardNumber, isValid: _validateCodi()));
    });

    on<BalanceChanged>((event, emit) {
      emit(state.copyWith(balance: event.balance, isValid: _validateCodi()));
    });

    on<VencimientoChanged>((event, emit) {
      emit(state.copyWith(
          vencimiento: event.vencimiento, isValid: _validateCodi()));
    });

    on<CvvChanged>((event, emit) {
      emit(state.copyWith(cvv: event.cvv, isValid: _validateCodi()));
    });

    on<AmountChanged>((event, emit) {
      emit(state.copyWith(amount: event.amount, isValid: _validateCodi()));
    });

    on<ConceptChanged>((event, emit) {
      emit(state.copyWith(concept: event.concept, isValid: _validateCodi()));
    });
  }

  bool _validateCodi() {
    final model = state;
    return model.cardNumber.isNotEmpty &&
        model.balance != null &&
        model.vencimiento.isNotEmpty &&
        model.cvv.isNotEmpty &&
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
