import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/tansfers_contact_state.dart';
import 'package:fresh_start/core/presentation/bloc/Transfers/transfers_contact_event.dart';
import 'package:fresh_start/domain/usecases/Transfers/contact_data.dart';

class TransfersContactBloc
    extends Bloc<TransfersContactEvent, TransfersContactsState> {
  final ContactData contactData;

  TransfersContactBloc(this.contactData)
      : super(TransfersContactsState(contacts: const [])) {
    on<LoadTranfersContactDataEvent>((event, emit) async {
      final contacts = await contactData();
      emit(TransfersContactsState.fromModel(contacts));
    });

    on<ContactsChanged>((event, emit) {
      emit(state.copyWith(contacts: event.contacts, isValid: _validateContacts()));
    });
  }

  bool _validateContacts() {
    final model = state;
    return model.contacts != null;
  }
}