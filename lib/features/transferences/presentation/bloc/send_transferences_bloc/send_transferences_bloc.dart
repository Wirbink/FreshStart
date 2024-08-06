import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/features/transferences/data/model/send_transferences_model.dart';
import 'package:fresh_start/features/transferences/domain/usecases/send_transferences_usecase.dart';

part 'send_transferences_event.dart';
part 'send_transferences_state.dart';

class SendTransferencesBloc
    extends Bloc<SendTransferencesEvent, SendTransferencesState> {
  final SendTransferencesUseCase sendTransferencesUseCase;

  SendTransferencesBloc({required this.sendTransferencesUseCase})
      : super(SendTransferencesInitial()) {
    on<SubmittedDataEvent>((event, emit) async {
      emit(SendTransferencesLoading());
      final failureOrSuccess = await sendTransferencesUseCase(
          SendTransferencesParams(transference: event.transference));
      failureOrSuccess.fold(
          (failure) => emit(SendTransferencesError(message: failure.message)),
          (_) => emit(SendTransferencesSuccess()));
    });
    on<ReloadEvent>((event, emit) async {
      emit(SendTransferencesInitial());
    });
  }
}
