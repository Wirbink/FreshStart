import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/domain/Bloc/from_amount_cash_event.dart';
import 'package:fresh_start/domain/Bloc/from_amount_cash_state%20.dart';
import 'package:fresh_start/domain/models/amount_cash_express_model.dart';
import 'package:fresh_start/domain/usecases/load_amount_cash_data.dart';


class AmountCashBloc extends Bloc<AmountCashEvent, AmountCashState> {
  final LoadAmountCash loadAmountCash;

  AmountCashBloc(this.loadAmountCash)
      : super(const AmountCashState(
          pay: '',
          account: '',
          clabeDestination: 0,
          date: '',
          hour: '',
          withdrawalKey: '',
          securityCode: 0,
          amount: 0,
        )) {
    on<LoadAmountCashData>((event, emit) async {
      final amountCashData = await loadAmountCash();
      emit(AmountCashState.fromModel(amountCashData));
    });

    on<PayChanged>((event, emit) {
      emit(state.copyWith(pay: event.pay, isValid: _validateForm()));
    });
    on<AccountChanged>((event, emit) {
      emit(state.copyWith(account: event.account, isValid: _validateForm()));
    });
    on<ClabeDestinationChanged>((event, emit) {
      emit(state.copyWith(clabeDestination: event.clabeDestination, isValid: _validateForm()));
    });
    on<DateChanged>((event, emit) {
      emit(state.copyWith(date: event.date, isValid: _validateForm()));
    });
    on<HourChanged>((event, emit) {
      emit(state.copyWith(hour: event.hour, isValid: _validateForm()));
    });
    on<WithdrawalKeyChanged>((event, emit) {
      emit(state.copyWith(withdrawalKey: event.withdrawalKey, isValid: _validateForm()));
    });
    on<SecurityCodeChanged>((event, emit) {
      emit(state.copyWith(securityCode: event.securityCode, isValid: _validateForm()));
    });
    on<AmountChanged>((event, emit) {
      emit(state.copyWith(amount: event.amount, isValid: _validateForm()));
    });
    on<SubmitAmountCash>((event, emit) {
      if (state.isValid) {
        // Aquí podrías agregar la lógica para manejar la sumisión del formulario
      }
    });
  }

  bool _validateForm() {
    final model = state;
    return model.pay.isNotEmpty &&
        model.account.isNotEmpty &&
        model.clabeDestination.toString().length == 18 &&
        model.date.isNotEmpty &&
        model.hour.isNotEmpty &&
        model.withdrawalKey.isNotEmpty &&
        model.securityCode > 0 &&
        model.amount > 0;
  }
}