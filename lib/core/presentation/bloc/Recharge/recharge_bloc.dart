import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Recharge/recharge_event.dart';
import 'package:fresh_start/core/presentation/bloc/Recharge/recharge_state.dart';
import 'package:fresh_start/domain/usecases/Recharges/recharges_data.dart';

class RechargeBloc extends Bloc<RechargeEvent, RechargeState> {
  final RechargesData rechargesData;

  RechargeBloc(this.rechargesData)
      : super(RechargeState(
          name: '',
          cardNumber: '',
          date: DateTime(2024, 6, 17, 10, 30),
          type: '',
          phoneNumber: '',
          payment: '',
          amount: 0.0,
        )) {
    on<LoadRechargeDataEvent>((event, emit) async {
      final recharge = await rechargesData();
      emit(RechargeState.fromModel(recharge));
    });

    on<NameRecharge>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateRecharge()));
    });

    on<CardNumberChanged>((event, emit) {
      String formattedCardNumber = _formatCardNumber(event.cardNumber);
      emit(state.copyWith(
          cardNumber: formattedCardNumber, isValid: _validateRecharge()));
    });

    on<DateChanged>((event, emit) {
      emit(state.copyWith(date: event.date, isValid: _validateRecharge()));
    });

    on<TypeChanged>((event, emit) {
      emit(state.copyWith(type: event.type, isValid: _validateRecharge()));
    });

    on<PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(
          phoneNumber: event.phoneNumber, isValid: _validateRecharge()));
    });

    on<PaymentChanged>((event, emit) {
      emit(
          state.copyWith(payment: event.payment, isValid: _validateRecharge()));
    });

    on<AmountChanged>((event, emit) {
      emit(state.copyWith(amount: event.amount, isValid: _validateRecharge()));
    });
  }
  bool _validateRecharge() {
    final model = state;
    return model.name.isNotEmpty &&
        model.cardNumber.isNotEmpty &&
        model.date != null &&
        model.type.isNotEmpty &&
        model.phoneNumber.isNotEmpty &&
        model.payment.isNotEmpty &&
        model.amount != null;
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
