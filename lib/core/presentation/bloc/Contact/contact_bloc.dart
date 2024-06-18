import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Contact/contact_event.dart';
import 'package:fresh_start/core/presentation/bloc/Contact/contact_state.dart';
import 'package:fresh_start/domain/usecases/Transfers/contact_data.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactData contactData;

  ContactBloc(this.contactData)
      : super(ContactState(
            clabe: '',
            cardNumber: '',
            spent: 0.0,
            date: DateTime(2024, 6, 9, 19, 52),
            bill: '',
            voucher: '')) {
    on<LoadContactDataEvent>((event, emit) async {
      final contact = await contactData();
      emit(ContactState.fromModel(contact[0]));
    });

    on<ClabeChanged>((event, emit) {
      emit(state.copyWith(clabe: event.clabe, isValid: _validateContact()));
    });

    on<CardNumberChanged>((event, emit) {
      String formattedCardNumber = _formatCardNumber(event.cardNumber);
      emit(state.copyWith(
          cardNumber: formattedCardNumber, isValid: _validateContact()));
    });

    on<SpentChanged>((event, emit) {
      emit(state.copyWith(spent: event.spent, isValid: _validateContact()));
    });

    on<DateChanged>((event, emit) {
      emit(state.copyWith(date: event.date, isValid: _validateContact()));
    });

    on<BillChanged>((event, emit) {
      emit(state.copyWith(bill: event.bill, isValid: _validateContact()));
    });

    on<VoucherChanged>((event, emit) {
      emit(state.copyWith(voucher: event.voucher, isValid: _validateContact()));
    });
  }

  bool _validateContact() {
    final model = state;
    return model.clabe.isNotEmpty &&
        model.cardNumber.isNotEmpty &&
        model.spent != null &&
        model.date != null &&
        model.bill.isNotEmpty &&
        model.voucher.isNotEmpty;
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
