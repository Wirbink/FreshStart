import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/add_new_contact_event.dart';
import 'package:fresh_start/core/presentation/bloc/add_new_contact_state.dart';
import 'package:fresh_start/domain/usecases/Transfers/transfers_data.dart';

class AddNewContactBloc extends Bloc<AddNewContactEvent, AddNewContactState> {
  final TransfersData transfersData;

  AddNewContactBloc(this.transfersData)
    : super(const AddNewContactState(cardNumber: '')) {
      on<LoadAddNewContactDataEvent>((event, emit) async {
        final contact = await transfersData();
        emit(AddNewContactState.fromModel(contact));
      });

      on<CardNumberChanged> ((event,emit) {
        emit(state.copyWith(
          cardNumber: event.cardNumber, isValid: _validateNewContact()
        ));
      });
    }
    
    bool _validateNewContact() {
      final model = state;
      return model.cardNumber.isEmpty;
    }
}