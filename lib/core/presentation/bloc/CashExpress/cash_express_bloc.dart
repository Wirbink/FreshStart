import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/CashExpress/cash_express_event.dart';
import 'package:fresh_start/core/presentation/bloc/CashExpress/cash_express_state.dart';
import 'package:fresh_start/domain/usecases/CashExpress/cash_express_data.dart';

class CashExpressBloc extends Bloc<CashExpressEvent, CashExpressState> {
  final CashExpressData cashExpressData;

  CashExpressBloc(this.cashExpressData)
      : super(CashExpressState(
            cardNumber: '',
            balance: 0.0,
            vencimiento: '',
            cvv: '',
            amount: 0.0,
            sender: '',
            senderAccount: '',
            date: DateTime(2024, 6, 17, 10, 30),
            withdrawalKey: '',
            securityCode: '')) {
    on<LoadCashExpressDataEvent>((event, emit) async {
      final cashExpress = await cashExpressData();
      emit(CashExpressState.fromModel(cashExpress));
    });

    on<CardNumberChanged>((event, emit) {
      emit(state.copyWith(
          cardNumber: event.cardNumber, isValid: _validateCashExpress()));
    });

    on<BalanceChanged>((event, emit) {
      emit(state.copyWith(
          balance: event.balance, isValid: _validateCashExpress()));
    });

    on<VencimientoChanged>((event, emit) {
      emit(state.copyWith(
          vencimiento: event.vencimiento, isValid: _validateCashExpress()));
    });

    on<CvvChanged>((event, emit) {
      emit(state.copyWith(
          cvv: event.cvv, isValid: _validateCashExpress()));
    });

    on<AmountChanged>((event, emit) {
      emit(state.copyWith(
          amount: event.amount, isValid: _validateCashExpress()));
    });

    on<SenderChanged>((event, emit) {
      emit(state.copyWith(
          sender: event.sender, isValid: _validateCashExpress()));
    });

    on<SenderAccountChanged>((event, emit) {
      emit(state.copyWith(
          senderAccount: event.senderAccount, isValid: _validateCashExpress()));
    });

    on<DateChanged>((event, emit) {
      emit(state.copyWith(
          date: event.date, isValid: _validateCashExpress()));
    });

    on<WithdrawalKeyChanged>((event, emit) {
      emit(state.copyWith(
          withdrawalKey: event.withdrawalKeyChanged, isValid: _validateCashExpress()));
    });

    on<SecurityCodeChanged>((event, emit) {
      emit(state.copyWith(
          securityCode: event.securityCode, isValid: _validateCashExpress()));
    });
  }

  bool _validateCashExpress() {
    final model = state;
    return model.cardNumber.isNotEmpty &&
    model.balance != null &&
    model.vencimiento.isNotEmpty &&
    model.cvv.isNotEmpty &&
    model.amount != null &&
    model.sender.isNotEmpty &&
    model.senderAccount.isNotEmpty &&
    model.date != null &&
    model.withdrawalKey.isNotEmpty &&
    model.securityCode.isNotEmpty;
  }
}
