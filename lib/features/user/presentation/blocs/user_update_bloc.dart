import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/user/data/models/user_model.dart';
import 'package:fresh_start/features/user/data/models/user_update_model.dart';
import 'package:fresh_start/features/user/domain/usecases/user_update_usecase.dart';
import 'package:fresh_start/features/user/domain/usecases/user_usecase.dart';

part 'user_update_event.dart';
part 'user_update_state.dart';

class UserUpdateBloc extends Bloc<UserUpdateEvent, UserUpdateState> {
  final UserUseCase userUseCase;
  final UserUpdateUseCase userUpdateUseCase;

  UserUpdateBloc({required this.userUseCase, required this.userUpdateUseCase})
      : super(UserUpdateInitial()) {
    on<GetDataEvent>((event, emit) async {
      emit(UserUpdateLoading());
      final failureOrSuccess = await userUseCase(NoParams());
      failureOrSuccess.fold(
          (userFailure) =>
              emit(UserUpdateErrorLoaded(message: userFailure.message)),
          (user) => emit(UserUpdateLoaded(user: user)));
    });
    on<SubmittedDataEvent>((event, emit) async {
      emit(UserUpdateLoading());
      final failureOrSuccess =
          await userUpdateUseCase(UserUpdateParams(user: event.update));
      failureOrSuccess.fold(
          (failure) => emit(UserUpdateErrorSubmited(message: failure.message)),
          (_) => emit(UserUpdateSuccess()));
    });
  }
}
