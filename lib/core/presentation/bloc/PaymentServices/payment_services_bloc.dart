import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/PaymentServices/payment_services_event.dart';
import 'package:fresh_start/core/presentation/bloc/PaymentServices/payment_services_state.dart';
import 'package:fresh_start/domain/usecases/PaymentServices/payment_data.dart';

class PaymentServicesBloc
    extends Bloc<PaymentServicesEvent, PaymentServicesState> {
  final PaymentServicesData paymentServicesData;

  PaymentServicesBloc(this.paymentServicesData)
      : super(PaymentServicesState(
            name: '',
            cardNumber: '',
            date: DateTime(2024, 6, 9, 19, 52),
            serviceName: '',
            serviceReference: '',
            amount: 0.0)) {
    on<LoadPaymentServicesDataEvent>((event, emit) async {
      final paymentServices = await paymentServicesData();
      emit(PaymentServicesState.fromModel(paymentServices));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(
          name: event.name, isValid: _validatePaymentServices()));
    });

    on<CardNumberChanged>((event, emit) {
      String formattedCardNumber = _formatCardNumber(event.cardNumber);
      emit(state.copyWith(
          cardNumber: formattedCardNumber,
          isValid: _validatePaymentServices()));
    });

    on<DateChanged>((event, emit) {
      emit(state.copyWith(
          date: event.date, isValid: _validatePaymentServices()));
    });

    on<ServiceNameChanged>((event, emit) {
      emit(state.copyWith(
          serviceName: event.serviceName, isValid: _validatePaymentServices()));
    });

    on<ServiceReferenceChanged>((event, emit) {
      emit(state.copyWith(
          serviceReference: event.serviceReference,
          isValid: _validatePaymentServices()));
    });

    on<AmountChanged>((event, emit) {
      emit(state.copyWith(
          amount: event.amount, isValid: _validatePaymentServices()));
    });
  }

  bool _validatePaymentServices() {
    final model = state;
    return model.name.isEmpty &&
        model.cardNumber.isNotEmpty &&
        model.date != null &&
        model.serviceName.isNotEmpty &&
        model.serviceReference.isNotEmpty &&
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
