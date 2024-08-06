import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/features/transferences/data/model/transference_specific_model.dart';
import 'package:fresh_start/features/transferences/domain/usecases/transferences_specific_usecase.dart';

part 'transference_event.dart';
part 'transference_state.dart';

class TransferenceBloc extends Bloc<TransferenceEvent, TransferenceState> {
  final TransferencesSpecificUseCase transferenceUseCase;

  TransferenceBloc({required this.transferenceUseCase})
      : super(TransferenceInitial()) {
    on<GetDataEvent>((event, emit) async {
      emit(TransferenceLoading());
      final failureOrSuccess = await transferenceUseCase(event.id);
      failureOrSuccess.fold(
          (transferencesFailure) =>
              emit(TransferenceError(message: transferencesFailure.message)),
          (transference) =>
              emit(TransferenceSuccess(transference: transference)));
    });
  }
}
