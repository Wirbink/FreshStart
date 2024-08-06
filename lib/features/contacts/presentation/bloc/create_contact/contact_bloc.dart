import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/features/contacts/data/model/create_contact_model.dart';
import 'package:fresh_start/features/contacts/domain/usecase/create_contact_usecase.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final CreateContactUseCase createContactUseCase;

  ContactBloc({required this.createContactUseCase}) : super(ContactInitial()) {
    on<SubmittedDataEvent>((event, emit) async {
      emit(ContactLoading());
      final failureOrSuccess = await createContactUseCase(
          CreateContactParams(contact: event.contact));
      failureOrSuccess.fold(
          (failure) => emit(ContactError(message: failure.message)),
          (_) => emit(ContactSuccess()));
    });
    on<ReloadEvent>((event, emit) {
      emit(ContactInitial());
    });
  }
}
