import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/features/auth/data/models/register_model.dart';
import 'package:fresh_start/features/auth/domain/usecases/register_usecase.dart';

part 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;

  RegisterBloc({required this.registerUsecase}) : super(RegisterIntial()) {
    on<SubmitRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final failureOrSuccess = await registerUsecase(RegisterParams(register: event.register));
      emit(
        failureOrSuccess.fold(
          (failure) {
            if (failure is ValidationFailure) {
              return RegisterError(message: failure.errorMessages.first);
            } else {
              return RegisterError(message: failure.message);
            }
          },
          (_) => RegisterSuccess(),
        )
      );
    });
  }
}
