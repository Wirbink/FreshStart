import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/contacts/data/model/contact_model.dart';
import 'package:fresh_start/features/contacts/domain/usecase/contact_usecase.dart';

part 'list_contact_event.dart';
part 'list_contact_state.dart';

class ListContactBloc extends Bloc<ListContactEvent, ListContactState> {
  final ContactUseCase contactUseCase;

  ListContactBloc({required this.contactUseCase})
      : super(ListContactInitial()) {
    on<GetDataEvent>((event, emit) async {
      emit(ListContactLoading());
      final failureOrSuccess = await contactUseCase(NoParams());
      failureOrSuccess.fold(
          (failure) => emit(ListContactError(message: failure.message)),
          (contact) => emit(ListContactSuccess(contact: contact)));
    });
  }
}
